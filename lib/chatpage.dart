import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:projectfinal/homepage.dart';

class MessageData {
  String message;
  String userId;
  String username;

  MessageData(this.message, this.userId, this.username);

  // Initialize from DataSnapshot
  MessageData.fromSnapshot(DataSnapshot snapshot)
      : message =
            (snapshot.value as Map<dynamic, dynamic>?)?['message'] as String? ??
                '',
        userId =
            (snapshot.value as Map<dynamic, dynamic>?)?['userId'] as String? ??
                '',
        username = (snapshot.value as Map<dynamic, dynamic>?)?['username']
                as String? ??
            '';

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'userId': userId,
      'username': username,
    };
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final String currentUserId = '1yRPk63zD3oNq8OXh6wJ';
  String? _username;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseReference _messagesRef =
      FirebaseDatabase.instance.ref().child('messages');
  List<MessageData> messageList = [];
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final String adminId = "LQphDobPX5fZHmGhVDGS";
  String? _thrsname;

  @override
  void initState() {
    super.initState();
    _loadthrsName();
    _messagesRef.onChildAdded.listen((DatabaseEvent event) {
      _onMessageAdded(event);
    }).onError((error) {
      print('Error listening to Firebase database: $error');
    });
  }

  // Load the teacher's name from Firestore
  Future<void> _loadthrsName() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('profiledetails') // Adjust this path if necessary
          .doc(adminId)
          .get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        _thrsname = data['username'] ?? 'No teacher name found';
        print('Teacher Name: $_thrsname');
      } else {
        print('Profile not found');
      }
    } catch (e) {
      print('Error occurred while loading profile details: $e');
    }
  }

  void _onMessageAdded(DatabaseEvent event) async {
    final snapshotValue = event.snapshot.value;
    if (snapshotValue is Map<dynamic, dynamic>) {
      try {
        final messageData = MessageData.fromSnapshot(event.snapshot);

        // Fetch username from Firestore
        DocumentSnapshot userDoc = await _firestore
            .collection('profiledetails') // Adjust if necessary
            .doc(messageData.userId)
            .collection('basicinfo')
            .doc(messageData.userId)
            .get();

        if (userDoc.exists) {
          final userData = userDoc.data() as Map<String, dynamic>;
          messageData.username =
              '${userData['firstname']} ${userData['lastname']}';
          setState(() {
            _username = messageData.username;
          });
          print('Username: ${messageData.username}');
        } else {
          // For admin messages, use the stored teacher's name
          if (messageData.userId == adminId) {
            messageData.username = _thrsname ?? 'Unknown User';
          } else {
            messageData.username = 'Unknown User';
          }
        }

        print('Received message');
        print(
            'Parsed message data: ${messageData.message}, ${messageData.userId}, ${messageData.username}');

        setState(() {
          messageList.add(messageData);
          _scrollToBottom();
        });
      } catch (e) {
        print('Error parsing message data: $e');
      }
    } else {
      print('Unexpected data format: ${snapshotValue.runtimeType}');
    }
  }

  Future<void> _scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => homepagestudent()),
            );
          },
          icon: Icon(Icons.arrow_back_sharp),
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 25,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Group",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                Text("Online",
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  var message = messageList[index];
                  var isPreviousSenderSame = index > 0 &&
                      messageList[index - 1].userId == message.userId;
                  var isCurrentSender = message.userId == currentUserId;
                  var showName = !isPreviousSenderSame && !isCurrentSender;

                  return Align(
                    alignment: isCurrentSender
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isCurrentSender
                            ? Colors.blue
                            : const Color.fromARGB(255, 76, 175, 149),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: isCurrentSender
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: <Widget>[
                          if (showName)
                            Text(
                              message.username, // Display username
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          Text(
                            message.message,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      height: 90,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
          spreadRadius: 2,
        ),
      ]),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.camera_alt_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.mic_none_sharp, color: Colors.black),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Write your message...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 18),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.attach_file_sharp, color: Colors.black),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Transform.rotate(
                      angle: -3.14 / 5,
                      child: Icon(Icons.send, color: Colors.black),
                    ),
                    onPressed: () {
                      final messageText = _textEditingController.text.trim();

                      if (messageText.isNotEmpty) {
                        _messagesRef.push().set({
                          'message': messageText,
                          'userId': currentUserId,
                          'username': _username, // Replace with actual username
                        });

                        _textEditingController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
