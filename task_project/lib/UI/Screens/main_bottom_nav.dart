import 'package:flutter/material.dart';
import 'package:task_project/UI/Screens/add_new_task_screen.dart';
import 'package:task_project/UI/Screens/cancel_task_screen.dart';
import 'package:task_project/UI/Screens/completed_screen.dart';
import 'package:task_project/UI/Screens/new_task_screen.dart';
import 'package:task_project/UI/Screens/progress_task_screen.dart';

import '../widgets/user_profile_widget.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedScreen = 0;
  final List<Widget> _screens = [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelTaskScreen(),
    ProgressTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UserProfileWidget(),
            Expanded(child: _screens[_selectedScreen]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNewTaskScreen()));
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black38,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          onTap: (index) {
            setState(() {
              _selectedScreen = index;
            });
          },
          elevation: 4,
          currentIndex: _selectedScreen,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.new_label_outlined), label: 'New'),
            BottomNavigationBarItem(
                icon: Icon(Icons.done_outlined), label: 'Completed'),
            BottomNavigationBarItem(
                icon: Icon(Icons.close_outlined), label: 'Cancelled'),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit_sharp), label: 'Progress'),
          ]),
    );
  }
}
