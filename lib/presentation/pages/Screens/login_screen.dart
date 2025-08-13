import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/presentation/pages/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;
  bool rememberMe = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyController = TextEditingController();

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    String name = emailController.text.split('@')[0];
    String email = emailController.text;

    await prefs.setString('userName', name);
    await prefs.setString('userEmail', email);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen(
          userName: name,
          userEmail: email,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8E89C3),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.book, size: 80, color: Colors.white),
                const SizedBox(height: 20),
                const Text(
                  "CATDONE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 20),

                // Tab Login / Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => isLogin = true),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: isLogin
                              ? Colors.white
                              : const Color.fromARGB(179, 135, 134, 134),
                          fontSize: 20,
                          fontWeight:
                              isLogin ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    GestureDetector(
                      onTap: () => setState(() => isLogin = false),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: !isLogin
                              ? Colors.white
                              : const Color.fromARGB(179, 135, 134, 134),
                          fontSize: 20,
                          fontWeight:
                              !isLogin ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Email & Password Fields
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  labelColor: AppColors.textPrimary,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  label: "Password",
                  labelColor: AppColors.textPrimary,
                  obscureText: true,
                ),

                if (!isLogin) ...[
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: verifyController,
                    label: "Verification Password",
                    labelColor: AppColors.textPrimary,
                    obscureText: true,
                  ),
                ],

                const SizedBox(height: 10),

                if (isLogin)
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) =>
                            setState(() => rememberMe = value ?? false),
                        activeColor: AppColors.card,
                        checkColor: AppColors.SecondIcon,
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return AppColors.card; // warna saat dicentang
                          }
                          return Colors.white; // warna saat TIDAK dicentang
                        }),
                      ),
                      const Text(
                        "Remember me",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                const SizedBox(height: 10),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: login,
                  child: Text(
                    isLogin ? "Login" : "Register",
                    style: TextStyle(
                      color: AppColors.title,
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final Color? labelColor;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    this.controller,
    required this.label,
    this.labelColor,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: labelColor ?? Colors.black,
        ),
        prefixIcon: Icon(
          label.toLowerCase().contains('email')
              ? Icons.email
              : label.toLowerCase().contains('password')
                  ? Icons.lock
                  : label.toLowerCase().contains('verification password')
                      ? Icons.lock
                      : Icons.input,
          color: AppColors.card,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.card),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.card, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      ),
      cursorColor: AppColors.card,
      style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w500),
    );
  }
}
