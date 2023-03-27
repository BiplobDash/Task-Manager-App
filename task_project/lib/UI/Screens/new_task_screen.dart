import 'package:flutter/material.dart';
import 'package:task_project/UI/widgets/screenBackground.dart';

import '../widgets/dashboard_item.dart';
import '../widgets/task_list_item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DashboardItem(
                typeofTasks: 'New',
                numberOfTasks: 23,
              ),
            ),
            Expanded(
              child: DashboardItem(
                typeofTasks: 'Completed',
                numberOfTasks: 23,
              ),
            ),
            Expanded(
              child: DashboardItem(
                typeofTasks: 'Cancel',
                numberOfTasks: 23,
              ),
            ),
            Expanded(
              child: DashboardItem(
                typeofTasks: 'In Progress',
                numberOfTasks: 23,
              ),
            ),
          ],
        ),
        Expanded(child: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
          return TaskListTitle(
            type: 'New',
            date: '12-12-23',
            description: 'This is description',
            subject: 'Title will be here',
            onDeletePress: () {},
            onEditPress: () {},
          );
        }))
      ],
    ));
  }
}



