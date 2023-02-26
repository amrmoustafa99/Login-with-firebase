import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/shared/components/components.dart';
import 'package:loginscreen/shared/components/constants.dart';
import 'package:loginscreen/shared/components/small_widgets.dart';

import '../../shared/components/CustomBubbleChat.dart';

class ChatScren extends StatelessWidget {
  const ChatScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true, // add this line to center the title
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // center the row contents horizontally
          children: [
            Image.asset(
              LogoChat,
              height: 50,
              width: 50,
            ),
            Text(
              "Chat",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) => CustomBubbleChat())),
          Padding(
            padding: const EdgeInsets.only(right: 5, left: 5),
            child: defualtTextField2(
                type: TextInputType.text,
                validate: (value) {},
                lable: "send messsage",
                onTap: () {},
                sufix: Icons.send,
                height: 60,
                color: Colors.deepPurple),
          )
        ],
      ),
      //centerTitle: true,
    );
  }
}
