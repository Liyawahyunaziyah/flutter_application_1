import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import '../../models/TaskModel.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final bool isDoneTab;
  final VoidCallback onDelete;

  const TaskCard({required this.task, required this.isDoneTab,required this.onDelete,});

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'now':
        return AppColors.nowLabel;
      case 'up coming':
        return AppColors.upcomingLabel;
      case 'done':
        return AppColors.doneLabel;
      default:
        return Colors.grey;
    }
  }

  @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    child: Stack(
      clipBehavior: Clip.none, // biar label bisa bener-bener nempel pojok
      children: [
        // CARD utama sebagai latar belakang
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.Background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info Task
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20), // ruang untuk status label
                  Text(
                    task.title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    task.timeOrDate,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              // Icon delete
              GestureDetector(
                onTap: onDelete,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                child: const Icon(Icons.delete, color: Colors.white),
                )
              ),
            ],
          ),
        ),

        // Label status di pojok kiri atas
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 88,
            height: 19,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: getStatusColor(task.status),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              task.status,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontFamily:'Inter' ,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}