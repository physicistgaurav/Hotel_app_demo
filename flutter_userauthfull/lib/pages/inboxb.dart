// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_const_declarations

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_userauthfull/pages/constant.dart';
import 'package:flutter_userauthfull/pages/model.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late bool isLoading;
  final TextEditingController _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    isLoading = false;
  }

  Future<String> generateResponse(String prompt) async {
    const apiKey = apiSecretKey;

    var url = Uri.https("api.openai.com", "/v1/completions");
    var client = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
    var request = await client.postUrl(url);
    request.headers.set('Content-Type', 'application/json');
    request.headers.set('Authorization', 'Bearer $apiKey');

    request.add(utf8.encode(jsonEncode({
      "model": "text-davinci-003",
      "prompt": prompt,
      'temperature': 0,
      'max_tokens': 2000,
      'top_p': 1,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
    })));

    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();

    Map<String, dynamic> jsonResponse = json.decode(responseBody);
    return jsonResponse['choices'][0]['text'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 100,
              centerTitle: true,
              title: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Let us Chat",
                  textAlign: TextAlign.center,
                ),
              ),
              backgroundColor: Colors.cyan,
              pinned: false,
              floating: true,
              snap: false,
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  // chat body
                  Expanded(
                    child: _buildList(),
                  ),
                  Visibility(
                    visible: isLoading,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      // input field
                      _buildInput(),

                      // submit button
                      _buildSubmit(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildInput() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(color: Colors.grey),
            controller: _textController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              hintText: 'Type your message...',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmit() {
    return Visibility(
        visible: !isLoading,
        child: Container(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () {
              // display user input
              setState(() {
                _messages.add(ChatMessage(
                    text: _textController.text,
                    chatMessageType: ChatMessageType.user));
                isLoading = true;
              });
              var input = _textController.text;
              _textController.clear();
              Future.delayed(Duration(
                milliseconds: 50,
              )).then((value) => _scrollDown());
              // call chatbot api
              generateResponse(input).then((value) {
                setState(() {
                  isLoading = false;
                  // display chatbot response
                  _messages.add(ChatMessage(
                      text: value, chatMessageType: ChatMessageType.bot));
                });
              });
              _textController.clear();
              Future.delayed(Duration(
                milliseconds: 50,
              )).then((value) => _scrollDown());
            },
            icon: Icon(
              Icons.send_rounded,
              color: Colors.grey,
            ),
          ),
        ));
  }

  void _scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  ListView _buildList() {
    return ListView.builder(
        itemCount: _messages.length,
        controller: _scrollController,
        itemBuilder: ((context, index) {
          var message = _messages[index];
          return ChatMessageWidget(
            text: message.text,
            chatMessageType: message.chatMessageType,
          );
        }));
  }
}

class ChatMessageWidget extends StatelessWidget {
  String text;
  ChatMessageType chatMessageType;

  ChatMessageWidget(
      {super.key, required this.text, required this.chatMessageType});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
            color: chatMessageType == ChatMessageType.bot
                ? Color.fromARGB(255, 239, 239, 239)
                : Color.fromARGB(255, 29, 161, 242),
          ),
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              chatMessageType == ChatMessageType.bot
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      margin: EdgeInsets.only(right: 16),
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Image.asset(
                          "assets/gpt.png",

                          // color: Colors.black,
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(right: 16),
                      child: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                    ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: chatMessageType == ChatMessageType.bot
                                ? Color.fromARGB(255, 97, 93, 93)
                                : Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
