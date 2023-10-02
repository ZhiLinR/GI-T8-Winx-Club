import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart';

import 'package:winx_app/mygame.dart';
import 'package:winx_app/widgets/header.dart';
import 'package:winx_app/widgets/shop_catalogue_item.dart';
import 'package:winx_app/utility/webHandler.dart';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:http/http.dart' as http;

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskList();
}

class _TaskList extends State<TaskList> with TickerProviderStateMixin {
  var taskList = <Widget>[
    Container(
        margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Text("Daily Tasks",
            style: TextStylingOptions.bodyText(null, false, 30)))
  ];

  @override
  void initState() {
    taskList.add(CheckBoxTile(text: "Turn off computer"));
/*     late final Future itemList = Future.value(ApiService().getTasks());
    dynamic catalogue;
    Future.value(itemList).then((value) {
      //debugPrint(value.runtimeType.toString());
      catalogue = value;
      for (var element in catalogue) {
        shopCatalogue.add(ShopCatalogueItem(
          itemName: element.itemName,
          itemPrice: element.itemPrice,
          fileName: element.assetName,
          description: element.description,
        ));
      }
    }); */
    //debugPrint(catalogue.runtimeType.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.7,
      duration: const Duration(seconds: 1),
      curve: Curves.bounceIn,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(0xFF, 0xE4, 0xEF, 0xEA),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.white,
            width: 5,
          ),
        ),
        child: Column(children: taskList),
      ),
    );
  }
}

class CheckBoxTile extends StatefulWidget {
  const CheckBoxTile({super.key, required this.text});
  final String text;
  @override
  State<CheckBoxTile> createState() => _CheckBoxTile();
}

class _CheckBoxTile extends State<CheckBoxTile> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: _isChecked,
        onChanged: (bool? value) {
          setState(() {
            _isChecked = value!;
          });
        },
        title: Text(
          widget.text,
          style: TextStylingOptions.bodyText(null, _isChecked, 25),
        ));
  }
}
