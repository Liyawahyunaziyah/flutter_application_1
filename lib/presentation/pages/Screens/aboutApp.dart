import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.Icon,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "About App",
          style: TextStyle(
              color: AppColors.textPrimary,
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.Background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Task Planner App',
                style: TextStyle(
                    color: AppColors.textPrimary,
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'DONECAT is a To-Do List Application Designed to Help you Organize and Manage Your Daily Tasks More Effectively. With Simple and Easy-to-use Features, You Can Create Task Lists and Well Remind you According to the Schedule Youve set',
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24),
            Text(
              'Dibuat oleh:',
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 18),
            ),
            Text(
              'Leea Leora',
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'UI/UX & Flutter Developer',
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            Text(
              'Kontak:',
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 20),
            ),
            Row(
              children: [
                Icon(Icons.mail, color: AppColors.Icon),
                SizedBox(width: 8),
                Text(
                  'Leealeoora@gamil.com',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: AppColors.Icon),
                SizedBox(width: 8),
                Text(
                  'Indonesia',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text('Versi: 1.0.0',
                style: TextStyle(
                    color: AppColors.textPrimary,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            Text(
              'Update: Agustus 2025',
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
