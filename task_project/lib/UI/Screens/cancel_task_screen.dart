
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/screenBackground.dart';
import '../widgets/task_list_item.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
          return TaskListTitle(
            type: 'Cancelled',
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