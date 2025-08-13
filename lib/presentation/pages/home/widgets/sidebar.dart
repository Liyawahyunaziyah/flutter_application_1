import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/Screens/login_screen.dart'
    hide LoginScreen;
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';
import 'package:flutter_application_1/presentation/pages/profile/myProfile.dart';
import 'package:flutter_application_1/presentation/pages/screens/reminder.dart';
import 'package:flutter_application_1/models/TaskModel.dart';
import 'package:flutter_application_1/presentation/pages/screens/aboutApp.dart';
import 'package:flutter_application_1/utils/translator.dart';
import 'package:flutter_application_1/presentation/pages/screens/providerTheme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/presentation/pages/screens/login_screen.dart';

class Sidebar extends StatelessWidget {
  final List<TaskModel> allTasks;
  final String selectedMenu;
  final Function(String) onMenuTap;
  final Function(String) onLanguageChange;
  final String userName;
  final String userEmail;

  const Sidebar({
    Key? key,
    required this.allTasks,
    required this.selectedMenu,
    required this.onMenuTap,
    required this.onLanguageChange,
    required this.userEmail,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Drawer(
      child: Container(
        color: Theme.of(context).cardColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyProfilePage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person,
                            size: 30, color: Colors.grey[700]),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            translate('User', 'Pengguna'),
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            translate('user@gmail.com', 'pengguna@gmail.com'),
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
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

              Divider(color: Theme.of(context).dividerColor),

              // Menu Items
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _drawerItem(
                      context,
                      Icons.home,
                      "Home",
                      onTap: () {
                        onMenuTap("Home"); // <--supaya selectedMenu berubah
                        Navigator.pop(context);
                      },
                    ),

                    _drawerItem(
                      context,
                      Icons.notifications,
                      "Reminder",
                      onTap: () {
                        onMenuTap("Reminder"); // <--supaya selectedMenu berubah
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ReminderScreen(allTasks: allTasks),
                            ));
                      },
                    ),

                    // Theme Toggle
                    _themeToggleItem(context, themeProvider),

                    _drawerItem(
                      context,
                      Icons.language,
                      "Language",
                      onTap: () {
                        onMenuTap("Language"); // <--supaya selectedMenu berubah
                        Navigator.pop(context);
                        _showLanguageDialog(context);
                      },
                    ),

                    _drawerItem(
                      context,
                      Icons.info_outline,
                      "About App",
                      onTap: () {
                        onMenuTap(
                            "About App"); // <--supaya selectedMenu berubah
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutScreen()),
                        );
                      },
                    ),

                    _drawerItem(context, Icons.logout, "Log Out", onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _themeToggleItem(BuildContext context, ThemeProvider themeProvider) {
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          final newTheme = isDarkMode ? ThemeMode.light : ThemeMode.dark;
          themeProvider.changeTheme(newTheme);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              SizedBox(width: 32),
              Text(
                isDarkMode
                    ? translate('Light Mode', 'Mode Terang')
                    : translate('Dark Mode', 'Mode Gelap'),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              Spacer(),
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  final newTheme = value ? ThemeMode.dark : ThemeMode.light;
                  themeProvider.changeTheme(newTheme);
                },
                activeColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            translate("Select Language", "Pilih Bahasa"),
            style: TextStyle(
                fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("English",
                    style: TextStyle(fontFamily: 'Inter', fontSize: 16)),
                onTap: () {
                  onLanguageChange('en');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Bahasa Indonesia",
                    style: TextStyle(fontFamily: 'Inter', fontSize: 16)),
                onTap: () {
                  onLanguageChange('id');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _drawerItem(BuildContext context, IconData icon, String title,
      {VoidCallback? onTap}) {
    bool isSelected = selectedMenu == title;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected
                    ? Colors.white
                    : Theme.of(context).iconTheme.color,
              ),
              SizedBox(width: 32),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? Colors.white
                      : Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
