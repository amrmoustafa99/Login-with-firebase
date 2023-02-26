import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/shared/components/components.dart';

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back_ios),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ),
          SizedBox(height: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              defualtTextField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validate: (value) {
                    if (value != null && value.empty()) {
                      return "Requird field";
                    }
                    return null;
                  },
                  lable: 'Email',
                  onTap: () {},
                  prefix: Icons.email,
                  radius: 0,
                  height: 70,
                  width: MediaQuery.of(context).size.width - 30),
              SizedBox(
                height: 15,
              ),
              defualtTextField(
                  color: Colors.white,
                  controller: passController,
                  type: TextInputType.visiblePassword,
                  validate: (value) {
                    if (value != null && value.empty()) {
                      return "Requird field";
                    }
                    return null;
                  },
                  lable: 'Password',
                  onTap: () {},
                  prefix: Icons.lock,
                  radius: 0,
                  height: 70,
                  width: MediaQuery.of(context).size.width - 30),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget your password?",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              defualtButton(
                function: () {},
                text: "LOGIN",
                width: MediaQuery.of(context).size.width - 30,
                height: 50,
                radius: 25,
              ),
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Text("Or login with socail account"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(25, 15, 25, 15),
                      child: Image(
                          image: AssetImage(
                            "images/Assets/search (1).png",
                          ),
                          height: 25,
                          width: 25),
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(25, 15, 25, 15),
                      child: Image(
                          image: AssetImage("images/Assets/facebook.png"),
                          height: 25,
                          width: 25),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
