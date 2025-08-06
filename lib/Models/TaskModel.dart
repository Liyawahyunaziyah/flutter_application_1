class TaskModel {
  final String title;
  final String timeOrDate;
  final String status;
  final DateTime? reminderTime;

 TaskModel({
  required this.title, 
  required this.timeOrDate, 
  required this.status,
  required this.reminderTime,});
}
