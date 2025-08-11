import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import '../../models/TaskModel.dart';
import 'package:flutter_application_1/presentation/pages/add/edit.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final bool isDoneTab;
  final VoidCallback onDelete;
  final Function(TaskModel updatedTask) onEdit;

  const TaskCard(
      {required this.task,
      required this.isDoneTab,
      required this.onDelete,
      required this.onEdit,
      Key? key})
      : super(key: key);

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
    // CARD utama sebagai latar belakang
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: GestureDetector(
          onTap: () async {
            if (!isDoneTab) {
              final updatedTask = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditScreen(task: task),
                ),
              );

              if (updatedTask != null && updatedTask is TaskModel) {
                onEdit(updatedTask); // callback ke parent untuk update data
              }
            }
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
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
                    // Tombol hapus
                    GestureDetector(
                      onTap: onDelete,
                      child: const Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
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
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
