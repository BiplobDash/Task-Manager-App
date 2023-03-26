import 'package:flutter/material.dart';
import 'package:task_project/UI/utils/text_style.dart';
import 'package:task_project/UI/widgets/appElevatedButton.dart';
import 'package:task_project/UI/widgets/app_text_feild_widget.dart';
import 'package:task_project/UI/widgets/screenBackground.dart';
import 'package:task_project/UI/widgets/user_profile_widget.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          UserProfileWidget(),
          Expanded(
              child: ScreenBackground(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Add New Task',
                      style: screenTitleTextStyle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    AppTextFieldWidget(
                        hintText: 'Subject', controller: TextEditingController()),
                    SizedBox(
                      height: 8,
                    ),
                    AppTextFieldWidget(
                      hintText: 'Description',
                      controller: TextEditingController(),
                      maxLines: 5,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    AppElevatedButton(child: Icon(Icons.arrow_circle_right_outlined), onTap: (){}),
                  ],
                ),
              ),
            ),
          ))
        ],
      )),
    );
  
  }
}
