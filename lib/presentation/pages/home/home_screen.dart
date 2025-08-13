import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import 'package:flutter_application_1/presentation/widgets/task_card.dart';
import 'package:flutter_application_1/models/TaskModel.dart';
import 'package:flutter_application_1/presentation/pages/add/add_screen.dart';
import 'package:flutter_application_1/presentation/pages/home/widgets/sidebar.dart';
import 'package:flutter_application_1/services/notificationServices.dart'
    as notifServices;
import 'package:flutter_application_1/utils/translator.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal
import 'package:flutter_application_1/presentation/pages/Screens/providerTheme.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  final String userEmail;

  const HomeScreen(
      {super.key, required this.userName, required this.userEmail});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeTab = 'all';
  String selectedMenu = 'Home';
  String selectedLanguage = 'en';
  final List<TaskModel> allTasks = [];

  // Fungsi untuk mendapatkan tanggal dan hari dalam format yang benar
  String _getFormattedDate() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, d MMMM yyyy');
    return formatter.format(now);
  }

  // Fungsi untuk mendapatkan salam berdasarkan waktu
  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return translate("Good Morning", "Selamat Pagi");
    } else if (hour < 17) {
      return translate("Good Afternoon", "Selamat Siang");
    } else {
      return translate("Good Evening", "Selamat Malam");
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = _getFormattedDate();
    final greeting = _getGreeting();

    return Scaffold(
      drawer: Sidebar(
        allTasks: allTasks,
        selectedMenu: selectedMenu,
        onMenuTap: (menu) {
          setState(() {
            selectedMenu = menu;
          });
        },
        onLanguageChange: (lang) {
          setState(() {
            selectedLanguage = lang;
          });
        },
        userName: widget.userName,
        userEmail: widget.userEmail,
      ),
      backgroundColor: AppColors.Background,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
            width: double.infinity,
            color: AppColors.Background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        icon: Icon(Icons.menu, color: Colors.white, size: 24),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: () async {
                          final newTask = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddScreen()),
                          );
                          if (newTask != null && newTask is TaskModel) {
                            notifServices.NotificationService
                                .scheduleNotification(
                              id: newTask.reminderTime!.millisecondsSinceEpoch
                                  .remainder(100000),
                              title: newTask.title,
                              body: "Reminder: ${newTask.title}",
                              scheduledDate: newTask.reminderTime!,
                            );
                            setState(() {
                              allTasks.add(newTask);
                            });
                          }
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          child: Icon(Icons.add,
                              color: AppColors.Background, size: 24),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  formattedDate,
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16),
                Text(
                  "$greeting, ${widget.userName}",
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  translate(
                      "What's your Plan For Today", "Apa Rencanamu Hari Ini"),
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  // Tab bar
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => activeTab = 'all'),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: activeTab == 'all'
                                      ? Color(0xFF7b7fcf)
                                      : Colors.grey.shade300,
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'All Task',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: activeTab == 'all'
                                      ? Color(0xFF7b7fcf)
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => activeTab = 'done'),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: activeTab == 'done'
                                      ? Color(0xFF7b7fcf)
                                      : Colors.grey.shade300,
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Done',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: activeTab == 'done'
                                      ? Color(0xFF7b7fcf)
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Daftar task
                  SizedBox(height: 16),
                  // Placeholder konten
                  Expanded(
                    child: ListView(
                      children: (activeTab == 'all'
                              ? allTasks.asMap().entries.where(
                                  (entry) => entry.value.status != 'Done')
                              : allTasks.asMap().entries.where(
                                  (entry) => entry.value.status == 'Done'))
                          .map((entry) {
                        int realIndex = entry.key;
                        TaskModel task = entry.value;

                        return TaskCard(
                          task: task,
                          isDoneTab: activeTab == 'done',
                          onDelete: () {
                            setState(() {
                              allTasks.removeAt(realIndex);
                            });
                          },
                          onEdit: (updatedTask) {
                            setState(() {
                              allTasks[realIndex] = updatedTask;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ... (bagian bawah tetap sama)
        ],
      ),
    );
  }
}
