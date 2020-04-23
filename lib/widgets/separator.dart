import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Container(
        height: 1,
        color: Color.fromRGBO(240, 240, 240, 1.0),
      ),
    );
  }
}
