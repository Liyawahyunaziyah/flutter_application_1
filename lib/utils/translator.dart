import 'package:flutter/material.dart';
String selectedLanguage = 'en'; // default, bisa diubah saat user memilih

String translate(String en, String id) {
  return selectedLanguage == 'id' ? id : en;
}
