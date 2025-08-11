import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/TaskModel.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import 'package:flutter_application_1/utils/translator.dart';
import 'package:intl/intl.dart';

class EditScreen extends StatefulWidget {
  final TaskModel task;

  EditScreen({required this.task});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _planController;
  late TextEditingController _dateController;
  late TextEditingController _timeController;

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _planController = TextEditingController(text: widget.task.title);

    // parsing date and time dari task lama
    final reminder = widget.task.reminderTime;
    if (reminder != null) {
      _selectedDate = reminder;
      _selectedTime = TimeOfDay(hour: reminder.hour, minute: reminder.minute);
      _dateController = TextEditingController(
          text: DateFormat('dd/MM/yyyy').format(_selectedDate!));
      _timeController =
          TextEditingController(text: _selectedTime!.format(context));
    } else {
      _dateController = TextEditingController();
      _timeController = TextEditingController();
    }
  }

  @override
  void dispose() {
    _planController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = picked.format(context);
      });
    }
  }

  void _saveEditedTask() {
    if (_planController.text.isEmpty ||
        _selectedDate == null ||
        _selectedTime == null) return;

    final reminderTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    final status = reminderTime.isBefore(DateTime.now())
        ? 'Done'
        : reminderTime.day == DateTime.now().day &&
                reminderTime.month == DateTime.now().month &&
                reminderTime.year == DateTime.now().year
            ? 'Now'
            : 'Up Coming';

    final updatedTask = TaskModel(
      title: _planController.text,
      timeOrDate: '${_dateController.text} ${_timeController.text}',
      status: status,
      reminderTime: reminderTime,
    );

    Navigator.pop(context, updatedTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.card,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.SecondIcon,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(translate("Edit Task", "Edit Tugas"),
            style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.Background,
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
              SizedBox(height: 24),
              GestureDetector(
  onTap: _saveEditedTask,
  child: Container(
    padding: EdgeInsets.symmetric(vertical: 14),
    decoration: BoxDecoration(
      color: AppColors.Background,
      borderRadius: BorderRadius.circular(8),
    ),
    alignment: Alignment.center,
                child: Text(
                  translate("Save Changes", "Simpan Perubahan"),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
  )
              ),
              ],
            ),
      ),
          
          
        ),
      
);
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required bool readOnly,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.Background,
          width: 2,
        ),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.SecondText,
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: Icon(icon, color: AppColors.SecondIcon),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
