import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

mixin BaseViewModel<T extends StatefulWidget> on State<T> {
  final controller = TextEditingController();
  final gemini = Gemini.instance;
  String? searchedText, result;
  bool _loading = false;

  bool get loading => _loading;
  List<ChatMessage> chatMessages = [];
  set loading(bool set) => setState(() => _loading = set);
  void onpressed() {
    if (controller.text.isNotEmpty) {
      chatMessages.add(ChatMessage(text: controller.text, isUserMessage: true));
      searchedText = controller.text;
      controller.clear();
      loading = true;

      gemini.text(searchedText!).then((value) {
        result = value?.content?.parts?.last.text;
        // Add bot response to chat
        if (result != null) {
          chatMessages.add(ChatMessage(text: result!, isUserMessage: false));
        } else {
          // Handle case where Gemini API response is not available
          chatMessages.add(ChatMessage(
            text: "Sorry, I couldn't retrieve a response.",
            isUserMessage: false,
          ));
        }
        loading = false;
      });
    }
  }
}

class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});
}
