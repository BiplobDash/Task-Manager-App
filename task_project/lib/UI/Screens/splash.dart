import 'package:flutter/material.dart';
import 'package:task_project/UI/Screens/login_screen.dart';
import 'package:task_project/UI/Screens/main_bottom_nav.dart';
import 'package:task_project/UI/utils/text_style.dart';
import 'package:task_project/data/auth_utils.dart';
import '../widgets/screenBackground.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUserAuthState();
  }

  Future<void> checkUserAuthState() async {
    final bool result = await AuthUtils.checkLoginState();
    if (result) {
      await AuthUtils.getAuthData();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => MainBottomNavBar()),
          (route) => false);
      
    } else {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
      child: Center(
        child: Text(
          'Task Manager App',
          style: screenTitleTextStyle,
        ),
      ),
    ));
  }
}
