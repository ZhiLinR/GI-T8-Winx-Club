import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart' as text_themes;

import 'package:winx_app/mygame.dart';
import 'package:winx_app/widgets/header.dart';
import 'package:winx_app/widgets/shop_catalogue_item.dart';
import 'package:winx_app/utility/webHandler.dart';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:http/http.dart' as http;

class ShopCatalogue extends StatefulWidget {
  const ShopCatalogue({super.key});

  @override
  State<ShopCatalogue> createState() => _ShopCatalogue();
}

class _ShopCatalogue extends State<ShopCatalogue>
    with TickerProviderStateMixin {
  int currentPageIndex = 0;
  var shopCatalogue = <ShopCatalogueItem>[];

  @override
  void initState() {
    late final Future itemList = Future.value(ApiService().getItems());
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
    });
    debugPrint(catalogue.runtimeType.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {});
          showBottomSheet<void>(
              enableDrag: true,
              transitionAnimationController: AnimationController(
                vsync: this,
                duration: const Duration(seconds: 1),
                reverseDuration: const Duration(milliseconds: 500),
              ),
              context: context,
              builder: (BuildContext context) {
                return AnimatedContainer(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceIn,
                  child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: shopCatalogue),
                  /* ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ), */
                );
              });
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.fromLTRB(0, 10, 0, 10)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ))),
        child: const Column(children: [Icon(Icons.storefront), Text("Shop")]));
  }
}
