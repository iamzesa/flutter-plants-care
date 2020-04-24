import 'package:flutter/material.dart';

class OutlineShadowButton extends StatelessWidget {
  VoidCallback onPressed;

  OutlineShadowButton({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        margin: new EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(132, 219, 255, 0.4),
              blurRadius: 15, // has the effect of softening the shadow
              spreadRadius: 0, // has the effect of extending the shadow
              offset: Offset(
                0.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            )
          ],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Color.fromRGBO(132, 219, 255, 1))
          ),
          color: Colors.white,
          onPressed: this.onPressed,
          child: Text(
            'Add water',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(34, 34, 34, 1)
            ),
          ),
        )
    );
  }
}
