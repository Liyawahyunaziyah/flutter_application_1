import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import 'package:flutter_application_1/presentation/pages/profile/myProfile.dart';
import 'package:flutter_application_1/presentation/pages/Screens/reminder.dart';
import 'package:flutter_application_1/models/TaskModel.dart';
import 'package:flutter_application_1/presentation/pages/Screens/aboutApp.dart';

class sidebar extends StatelessWidget {
  final List<TaskModel> allTasks;
  final String selectedMenu;
  final Function(String) onMenuTap;
  final Function(String)onLanguageChange;
  

  const sidebar ({Key? key,
  required this.allTasks,
  required this.selectedMenu,
  required this.onMenuTap,
  required this.onLanguageChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.card,
        child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian user info
            // Bagian user info dengan navigasi ke ProfilePage
InkWell(
  onTap: () {
    Navigator.pop(context); // Tutup drawer
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyProfilePage()),
    );
    onTap: () {
      Navigator.pop(context);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ReminderScreen(allTasks: allTasks)),
  );
};

  },
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, size: 30, color: Colors.grey[700]),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User',
              style: TextStyle(
                color: AppColors.title,
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'user@gmail.com',
              style: TextStyle(
                color: AppColors.title,
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),

            //garis 
            Divider(color: AppColors.Background,),

            // Menu drawer item
            Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
            _drawerItem(context, Icons.home, "Home"),
            _drawerItem(context, Icons.notifications, "Reminder",
            onTap: () {
              onMenuTap("Reminder");
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReminderScreen(allTasks: allTasks)),
              );
            }),

            _drawerItem(context, Icons.wb_sunny_outlined, "Light Mode"),
            _drawerItem(context, Icons.language, "Language",
            onTap:() {
              Navigator.pop(context);
              showDialog(context: context, builder: (context)){
                return AlertDialog(
                  title: Text("Select Language"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text("English"),
                        onTap: () {
                          onLanguageChange = 'en';
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text("Bahasa Indonesia"),
                        onTap: () {
                          onLanguageChange = 'id';
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              }
            },),
            _drawerItem(context, Icons.info_outline, "About App",
            onTap: () {
              onMenuTap("About App");
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
            },),
            _drawerItem(context, Icons.logout, "Log Out"),
          ],
        ),
      ),
          ]
      ),
      )
    )
    );
  
    
  }

 Widget _drawerItem(BuildContext context, IconData icon, String title, {VoidCallback? onTap}) {
  bool isSelected = selectedMenu == title;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap ?? () {
        onMenuTap(title);
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.SecondIcon : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : AppColors.SecondIcon,
            ),
            SizedBox(width: 32),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.SecondIcon,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


    
  
  }
  


