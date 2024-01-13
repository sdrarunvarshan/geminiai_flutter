import 'package:flutter/material.dart';
import 'package:gemini_ai/product/companents/custom_appbar.dart';
import 'package:gemini_ai/product/const/const_color.dart';
import 'package:gemini_ai/product/const/const_text.dart';
import 'package:gemini_ai/viewmodel/base_view_model.dart';

class SectionTextInput extends StatefulWidget {
  const SectionTextInput({super.key});

  @override
  State<SectionTextInput> createState() => _SectionTextInputState();
}

class _SectionTextInputState extends State<SectionTextInput>
    with BaseViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          // Display the GEMINI AI BOT text prompt in the center
          if (chatMessages.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  bodyText,
                  style:  TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    color: black,
                  ),
                ),
              ),
            ),
          // Display chat messages
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                ChatMessage message = chatMessages[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: message.isUserMessage ? Alignment.topRight : Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: message.isUserMessage ? black : green,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        message.text,
                        style: TextStyle(color: message.isUserMessage ? white : black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Input TextField
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              cursorColor: white,
              style: const TextStyle(color: white),
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: onpressed,
                  icon: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                hintText: hintText,
                hintStyle: const TextStyle(color:grey ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(width: 1, color: black),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(width: 1, color: black),
                ),
                filled: true,
                fillColor: black,
              ),
              onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            ),
          ),
        ],
      ),
    );
  }
}