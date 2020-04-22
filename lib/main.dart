import 'package:firstapp/home/components/header.dart';
import 'package:firstapp/home/components/separator.dart';
import 'package:firstapp/home/components/warning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
        debugShowCheckedModeBanner: false,
        home: SampleAppPage()
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HomeHeader(),
              Separator(),
              WarningBar(),
              Container(
                  height: 140.0,
                  child: ListView.separated(
                    separatorBuilder: (context, itemIndex) {
                      return SizedBox(width: 15);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        "resources/images/plant1.jpg",
                        width: 90,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    )
                  )
              ),
              Separator(),
              ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  separatorBuilder: (context, itemIndex) {
                    return SizedBox(height: 20);
                  },
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  scrollDirection: Axis.vertical,
                  itemCount: 20,
                  itemBuilder: (context, index) => Container(
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            "resources/images/plant1.jpg",
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Epipremnum",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14
                                  ),
                                ),
                                Text(
                                  "Morbi ultricies magna egestas, efficitur nulla sit amet, consectetur nibh.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      )
    );
  }

  _getSecondListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 20; i++) {
      widgets.add(
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "resources/images/plant1.jpg",
                  height: 90,
                  fit: BoxFit.cover,
                ),
              )
          )
      );
    }
    return widgets;
  }
}