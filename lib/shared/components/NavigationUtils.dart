import 'package:flutter/material.dart';
import 'package:loginscreen/modules/Login/LoginScreen.dart';

class NavigationUtils {
  static Future<void> navigateToSecondRoute(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
