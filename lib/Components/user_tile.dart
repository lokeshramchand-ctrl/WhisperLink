import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Get the current theme's color scheme
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextStyle textStyle = Theme.of(context).textTheme.bodyMedium ?? const TextStyle();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.onSurface),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              text,
              style: GoogleFonts.chivo(textStyle: textStyle),
            ),
          ],
        ),
      ),
    );
  }
}
