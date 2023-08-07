import 'package:flutter/material.dart';
import 'package:technical_test/actuality/view/list_view.dart';
import 'package:technical_test/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.white),
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
        cardColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(Colors.black),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            color: Color(0xFF909094),
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF909094),
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            color: Color(0xFF909094),
          ),
          labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ActualityListView(),
    );
  }
}
