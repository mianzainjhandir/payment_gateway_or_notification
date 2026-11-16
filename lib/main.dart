import 'package:advance_learning/l10n/app_localizations.dart';
import 'package:advance_learning/screens/login/view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: languageController,
      builder: (context, _) {
        final locale = languageController.locale;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Advance Learning',
          locale: locale,
          builder: (context, child) {
            return Directionality(
              textDirection: locale.languageCode == 'ur' ? TextDirection.rtl : TextDirection.ltr,
              child: child!,
            );
          },
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
            ),
            useMaterial3: true,
          ),
          home: const LoginScreen(),
        );
      },
    );
  }
}
