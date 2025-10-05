import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import package baru
import 'package:lottie/lottie.dart';
import 'buku_list_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  void _checkAuthAndNavigate() async {
    const minimumSplashDuration = Duration(seconds: 3);
    final startTime = DateTime.now();

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    final endTime = DateTime.now();
    final durationPassed = endTime.difference(startTime);
    if (durationPassed < minimumSplashDuration) {
      await Future.delayed(minimumSplashDuration - durationPassed);
    }

    if (mounted) {
      if (token != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BukuListScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0077B6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/book.json',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Aplikasi Buku',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}