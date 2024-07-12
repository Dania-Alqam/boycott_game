// ignore_for_file: library_private_types_in_public_api

import 'package:bycott_web/constants/colors.dart';
import 'package:bycott_web/styles/buttons_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../locale_provider.dart';
import '../widgets/language.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late AppLocalizations localizations;

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              context.go('/our-goals');
            },
            child: Text(localizations.ourGoals,
                style: const TextStyle(color: Colors.white)),
          ),
          CustomDropDownWidget(provider: localeProvider),
        ],
      ),
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BG_photo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(localizations.boycottWithFun,
                  style: titleTextStyle(fontSize: 75)),
              OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  side: WidgetStateProperty.resolveWith<BorderSide>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return BorderSide(
                          color: Colors.blue.shade700,
                          width: 2,
                        );
                      }
                      return const BorderSide(color: Colors.blue);
                    },
                  ),
                  padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                  minimumSize: WidgetStateProperty.all(
                      const Size(200, 60)), // Set minimum size
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                child: Text(
                  localizations.startPlaying,
                  style: const TextStyle(color: borderColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {},
                  label: Text(
                    localizations.aboutUs,
                    style: titleTextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
