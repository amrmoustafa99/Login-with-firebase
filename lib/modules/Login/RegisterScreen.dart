import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/modules/Login/LoginScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../shared/components/small_widgets.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  'Register',
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
                          await registerUser();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(
                                context, "The password provided is too weak.");
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context,
                                "The account already exists for that email.");
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
                      'i have an acount?',
                    ),
                    defualtTextButton(
                      text: 'login',
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
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

  Future<void> registerUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passController.text,
    );
  }
}
