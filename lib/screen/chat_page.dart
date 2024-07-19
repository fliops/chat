import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email/models/maessage.dart';
import 'package:email/widgets/chat_buble.dart';
import 'package:email/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
   var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimarycolor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              width: 50,
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Chat',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              //بشكل مستمر  home بيظهر التغير علي صفحة

              stream: messages.orderBy('createdAt').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Message> messagesList = [];
                  for (var doc in snapshot.data!.docs) {
                    messagesList.add(
                        Message.fromJson(doc.data() as Map<String, dynamic>));
                  }

                  return ListView.builder(
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id==email?  
                       ChatBuble(
                        message: messagesList[index],
                      ):ChatBubleFriend(message: messagesList[index],);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                messages.add({'message': data, 'createdAt': DateTime.now(),'id':email});
                controller.clear();
                _controller.animateTo(
                  _controller.position.maxScrollExtent,
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,

                );
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: Icon(
                  Icons.send,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
