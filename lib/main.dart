import 'package:flutter/material.dart';
import 'package:project_akhir/screen/home_screen.dart';
import 'package:project_akhir/screen/login_screen.dart';
import 'package:project_akhir/screen/register_screen.dart';
import 'package:project_akhir/screen/scan_screen';
import 'package:project_akhir/screen/splash_screen.dart';

void main() {
  runApp(const ProjectAkhir1App());
}

class ProjectAkhir1App extends StatelessWidget {
  const ProjectAkhir1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealtyIn',
      theme: ThemeData(
        primaryColor: const Color(0xFF0288D1),
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0288D1)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/register':
            page = const RegisterScreen();
            break;
          case '/home':
            page = const HomeScreen();
            break;
          case '/scan':
            page = const ScanScreen();
            break;
          default:
            page = const LoginScreen();
        }
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, anim, __, child) => AnimatedOpacity(
            opacity: anim.value,
            duration: const Duration(milliseconds: 400),
            child: child,
          ),
        );
      },
    );
  }
}
