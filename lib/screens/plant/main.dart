import 'package:firstapp/widgets/outline-shadow-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://cdn.shopify.com/s/files/1/0013/3529/6118/products/kent-35-white_fcs-lyr-10_5e5a8922-2514-4f56-96bf-6bf157bd8e54.jpg'))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Epipremnum',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          SvgPicture.asset(
                            'resources/images/water-drop-circle.svg',
                            width: 20,
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Needs water',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(175, 175, 175, 1)),
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: OutlineShadowButton(onPressed: () {
                       print("PRESS");
                      }),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            'resources/images/sun.svg',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Sun',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14
                                  ),
                                ),
                                Text(
                                  'Epipremnum loves sun',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color.fromRGBO(175, 175, 175, 1)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            'resources/images/water.svg',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Water',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                  ),
                                ),
                                Text(
                                  '2 times per week',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color.fromRGBO(175, 175, 175, 1)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            'resources/images/heat.svg',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Temperature',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                  ),
                                ),
                                Text(
                                  'No less than 15 degrees',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color.fromRGBO(175, 175, 175, 1)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Epipremnum loves sun',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color.fromRGBO(175, 175, 175, 1)
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 5,
              left: 20,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  'resources/images/back.svg',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
