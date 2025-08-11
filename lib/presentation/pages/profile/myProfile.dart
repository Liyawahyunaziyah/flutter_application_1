import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import 'package:flutter_application_1/utils/translator.dart';

void main() => runApp(MyProfileApp());

class MyProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Background, // Background ungu muda
      appBar: AppBar(
        leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
      Navigator.pop(context);
    },
         ), // Warna ikon
        title: Text(
          translate('My Profile','Profil Saya'),
          style: TextStyle(
              color: AppColors.textPrimary,
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.Background, // Warna ungu
      ),

      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 180),
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                SizedBox(height: 48),
                CustomTextField(label:translate( "Username","Pengguna"), labelColor: AppColors.title),
                SizedBox(height: 32),
                CustomTextField(label:translate( "Full Name","Nama Lengkap"), labelColor: AppColors.title),
                SizedBox(height: 32),
                CustomTextField(label:translate( "Email","Email"), labelColor: AppColors.title),
                SizedBox(height: 32),
                CustomTextField(label:translate( "Reset Password","Atur Ulang Password"), labelColor: AppColors.title),
              ],
            ),
          ),
          
          Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width / 2 - 70,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.Background,
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Color(0xFF867CE6),
                    child: Icon(Icons.edit, size: 15, color: AppColors.Icon),
                  ),
                ),
              ],
            ),
          ),
              ],
            ),
          );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final Color? labelColor;

  CustomTextField({required this.label, this.labelColor});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: labelColor ?? AppColors.Background,),
        suffixIcon: Icon(Icons.edit, color: AppColors.Background),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.Background), // Garis saat tidak fokus
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.Background, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      ),
       cursorColor: AppColors.Background, // Warna kursor juga ungu
      style: TextStyle(color: Colors.black),
    );
  }
}
