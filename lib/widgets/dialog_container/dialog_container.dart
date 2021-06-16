import 'package:flutter/material.dart';

class DialogContainer extends StatelessWidget {
  final Widget child;

  DialogContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black54,
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 15,
          left: 15,
          right: 15,
          top: 50,
        ),
        child: this.child,
      ),
      appBar: null,
    );
  }
}
