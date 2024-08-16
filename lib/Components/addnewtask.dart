// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAlertBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const MyAlertBox({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: theme.colorScheme.background,
      content: TextField(
        controller: controller,
        style:  TextStyle(color: theme.textTheme.bodyMedium?.color),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: theme.textTheme.bodyMedium?.color),
          enabledBorder: OutlineInputBorder(
            borderRadius:  const BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: theme.colorScheme.primary)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:  theme.colorScheme.primary)),

        ),
      ),
      actions: [
        MaterialButton(
          onPressed: onSave,
          child: Text(
            "Save",
            style: GoogleFonts.rubik(color: theme.textTheme.bodyMedium?.color),
          ),
          color: theme.colorScheme.primary,
        ),
        MaterialButton(
          onPressed: onCancel,
          child: Text(
            "Cancel",
            style: GoogleFonts.rubik(color: theme.textTheme.bodyMedium?.color),
          ),
          color: theme.colorScheme.primary,
        ),
      ],
    );
  }
}
