import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_demo_ui/l10n/l10n.dart';

import '../../home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
            bodyMedium:
                GoogleFonts.notoSansJp(textStyle: textTheme.bodyMedium)),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomeScreen(),
    );
  }
}
