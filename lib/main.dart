import 'package:flutter/material.dart';

//Routes
import 'package:componentes/src/routes/routes.dart';
// Pages
import 'package:componentes/src/pages/alert_page.dart';
// Localizacion
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Localizacion
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
        const Locale.fromSubtags(
            languageCode: 'zh'), // Chinese *See Advanced Locales below*
      ],
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //home: HomeTempPage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      // Rutas aparte
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
