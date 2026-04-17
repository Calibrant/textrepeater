import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTileWidget extends StatelessWidget {
  ListTileWidget({
    Key? key,
    required this.iconColor,
    required this.text,
  }) : super(key: key);

  Color? iconColor;
  Widget? text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.circle, size: 30),
      iconColor: iconColor,
      title: text,
    );
  }
}