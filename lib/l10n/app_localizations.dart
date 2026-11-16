import 'package:flutter/material.dart';

class LanguageController extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      notifyListeners();
    }
  }
}

final languageController = LanguageController();

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations(languageController.locale);
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'login': 'Login',
      'welcome': 'Welcome Back!',
      'email': 'Email Address',
      'password': 'Password',
      'login_button': 'Sign In',
    },
    'fr': {
      'login': 'Connexion',
      'welcome': 'Bon retour !',
      'email': 'Adresse e-mail',
      'password': 'Mot de passe',
      'login_button': 'Se connecter',
    },
    'ur': {
      'login': 'لاگ ان',
      'welcome': 'خوش آمدید!',
      'email': 'ای میل ایڈریس',
      'password': 'پاس ورڈ',
      'login_button': 'سائن ان کریں',
    },
    'hi': {
      'login': 'लॉगिन',
      'welcome': 'वापसी पर स्वागत है!',
      'email': 'ईमेल पता',
      'password': 'पासवर्ड',
      'login_button': 'साइन इन करें',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? _localizedValues['en']?[key] ?? key;
  }
}

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: languageController,
      builder: (context, _) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Locale>(
              value: languageController.locale,
              icon: const Icon(Icons.keyboard_arrow_down, size: 20),
              items: const [
                DropdownMenuItem(value: Locale('en'), child: Text('English')),
                DropdownMenuItem(value: Locale('fr'), child: Text('Français')),
                DropdownMenuItem(value: Locale('ur'), child: Text('اردو')),
                DropdownMenuItem(value: Locale('hi'), child: Text('हिन्दी')),
              ],
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  languageController.setLocale(newLocale);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
