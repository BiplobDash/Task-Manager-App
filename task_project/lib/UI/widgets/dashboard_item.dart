import 'package:flutter/material.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem({
    Key? key,
    required this.numberOfTasks,
    required this.typeofTasks,
  }) : super(key: key);
  final int numberOfTasks;
  final String typeofTasks;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              numberOfTasks.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            FittedBox(child: Text(typeofTasks))
          ],
        ),
      ),
    );
  }
}