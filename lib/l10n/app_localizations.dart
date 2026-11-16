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
      'login_title': 'Login',
      'login_subtitle': 'You must login into your account to continue',
      'email': 'E-Mail',
      'email_hint': 'Enter your e-mail',
      'password': 'Password',
      'password_hint': 'Enter your password',
      'login_button': 'Login',
      'remember_me': 'Remember me',
      'forgot_password': 'Forgot Password?',
      'or': 'or',
      'not_registered': 'Not Registered?',
      'register': 'Register',
    },
    'fr': {
      'login_title': 'Connexion',
      'login_subtitle': 'Vous devez vous connecter à votre compte pour continuer',
      'email': 'E-Mail',
      'email_hint': 'Entrez votre e-mail',
      'password': 'Mot de passe',
      'password_hint': 'Entrez votre mot de passe',
      'login_button': 'Se connecter',
      'remember_me': 'Se souvenir de moi',
      'forgot_password': 'Mot de passe oublié ?',
      'or': 'ou',
      'not_registered': 'Pas inscrit ?',
      'register': 'S\'inscrire',
    },
    'ur': {
      'login_title': 'لاگ ان',
      'login_subtitle': 'آگے بڑھنے کے لیے آپ کو اپنے اکاؤنٹ میں لاگ ان کرنا ہوگا',
      'email': 'ای میل',
      'email_hint': 'اپنا ای میل درج کریں',
      'password': 'پاس ورڈ',
      'password_hint': 'اپنا پاس ورڈ درج کریں',
      'login_button': 'لاگ ان',
      'remember_me': 'مجھے یاد رکھیں',
      'forgot_password': 'پاس ورڈ بھول گئے؟',
      'or': 'یا',
      'not_registered': 'رجسترڈ نہیں ہیں؟',
      'register': 'رجستر کریں',
    },
    'hi': {
      'login_title': 'लॉगिन',
      'login_subtitle': 'जारी रखने के लिए आपको अपने खाते में लॉगिन करना होगा',
      'email': 'ईमेल',
      'email_hint': 'अपना ईमेल दर्ज करें',
      'password': 'पासवर्ड',
      'password_hint': 'अपना पासवर्ड दर्ज करें',
      'login_button': 'लॉगिन',
      'remember_me': 'मुझे याद रखें',
      'forgot_password': 'पासवर्ड भूल गए?',
      'or': 'या',
      'not_registered': 'पंजीकृत नहीं हैं?',
      'register': 'पंजीकरण करें',
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
            border: Border.all(color: Colors.grey.shade300),
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
