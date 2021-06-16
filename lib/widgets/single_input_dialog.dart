import 'package:clockee/utils/widget_helper.dart';
import 'package:clockee/widgets/dialog_container/dialog_container.dart';
import 'package:clockee/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SingleInputDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String actionText;
  final String hintText;
  final String labelText;
  final Function(String) onSubmit;

  SingleInputDialog(
      {required this.title,
      this.hintText = "",
      this.labelText = "",
      this.subtitle = "",
      required this.actionText,
      required this.onSubmit});
  @override
  Widget build(BuildContext context) {
    String inputText = "";
    return DialogContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(4),
              alignment: Alignment.centerRight,
              child: Icon(Icons.close),
            ),
          ),
          text(title, fontSize: 20),
          text(subtitle, fontSize: 15),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              labelText,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: NeumorphicTheme.defaultTextColor(context),
              ),
            ),
          ),
          Neumorphic(
            margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
            style: NeumorphicStyle(
                depth: 2, boxShape: NeumorphicBoxShape.stadium(), intensity: 4),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
            child: TextField(
              onChanged: (text) {
                inputText = text;
              },
              decoration: InputDecoration.collapsed(hintText: hintText),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: SimpleButton(
              actionText,
              onPressed: () {
                if (inputText.trim().isEmpty) return;
                Navigator.pop(context);
                onSubmit(inputText);
              },
            ),
          )
        ],
      ),
    );
  }
}
