import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import 'package:flutter_application_1/utils/translator.dart';

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
          translate("About App","Tentang Aplikasi"),
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
                translate('Task Planner App','Aplikasi Perencana Tugas'),
                style: TextStyle(
                    color: AppColors.textPrimary,
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Text(
              translate('DONECAT is a To-Do List Application Designed to Help you Organize and Manage Your Daily Tasks More Effectively. With Simple and Easy-to-use Features, You Can Create Task Lists and Well Remind you According to the Schedule Youve set','DONECAT adalah Aplikasi Daftar Tugas yang Dirancang untuk Membantu Anda Mengatur dan Mengelola Tugas Harian Anda dengan Lebih Efektif. Dengan Fitur yang Sederhana dan Mudah Digunakan, Anda Dapat Membuat Daftar Tugas dan Mengingatkan Anda Sesuai Jadwal yang Telah Anda Tetapkan'),
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24),
            Text(
              translate('Created by:','Dibuat oleh:'),
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
               translate('Mobile Developer','Pengembang Aplikasi Seluler'),
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            Text(
               translate('Kontak:','Kontak:'),
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
               translate('Update: Agustus 2025','Update: Agustus 2025'),
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
