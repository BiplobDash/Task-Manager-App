import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task_project/UI/widgets/screenBackground.dart';

import '../widgets/task_list_item.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
          return TaskListTitle(
            type: 'Completed',
            date: '12-12-23',
            description: 'This is description',
            subject: 'Title will be here',
            onDeletePress: () {},
            onEditPress: () {},
          );
        }),
    );
  }
}