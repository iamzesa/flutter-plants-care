import 'package:firstapp/models/plant_list.dart';
import 'package:firstapp/widgets/separator.dart';
import 'package:flutter/material.dart';

class PlantListWidget extends StatefulWidget {
  final PlantList plantList;

  PlantListWidget({Key key, @required this.plantList}) : super(key: key);

  @override
  _PlantListWidgetState createState() => _PlantListWidgetState();
}

class _PlantListWidgetState extends State<PlantListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Separator(),
        ListView.separated(
          shrinkWrap: true,
          primary: false,
          separatorBuilder: (context, itemIndex) {
            return SizedBox(height: 20);
          },
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          scrollDirection: Axis.vertical,
          itemCount: widget.plantList.plants.length,
          itemBuilder: (context, index) => Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  widget.plantList.plants[index].photo.toString(),
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                )
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.plantList.plants[index].name.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                      ),
                      Text(
                        widget.plantList.plants[index].description.toString(),
                        maxLines: 3,
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
        ),
      ],
    );
  }
}