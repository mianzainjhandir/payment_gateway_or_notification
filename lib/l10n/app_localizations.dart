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
      'email': 'Email',
      'email_hint': 'sampleemail@gmail.com',
      'password': 'Password',
      'password_hint': 'Enter your password',
      'confirm_password': 'Confirm password',
      'confirm_password_hint': 'Confirm your password',
      'login_button': 'Login',
      'remember_me': 'Remember me',
      'forgot_password': 'Forgot Password?',
      'or': 'or',
      'not_registered': 'Not Registered?',
      'register': 'Register',
      'signup_title': 'Create Account',
      'signup_subtitle': 'Please complete all the information below to create your account.',
      'terms_text': 'By agreeing to the terms and conditions, you are entering to a legally binding contract with the service provider!',
      'already_have_account': 'Already have an account?',
      'password_strong': 'Your password is strongly secured 💪',
    },
    'fr': {
      'login_title': 'Connexion',
      'login_subtitle': 'Vous devez vous connecter à votre compte pour continuer',
      'email': 'E-mail',
      'email_hint': 'sampleemail@gmail.com',
      'password': 'Mot de passe',
      'password_hint': 'Entrez votre mot de passe',
      'confirm_password': 'Confirmer le mot de passe',
      'confirm_password_hint': 'Confirmez votre mot de passe',
      'login_button': 'Se connecter',
      'remember_me': 'Se souvenir de moi',
      'forgot_password': 'Mot de passe oublié ?',
      'or': 'ou',
      'not_registered': 'Pas inscrit ?',
      'register': "S'inscrire",
      'signup_title': 'Créer un compte',
      'signup_subtitle': 'Veuillez remplir toutes les informations ci-dessous pour créer votre compte.',
      'terms_text': 'En acceptant les termes et conditions, vous concluez un contrat juridiquement contraignant avec le fournisseur de services !',
      'already_have_account': 'Déjà un compte ?',
      'password_strong': 'Votre mot de passe est fortement sécurisé 💪',
    },
    'ur': {
      'login_title': 'لاگ ان',
      'login_subtitle': 'آگے بڑھنے کے لیے آپ کو اپنے اکاؤنٹ میں لاگ ان کرنا ہوگا',
      'email': 'ای میل',
      'email_hint': 'sampleemail@gmail.com',
      'password': 'پاس ورڈ',
      'password_hint': 'اپنا پاس ورڈ درج کریں',
      'confirm_password': 'پاس ورڈ کی تصدیق کریں',
      'confirm_password_hint': 'اپنے پاس ورڈ کی تصدیق کریں',
      'login_button': 'لاگ ان',
      'remember_me': 'مجھے یاد رکھیں',
      'forgot_password': 'پاس ورڈ بھول گئے؟',
      'or': 'یا',
      'not_registered': 'رجسترڈ نہیں ہیں؟',
      'register': 'رجستر کریں',
      'signup_title': 'اکاؤنٹ بنائیں',
      'signup_subtitle': 'اپنا اکاؤنٹ بنانے کے لیے براہ کرم نیچے دی گئی تمام معلومات مکمل کریں۔',
      'terms_text': 'شرائط و ضوابط سے اتفاق کر کے، آپ سروس فراہم کنندہ کے ساتھ ایک قانونی طور پر پابند معاہدہ کر رہے ہیں!',
      'already_have_account': 'پہلے سے اکاؤنٹ ہے؟',
      'password_strong': 'آپ کا پاس ورڈ مضبوطی سے محفوظ ہے 💪',
    },
    'hi': {
      'login_title': 'लॉगिन',
      'login_subtitle': 'जारी रखने के लिए आपको अपने खाते में लॉगिन करना होगा',
      'email': 'ईमेल',
      'email_hint': 'sampleemail@gmail.com',
      'password': 'पासवर्ड',
      'password_hint': 'अपना पासवर्ड दर्ज करें',
      'confirm_password': 'पासवर्ड की पुष्टि करें',
      'confirm_password_hint': 'अपने पासवर्ड की पुष्टि करें',
      'login_button': 'लॉगिन',
      'remember_me': 'मुझे याद रखें',
      'forgot_password': 'पासवर्ड भूल गए?',
      'or': 'या',
      'not_registered': 'पंजीकृत नहीं हैं?',
      'register': 'पंजीकरण करें',
      'signup_title': 'खाता बनाएं',
      'signup_subtitle': 'अपना खाता बनाने के लिए कृपया नीचे दी गई सभी जानकारी भरें।',
      'terms_text': 'नियम और शर्तों से सहमत होकर, आप सेवा प्रदाता के साथ एक कानूनी रूप से बाध्यकारी अनुबंध में प्रवेश कर रहे हैं!',
      'already_have_account': 'क्या आपके पास पहले से खाता है?',
      'password_strong': 'आपका पासवर्ड अत्यधिक सुरक्षित है 💪',
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
