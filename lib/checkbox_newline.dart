import 'package:flutter/material.dart';

class CheckboxNewline extends StatelessWidget {
  const CheckboxNewline({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final Text label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 48,
              width: 20,
              child: Checkbox(
                  value: value,
                  onChanged: (bool? newValue) {
                    onChanged(newValue!);
                  }),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(child: label),
          ],
        ),
      ),
    );
  }
}
