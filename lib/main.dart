import 'package:bravoo/Screens/home_screen.dart';
import 'package:bravoo/Screens/login.dart';
import 'package:bravoo/Screens/onboarding.dart';
import 'package:bravoo/Screens/signup.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const supabaseUrl = 'https://nkesmgyggbbhpydstyun.supabase.co';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: dotenv.env['SUPABASE_KEY']!,
  );
  // final prefs = await SharedPreferences.getInstance();
  // final hasCompletedOnboarding = prefs.getBool('onboarding_completed') ?? false;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final bool showOnboarding;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bravoo Mobile App',
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}
