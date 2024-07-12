import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'locale_provider.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    final customTheme =
        _buildTheme(context, localeProvider.locale.languageCode);
    final baseTheme = ThemeData.light().copyWith();

    return MaterialApp.router(
      title: 'Boycott Game',
      // Initialize localization
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      locale: localeProvider.locale,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
          }
        }
        return supportedLocales.first;
      },
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: baseTheme.copyWith(
        textTheme: customTheme.textTheme,
        dialogBackgroundColor: customTheme.dialogBackgroundColor,
        appBarTheme: customTheme.appBarTheme,
      ),
    );
  }

  ThemeData _buildTheme(BuildContext context, String languageCode) {
    if (languageCode == 'ar') {
      return ThemeData(
        dialogBackgroundColor: Colors.white,
        textTheme: GoogleFonts.cairoTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(239, 255, 255, 255),
          foregroundColor: Colors.black,
        ),
      );
    } else {
      return ThemeData(
        dialogBackgroundColor: Colors.white,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(239, 255, 255, 255),
          foregroundColor: Colors.black,
        ),
      );
    }
  }
}
