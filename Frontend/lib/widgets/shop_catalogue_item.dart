import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart';
import 'package:winx_app/widgets/header.dart';

class ShopCatalogueItem extends StatefulWidget {
  const ShopCatalogueItem(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.fileName});
  final String itemName;
  final int itemPrice;
  final String fileName;

  @override
  State<ShopCatalogueItem> createState() => _ShopCatalogueItem();
}

class _ShopCatalogueItem extends State<ShopCatalogueItem>
    with TickerProviderStateMixin {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      //margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('lib/assets/shop/${widget.fileName}'))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Container(
                    alignment: const Alignment(-1, -0.5),
                    height: 40,
                    decoration: BoxDecoration(
                      color: custom_color.secondaryBGBrown,
                      border: Border.all(
                        color: custom_color.outlineBrown,
                        width: 3,
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      widget.itemName,
                      textAlign: TextAlign.center,
                      style: TextStylingOptions.bodyText(null, false, 16),
                    )))
          ],
        ),
      ),
    );
  }
}
