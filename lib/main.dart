import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/pages/screens/providerTheme.dart';
import 'presentation/pages/home/home_screen.dart';
import 'package:flutter_application_1/presentation/pages/Screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load data pengguna
  final prefs = await SharedPreferences.getInstance();
  final userName = prefs.getString('userName') ?? 'Tara';
  final userEmail = prefs.getString('userEmail') ?? 'user@gmail.com';
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(
        userName: userName,
        userEmail: userEmail,
        isLoggedIn: isLoggedIn,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String userName;
  final String userEmail;
  final bool isLoggedIn;

  const MyApp({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Task Manager',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          home: isLoggedIn
              ? HomeScreen(userName: userName, userEmail: userEmail)
              : const SplashScreen(),
        );
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.book, size: 80, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              "CATDONE",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Inter'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.card,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              },
              child: const Text(
                "Login",
                style: TextStyle(
                    color: AppColors.textPrimary,
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
