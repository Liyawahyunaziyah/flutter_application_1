import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import 'package:flutter_application_1/presentation/widgets/task_card.dart';
import 'package:flutter_application_1/models/TaskModel.dart';
import 'package:flutter_application_1/presentation/pages/add/add_screen.dart';
import 'package:flutter_application_1/presentation/pages/home/widgets/sidebar.dart';
import 'package:flutter_application_1/services/notificationServices.dart' as notifServices;
import'package:flutter_application_1/services/scheduleNotification.dart' as scheduleNotif;



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
} 

class _HomeScreenState extends State<HomeScreen> {
  String activeTab = 'all'; // untuk switch tab
  String selectedMenu = 'Home';

  final List<TaskModel> allTasks = [
  TaskModel(title: 'Gym', timeOrDate: '17:30', status: 'Now',reminderTime: null),
  TaskModel(title: 'Dinner', timeOrDate: '19:45', status: 'Now',reminderTime: null),
  TaskModel(title: 'Go To Library', timeOrDate: '12 August 2025', status: 'Up Coming',reminderTime: null),
  TaskModel(title: 'Meeting', timeOrDate: '15 August 2025', status: 'Up Coming',reminderTime: null),
  TaskModel(title: 'Go To Market', timeOrDate: '7 August 2025', status: 'Done',reminderTime: null),
  TaskModel(title: 'Go To Laundry', timeOrDate: '3 August 2025', status: 'Done',reminderTime: null),
  TaskModel(title: 'Meeting', timeOrDate: '20 July 2025', status: 'Done',reminderTime: null),
  TaskModel(title: 'Meet With Clients', timeOrDate: '17 July 2025', status: 'Done',reminderTime: null)
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebar(
        selectedMenu: selectedMenu,
  onMenuTap: (menu) {
    setState(() {
      selectedMenu = menu;
  });
  },
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
                // Row dengan ikon menu dan tambah
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        icon:Icon(Icons.menu, color: Colors.white, size: 24),
                        onPressed: (){
                          Scaffold.of(context).openDrawer();
                        },
                      ), 
                    ),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: ()async{
                        final newTask = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddScreen()),);
          // aksi saat diklik
          if (newTask != null && newTask is TaskModel) {
            notifServices.NotificationService.scheduleNotification(
    id: newTask.reminderTime!.millisecondsSinceEpoch.remainder(100000), // id unik
    title: newTask.title,
    body: "Reminder: ${newTask.title}",
    scheduledDate: newTask.reminderTime!,
  );
    setState(() {
      allTasks.add(newTask); // tambahkan ke list
    });
  }
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      child: Icon(Icons.add, color: AppColors.Background, size: 24),
                      ),  
                    ),
                ),
                  ],
                    ),
                SizedBox(height: 16),
                Text(
                  "Sunday, 7 August 2025",
                  style: TextStyle(color: AppColors.textPrimary,fontFamily:'Inter', fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16),
                Text(
                  "Hai Tara",
                  style: TextStyle(color: AppColors.textPrimary,fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "What’s your Plan For Today",
                  style: TextStyle(color: AppColors.textPrimary,fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.bold),
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
                                  color: activeTab == 'all' ? Color(0xFF7b7fcf) : Colors.grey.shade300,
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'All Task',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: activeTab == 'all' ? Color(0xFF7b7fcf) : Colors.grey,
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
                                  color: activeTab == 'done' ? Color(0xFF7b7fcf) : Colors.grey.shade300,
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Done',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: activeTab == 'done' ? Color(0xFF7b7fcf) : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                   // 🔔 Tombol tes notifikasi
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      notifServices.NotificationService.showSimpleNotification(
                        title: 'Reminder Aktif!',
                        body: 'Ini notifikasi tes dari aplikasi kamu 🎉',
                      );
                    },
                    child: Text('Tes Notifikasi 🔔'),
                  ),

                  // Daftar task
                  SizedBox(height: 16),
                  // Placeholder konten
                  Expanded(
  child: ListView(
    children: (activeTab == 'all'
            ? allTasks.asMap().entries.where((entry) => entry.value.status != 'Done')
            : allTasks.asMap().entries.where((entry) => entry.value.status == 'Done'))
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
      );
    }).toList(),
  ),
),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}