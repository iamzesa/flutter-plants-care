import 'dart:convert';

import 'package:firstapp/home/header.dart';
import 'package:firstapp/home/no-plants.dart';
import 'package:firstapp/home/plants.dart';
import 'package:firstapp/widgets/separator.dart';
import 'package:firstapp/home/warning.dart';
import 'package:firstapp/models/plant_list.dart';
import 'package:firstapp/widgets/loading-indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import 'home/main.dart';
import 'models/plant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Montserrat',
            primarySwatch: Colors.green
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
  Future<PlantList> plantList;
  Future<PlantList> attentionPlantList;

  @override
  void initState() {
    super.initState();
    plantList = fetchAllPlants();
    attentionPlantList = fetchAttentionPlants();
  }

  @override
  Widget build(BuildContext context) {
    plantList = fetchAllPlants();
    attentionPlantList = fetchAttentionPlants();

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HomeHeader(),
                FutureBuilder<PlantList>(
                  future: attentionPlantList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data.plants.isNotEmpty) {
                      return AttentionWidget(plantList: snapshot.data);
                    }
                    return Container();
                  },
                ),
                FutureBuilder<PlantList>(
                  future: plantList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.plants.isNotEmpty) {
                        return PlantListWidget(plantList: snapshot.data);
                      } else {
                        return NoPlantsWidget();
                      }
                    }
                    return LoadingIndicator();
                  },
                ),
              ],
            ),
          ),
        )
    );
  }

  Future<PlantList> fetchAllPlants() async {
    final response = await http.get('https://plants-care-app.herokuapp.com/plants');

    if (response.statusCode == 200) {
      return PlantList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<PlantList> fetchAttentionPlants() async {
    final response = await http.get('https://plants-care-app.herokuapp.com/plants/attention');

    if (response.statusCode == 200) {
      return PlantList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load plants attention');
    }
  }
}