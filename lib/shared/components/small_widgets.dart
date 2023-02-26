import 'package:flutter/material.dart';
import 'package:loginscreen/modules/Login/LoginScreen.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('${message}'),
  ));
}

void navigateToSecondRoute(BuildContext context) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginScreen()),
  );
}

Widget defualtTextField2({
  double width = double.infinity,
  double height = 45.0,
  required TextInputType type,
  required FormFieldValidator validate,
  required String lable,
  required Function() onTap,
  bool enableClick = true,
  Color color = Colors.grey,
  double radius = 0.0,
  IconData? prefix,
  IconData? sufix,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: type,
        //controller
        decoration: InputDecoration(
          // labelText: lable,
          hintText: lable,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: Icon(
            sufix,
            color: Colors.deepPurple,
          ),
        ),

        validator: validate,
        onTap: onTap,
        enabled: enableClick,
      ),
    );
