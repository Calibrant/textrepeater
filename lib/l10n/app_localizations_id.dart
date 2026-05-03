// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get main_title => 'Tambah Teks, Ulangi, Salin dan Bagikan!';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => 'Masukkan teks Anda';

  @override
  String get label_text2 => 'Berapa kali mengulang teks?';

  @override
  String get checkbox_title => 'Buat baris baru';

  @override
  String get elevated_btn_generate => 'Generate Teks';

  @override
  String get elevated_btn_reset => 'Reset';

  @override
  String get tooltip_copy => 'Salin';

  @override
  String get tooltip_share => 'Bagikan';

  @override
  String get snackbar_text => 'Teks disalin ke clipboard!';

  @override
  String get snackbar_empty_text =>
      'Tidak ada yang bisa disalin atau dibagikan';

  @override
  String max_limit_text(Object max) {
    return 'Hingga $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'Apa yang akan Anda dapatkan:';

  @override
  String get premium_feature_no_ads => 'Penghapusan total semua iklan';

  @override
  String get premium_feature_unlimited =>
      'Hingga 100.000 pengulangan sekaligus';

  @override
  String get premium_feature_support => 'Dukungan prioritas';

  @override
  String get premium_one_time => 'Pembelian sekali — selamanya!';

  @override
  String get premium_button_buy => 'Beli PRO — \$3.99';

  @override
  String get premium_button_later => 'Nanti';

  @override
  String get share_file_name => 'teks_diulang';

  @override
  String get share_too_large =>
      'Teks terlalu besar untuk dibagikan langsung.\nGunakan \"Salin\" saja.';

  @override
  String get share_error => 'Gagal membagikan';

  @override
  String copy_limit_exceeded(Object max) {
    return 'Penyalinan hanya tersedia hingga $max baris.\nGunakan \"Bagikan\" untuk teks yang lebih besar.';
  }

  @override
  String get copy_too_large => 'Gagal menyalin teks';

  @override
  String get limit_free => 'Hingga 2000';

  @override
  String get limit_premium => 'Hingga 100000';

  @override
  String get drawer_header => 'Aplikasi Text Repeater';

  @override
  String get drawer_title_rate => 'Beri rating aplikasi ini';

  @override
  String get drawer_title_privacy => 'Kebijakan Privasi';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Inggris',
        'fr': 'Prancis',
        'es': 'Spanyol',
        'de': 'Jerman',
        'id': 'Indonesia',
        'ko': 'Korea',
        'pt': 'Portugis',
        'ru': 'Rusia',
        'ja': 'Jepang',
        'other': 'Lainnya',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'pengulangan teks';

  @override
  String get purchase_next_update =>
      'Pembelian akan tersedia di update berikutnya.';

  @override
  String get no_items => 'Tidak ada item';
}

/// The translations for Indonesian, as used in Indonesia (`id_ID`).
class AppLocalizationsIdId extends AppLocalizationsId {
  AppLocalizationsIdId() : super('id_ID');

  @override
  String get main_title => 'Tambah Teks, Ulangi, Salin dan Bagikan!';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => 'Masukkan teks Anda';

  @override
  String get label_text2 => 'Berapa kali mengulang teks?';

  @override
  String get checkbox_title => 'Buat baris baru';

  @override
  String get elevated_btn_generate => 'Generate Teks';

  @override
  String get elevated_btn_reset => 'Reset';

  @override
  String get tooltip_copy => 'Salin';

  @override
  String get tooltip_share => 'Bagikan';

  @override
  String get snackbar_text => 'Teks disalin ke clipboard!';

  @override
  String get snackbar_empty_text =>
      'Tidak ada yang bisa disalin atau dibagikan';

  @override
  String max_limit_text(Object max) {
    return 'Hingga $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'Apa yang akan Anda dapatkan:';

  @override
  String get premium_feature_no_ads => 'Penghapusan total semua iklan';

  @override
  String get premium_feature_unlimited =>
      'Hingga 100.000 pengulangan sekaligus';

  @override
  String get premium_feature_support => 'Dukungan prioritas';

  @override
  String get premium_one_time => 'Pembelian sekali — selamanya!';

  @override
  String get premium_button_buy => 'Beli PRO — \$3.99';

  @override
  String get premium_button_later => 'Nanti';

  @override
  String get share_file_name => 'teks_diulang';

  @override
  String get share_too_large =>
      'Teks terlalu besar untuk dibagikan langsung.\nGunakan \"Salin\" saja.';

  @override
  String get share_error => 'Gagal membagikan';

  @override
  String copy_limit_exceeded(Object max) {
    return 'Penyalinan hanya tersedia hingga $max baris.\nGunakan \"Bagikan\" untuk teks yang lebih besar.';
  }

  @override
  String get copy_too_large => 'Gagal menyalin teks';

  @override
  String get limit_free => 'Hingga 2000';

  @override
  String get limit_premium => 'Hingga 100000';

  @override
  String get drawer_header => 'Aplikasi Text Repeater';

  @override
  String get drawer_title_rate => 'Beri rating aplikasi ini';

  @override
  String get drawer_title_privacy => 'Kebijakan Privasi';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Inggris',
        'fr': 'Prancis',
        'es': 'Spanyol',
        'de': 'Jerman',
        'id': 'Indonesia',
        'ko': 'Korea',
        'pt': 'Portugis',
        'ru': 'Rusia',
        'ja': 'Jepang',
        'other': 'Lainnya',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'pengulangan teks';

  @override
  String get purchase_next_update =>
      'Pembelian akan tersedia di update berikutnya.';

  @override
  String get no_items => 'Tidak ada item';
}
