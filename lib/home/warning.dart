import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WarningBar extends StatefulWidget {
  @override
  _WarningBarState createState() => _WarningBarState();
}

class _WarningBarState extends State<WarningBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Color.fromRGBO(240, 240, 240, 1.0),
          height: 40,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  "resources/images/exclamation-mark.svg",
                  width: 20,
                  height: 20,
                ),
              ),
              Expanded(
                  child: Text(
                    "Your plants needs some attention",
                    style: TextStyle(
                      color: Color.fromRGBO(34, 34, 34, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 12
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
