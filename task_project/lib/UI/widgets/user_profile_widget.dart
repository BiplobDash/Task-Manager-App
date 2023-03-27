import 'package:flutter/material.dart';
import 'package:task_project/UI/Screens/login_screen.dart';
import 'package:task_project/UI/Screens/update_profile_screen.dart';
import 'package:task_project/data/auth_utils.dart';

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
      title: Text('${AuthUtils.firstName ?? ''} ${AuthUtils.lastName ?? ''}'),
      subtitle: Text(AuthUtils.email ?? 'Unknown'),
      trailing: IconButton(
          onPressed: () async {
            await AuthUtils.clearData();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          },
          icon: Icon(
            Icons.logout,
            color: Colors.white,
          )),
    );
  }
}
