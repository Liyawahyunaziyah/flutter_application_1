import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/AppColors.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make Your Plans Now'),
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.Background, // Sesuaikan dengan tema
      ),
      body: Container(
        color:AppColors.card ,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      color: AppColors.Background, // Warna ungu kamu
      width: 2,
    ),
  ),
  child: TextField(
    decoration: InputDecoration(
      hintText: 'Your Plan',
      hintStyle: TextStyle(
        color: AppColors.SecondText,
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      border: OutlineInputBorder(borderSide: BorderSide.none), // Buang border bawaan
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  ),
),

            SizedBox(height: 24),

            Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      color: AppColors.Background, // Warna ungu kamu
      width: 2,
    ),
  ),
  child: TextField(
    decoration: InputDecoration(
      hintText: 'Select Date',
      hintStyle: TextStyle(
        color: AppColors.SecondText,
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      prefixIcon: Icon(Icons.calendar_today, color: AppColors.SecondIcon, size: 24, ),
      border: OutlineInputBorder(borderSide: BorderSide.none), // Buang border bawaan
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  ),
),
SizedBox(height: 24),

            Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      color: AppColors.Background, // Warna ungu kamu
      width: 2,
    ),
  ),
  child: TextField(
    decoration: InputDecoration(
      hintText: 'Your Plan',
      hintStyle: TextStyle(
        color: AppColors.SecondText,
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      prefixIcon: Icon(Icons.access_time, color: AppColors.SecondIcon, size: 24, ),
      border: OutlineInputBorder(borderSide: BorderSide.none), // Buang border bawaan
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  ),
),

            SizedBox(height: 32),

            SizedBox(
  width: 490,
  height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Make Plans', style: TextStyle(color: AppColors.textPrimary,fontFamily:'Inter', fontSize:20, fontWeight: FontWeight.bold ),),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.Background,        // = BoxDecoration.color
    shape: RoundedRectangleBorder(                // = BoxDecoration.borderRadius
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(                            // = BoxDecoration.border
        color: AppColors.Background,
        width: 2,
      ),
    ),
    elevation: 4,                 
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
