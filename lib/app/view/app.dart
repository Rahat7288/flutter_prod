import 'package:flutter/material.dart';
import 'package:flutter_prod/app/view/theme/light_theme.dart';
import 'package:flutter_prod/counter/counter.dart';
import 'package:flutter_prod/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CounterPage(),
    );
  }
}
