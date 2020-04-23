import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoPlantsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            'resources/images/gardening.svg',
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'You don\'t have any plants',
              style: TextStyle(
                  fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ),
    );
  }
}
