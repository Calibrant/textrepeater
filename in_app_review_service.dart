import 'package:flutter/foundation.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Сервис для управления показом системного диалога отзывов.
/// Реализован как Singleton для глобального доступа.
class InAppReviewService {
  static final InAppReviewService instance = InAppReviewService._internal();
  InAppReviewService._internal();

  final InAppReview _inAppReview = InAppReview.instance;

  // Ключи для SharedPreferences
  static const String _kLastReviewTimestamp = 'last_review_requested_at';
  static const String _kGenerationCount = 'review_generation_count';

  // Настройки логики
  static const int _minGenerations = 5;
  static const int _minDaysBetweenRequests = 7;

  /// Увеличивает счетчик генераций текста.
  Future<void> incrementGenerationCount() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentCount = prefs.getInt(_kGenerationCount) ?? 0;
      await prefs.setInt(_kGenerationCount, currentCount + 1);
    } catch (e) {
      debugPrint('InAppReviewService: Error incrementing count: $e');
    }
  }

  /// Проверяет условия и запрашивает отзыв, если это уместно.
  /// Вызывается после успешного действия пользователя.
  Future<void> requestReviewIfAppropriate() async {
    try {
      final isAvailable = await _inAppReview.isAvailable();
      if (!isAvailable) return;

      final prefs = await SharedPreferences.getInstance();
      
      final lastReviewMillis = prefs.getInt(_kLastReviewTimestamp) ?? 0;
      final generationCount = prefs.getInt(_kGenerationCount) ?? 0;

      final lastReviewDate = DateTime.fromMillisecondsSinceEpoch(lastReviewMillis);
      final daysSinceLastReview = DateTime.now().difference(lastReviewDate).inDays;

      // Логика: 5+ генераций И прошло 7+ дней с последнего запроса (или вообще не было)
      if (generationCount >= _minGenerations && daysSinceLastReview >= _minDaysBetweenRequests) {
        
        // Запрашиваем системный диалог
        // Примечание: Мы не ждем завершения (await), так как системный API 
        // не гарантирует показ и не возвращает результат взаимодействия.
        await _inAppReview.requestReview();

        // Сбрасываем счетчик и обновляем метку времени только после вызова API
        await _resetLimits(prefs);
        
        debugPrint('InAppReviewService: System review requested.');
      }
    } catch (e) {
      debugPrint('InAppReviewService: Error during review request: $e');
    }
  }

  /// Сброс локальных счетчиков после попытки запроса отзыва.
  Future<void> _resetLimits(SharedPreferences prefs) async {
    await prefs.setInt(_kGenerationCount, 0);
    await prefs.setInt(_kLastReviewTimestamp, DateTime.now().millisecondsSinceEpoch);
  }

  /// Метод для открытия страницы приложения в сторе (например, для кнопки в настройках)
  Future<void> openStoreListing() async {
    try {
      await _inAppReview.openStoreListing();
    } catch (e) {
      debugPrint('InAppReviewService: Could not open store: $e');
    }
  }
}