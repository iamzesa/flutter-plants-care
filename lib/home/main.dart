import 'package:firstapp/home/warning.dart';
import 'package:firstapp/models/plant_list.dart';
import 'package:firstapp/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AttentionWidget extends StatefulWidget {
  final PlantList plantList;

  AttentionWidget({Key key, @required this.plantList}) : super(key: key);

  @override
  _AttentionWidgetState createState() => _AttentionWidgetState();
}

class _AttentionWidgetState extends State<AttentionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Separator(),
        WarningBar(),
        Container(
            height: 140.0,
            child: ListView.separated(
                separatorBuilder: (context, itemIndex) => SizedBox(width: 15),
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: widget.plantList.plants.length,
                itemBuilder: (context, index) => Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            widget.plantList.plants[index].photo.toString(),
                            width: 90,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          widthFactor: 90 / 20,
                          // Cell width divided by the water drop image width
                          alignment: Alignment.bottomCenter,
                          child: SvgPicture.asset(
                            "resources/images/water-drop-circle.svg",
                            width: 20,
                            height: 20,
                          ),
                        )
                      ],
                    )))
      ],
    );
  }
}
