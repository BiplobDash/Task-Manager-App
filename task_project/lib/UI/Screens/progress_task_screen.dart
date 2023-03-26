
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/screenBackground.dart';
import '../widgets/task_list_item.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
          return TaskListTitle(
            type: 'In Progress',
            date: '12-12-23',
            description: 'This is description',
            subject: 'Title will be here',
            onDeletePress: () {},
            onEditPress: () {},
          );
        }),
    );;
  }
}