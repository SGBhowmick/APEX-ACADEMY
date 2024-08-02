import 'package:flutter/material.dart';
import 'package:projectfinal/homepage.dart';

class chatpage extends StatefulWidget {
  const chatpage({super.key});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  List<MessageData> messageList = [];

  TextEditingController textEditingController = TextEditingController();
  late String senderMessage, receiverMessage;
  ScrollController scrollController = ScrollController();

  Future<void> scrollAnimation() async {
    return await Future.delayed(
        const Duration(milliseconds: 100),
        () => scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => homepagestudent()));
                },
                icon: Icon(
                  Icons.arrow_back_sharp,
                  size: 25,
                )),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(""),
                            backgroundColor: Colors.red,
                            radius: 25,
                          ),
                        ),
                        Positioned(
                            bottom: 3,
                            right: 3,
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              maxRadius: 6,
                            ))
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18)),
                      Text("Online",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 14))
                    ],
                  ),
                )
              ],
            )),
      ),
      body: Column(
        children: [
          Expanded(child: ListView(controller: scrollController)),
          Container(
            height: 90,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  child: Center(
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Center(
                    child: const Icon(
                      Icons.mic_none_sharp,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: textEditingController,
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 6,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                hintText: 'Write your message...',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Center(
                                child: Transform.rotate(
                                    angle: 45,
                                    child: const Icon(
                                      Icons.attach_file_sharp,
                                      color: Colors.black,
                                      size: 24,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Transform.rotate(
                    angle: -3.14 / 5,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            messageList.add(
                                MessageData(textEditingController.text, true));
                            textEditingController.clear();
                            scrollAnimation();
                          });
                        },
                        onLongPress: () {
                          setState(() {
                            messageList.add(
                                MessageData(textEditingController.text, false));
                            textEditingController.clear();
                            scrollAnimation();
                          });
                        },
                        child: const Icon(
                          size: 28,
                          Icons.send,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageData {
  String _message;
  bool _isSender;

  MessageData(this._message, this._isSender);

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  bool get isSender => _isSender;

  set isSender(bool value) {
    _isSender = value;
  }
}
