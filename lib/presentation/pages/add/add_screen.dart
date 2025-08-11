import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import 'package:flutter_application_1/models/TaskModel.dart';
import 'package:flutter_application_1/utils/translator.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  TimeOfDay? _selectedTime;
  final TextEditingController _timeController = TextEditingController();

  final TextEditingController _planController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text =
            '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial, // bisa diganti input
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
        _timeController.text = pickedTime.format(context);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _planController.dispose();
    super.dispose();

    Widget build(BuildContext context) {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(translate('Make Your Plans Now', 'Buat Rencana Kamu Sekarang'),
                style: TextStyle(
                  color: AppColors.title,
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.Background, // Sesuaikan dengan tema
      ),
      body: Container(
        color: AppColors.card,
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
                  controller: _planController,
                  decoration: InputDecoration(
                    hintText: translate('Your Plan', 'Rencana Kamu'),
                    hintStyle: TextStyle(
                      color: AppColors.SecondText,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none), // Buang border bawaan
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                  controller: _dateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    hintText: translate('Select Date', 'Pilih Tanggal'),
                    hintStyle: TextStyle(
                      color: AppColors.SecondText,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      color: AppColors.SecondIcon,
                      size: 24,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none), // Buang border bawaan
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                  controller: _timeController,
                  readOnly: true,
                  onTap: () => _selectTime(context),
                  decoration: InputDecoration(
                    hintText: translate('Add Time', 'Tambahkan Waktu'),
                    hintStyle: TextStyle(
                      color: AppColors.SecondText,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: Icon(
                      Icons.access_time,
                      color: AppColors.SecondIcon,
                      size: 24,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none), // Buang border bawaan
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: 490,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (_planController.text.isNotEmpty &&
                        _selectedDate != null &&
                        _selectedTime != null) {
                      final DateTime reminderDateTime = DateTime(
                        _selectedDate!.year,
                        _selectedDate!.month,
                        _selectedDate!.day,
                        _selectedTime!.hour,
                        _selectedTime!.minute,
                      );
                      String status;
                      DateTime now = DateTime.now();
                      if (_selectedDate!.year == now.year &&
                          _selectedDate!.month == now.month &&
                          _selectedDate!.day == now.day) {
                        status = 'Now';
                      } else {
                        status = 'Up Coming';
                      }

                      final newTask = TaskModel(
                        title: _planController.text,
                        timeOrDate:
                            '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year} ${_selectedTime!.format(context)}',
                        status: status,
                        reminderTime: reminderDateTime,
                      );

                      Navigator.pop(context, newTask);
                    } else {}
                  },
                  child: Text(
                    translate('Make Plans', 'Buat Rencana'),
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.Background, // = BoxDecoration.color
                    shape: RoundedRectangleBorder(
                      // = BoxDecoration.borderRadius
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        // = BoxDecoration.border
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
