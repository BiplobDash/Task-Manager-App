import 'package:flutter/material.dart';
import 'package:task_project/UI/utils/snickbar_message.dart';
import 'package:task_project/UI/utils/text_style.dart';
import 'package:task_project/UI/widgets/appElevatedButton.dart';
import 'package:task_project/UI/widgets/app_text_feild_widget.dart';
import 'package:task_project/UI/widgets/screenBackground.dart';
import 'package:task_project/UI/widgets/user_profile_widget.dart';
import 'package:task_project/data/auth_utils.dart';
import 'package:task_project/data/network_utils.dart';

import '../../data/urls.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
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
                        hintText: 'Subject',
                        controller: _subjectController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your subject';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      AppTextFieldWidget(
                        hintText: 'Description',
                        controller: _descriptionController,
                        maxLines: 5,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your task description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      if (inProgress)
                        Center(
                          child: CircularProgressIndicator(),
                        )
                      else
                        AppElevatedButton(
                            child: Icon(Icons.arrow_circle_right_outlined),
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                inProgress = true;
                                setState(() {});
                                final result = await NetworkUtils().postMethod(
                                  Urls.createNewTaskUrl,
                                  token: AuthUtils.token,
                                  body: {
                                    "title": _subjectController.text.trim(),
                                    "description": _descriptionController.text.trim(),
                                    "status": "New"
                                  },
                                );
                                inProgress = false;
                                setState(() {});
                                if ((result != null) &&
                                    (result['status'] == 'success')) {
                                  _subjectController.clear();
                                  _descriptionController.clear();
                                  showSnackBarMessage(
                                      context, 'New task added');
                                } else {
                                  showSnackBarMessage(context,
                                      'New task add failed! Try again', true);
                                }
                              }
                            }),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }
}
