import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/modules/Login/HomeScreen.dart';
import 'package:loginscreen/modules/Login/RegisterScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../shared/components/small_widgets.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: Icon(
            Icons.menu,
          ),
          title: Text(
            'LoginScreen',
          ),
          actions: [
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("I'm notifications"),
                  ));
                },
                icon: Icon(
                  Icons.notifications,
                )),
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("I'm search"),
                  ));
                },
                icon: Icon(
                  Icons.search,
                )),
          ],
          centerTitle: true,
          elevation: 20,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                defualtTextField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Requird Email';
                      }
                      return null;
                    },
                    onTap: () {},
                    lable: 'Email',
                    prefix: Icons.email_outlined),
                SizedBox(
                  height: 20,
                ),
                defualtTextField(
                    controller: passController,
                    type: TextInputType.visiblePassword,
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'Requird Password';
                      }
                    },
                    onTap: () {},
                    lable: 'Password',
                    prefix: Icons.lock_open_outlined,
                    sufix: Icons.remove_red_eye),
                SizedBox(
                  height: 30,
                ),
                defualtButton(
                    function: () async {
                      /*if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              '${emailController.text} ${passController.text}'),
                        ));
                      }*/
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        try {
                          await loginUser();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(
                                context, "No user found for that email.");
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context,
                                "Wrong password provided for that user.");
                          }
                        }
                        isLoading = false;
                        // showSnackBar(context, "Successfully");
                      } else {}
                    },
                    text: 'Register'), //Btn
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an acount?',
                    ),
                    defualtTextButton(
                      text: 'Register',
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      isBold: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passController.text,
    );
  }
}
