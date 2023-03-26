import 'package:flutter/material.dart';
import 'package:task_project/UI/Screens/update_profile_screen.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => UpdateProfileScreen()));
      }),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      leading: CircleAvatar(child: Icon(Icons.person)),
      tileColor: Colors.green,
      title: Text('Biplob Dash'),
      subtitle: Text('biplob@gmail.com'),
    );
  }
}
