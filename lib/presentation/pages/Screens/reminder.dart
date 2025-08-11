import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/models/TaskModel.dart';

class ReminderScreen extends StatelessWidget {
  final List<TaskModel> allTasks;

  ReminderScreen({required this.allTasks});

  @override
  Widget build(BuildContext context) {
    final reminderTasks = allTasks.where((task) => task.reminderTime != null).toList();

    return Scaffold(
      backgroundColor: AppColors.Background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.Icon,),
          onPressed: () {
            Navigator.pop(context);
          },
          ),
        title: Text('Reminder',style: TextStyle(color: AppColors.textPrimary, 
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.bold),),

        backgroundColor: AppColors.Background,),

      body: reminderTasks.isEmpty
          ? Center(child: Text("Belum ada reminder yang aktif.", style: TextStyle(color: AppColors.textPrimary, 
          fontFamily: 'Inter', 
          fontSize: 20, 
          fontWeight: FontWeight.w600),))
          
          : ListView.builder(
              itemCount: reminderTasks.length,
              itemBuilder: (context, index) {
                final task = reminderTasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(DateFormat('dd MMM yyyy – kk:mm').format(task.reminderTime!)),
                  trailing: Icon(Icons.alarm),
                );
              },
            ),
    );
  }
}
