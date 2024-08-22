import 'package:flutter/material.dart';
import 'package:movie_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ToggleThemeButton extends StatelessWidget {
  const ToggleThemeButton({
    super.key,
    // required this.themeProvider,
  });

  // final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      onPressed: themeProvider.toggleThemeMode,
      icon: themeProvider.isDarkTheme
          ? const Icon(Icons.light_mode_outlined)
          : const Icon(Icons.dark_mode_outlined),
    );
  }
}
