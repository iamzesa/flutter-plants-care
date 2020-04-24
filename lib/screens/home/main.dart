
import 'dart:convert';

import 'package:firstapp/models/plant_list.dart';
import 'package:firstapp/screens/home/plants.dart';
import 'package:firstapp/widgets/loading-indicator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'attention.dart';
import 'header.dart';
import 'no-plants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          bottom: false,
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