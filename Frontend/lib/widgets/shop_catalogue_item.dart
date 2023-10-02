import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart';
import 'package:winx_app/components/localStorage.dart';
import 'package:winx_app/utility/account_model.dart';
import 'package:winx_app/utility/calculation.dart';
import 'package:winx_app/utility/webHandler.dart';
import 'package:winx_app/widgets/header.dart';

class ShopCatalogueItem extends StatefulWidget {
  const ShopCatalogueItem(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.fileName,
      required this.description});
  final String itemName;
  final String description;
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
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => ShowItemDetails(
                                  itemName: widget.itemName,
                                  itemPrice: widget.itemPrice,
                                  fileName: widget.fileName,
                                  description: widget.description,
                                ));
                      });
                    },
                    child: Container(
                        alignment: const Alignment(-1, -0.5),
                        height: 40,
                        decoration: BoxDecoration(
                          /*  image: const DecorationImage(
                              image:
                                  AssetImage('lib/assets/theme/shop_theme.jpg'),
                              fit: BoxFit.fill), */
                          color: custom_color.primaryBGBrown,
                          border: Border.all(
                            color: custom_color.outlineBrown,
                            width: 3,
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.itemName,
                                textAlign: TextAlign.center,
                                style: TextStylingOptions.bodyText(
                                    custom_color.primaryTextBlack, false, 17),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(widget.itemPrice.toString(),
                                      style: TextStylingOptions.bodyText(
                                          custom_color.primaryTextBlack,
                                          false,
                                          17)),
                                  CustomIcons.currencyIcon(17)
                                ],
                              )
                            ]))))
          ],
        ),
      ),
    );
  }
}

class ShowItemDetails extends StatefulWidget {
  const ShowItemDetails(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.fileName,
      required this.description});

  final String itemName;
  final String description;
  final int itemPrice;
  final String fileName;

  @override
  State<ShowItemDetails> createState() => _ShowItemDetails();
}

class _ShowItemDetails extends State<ShowItemDetails>
    with TickerProviderStateMixin {
  String username = getStringFromLocalStorage('username').toString();
  late final Future<Account?> account;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      title: TextStylingOptions.borderedText(
          widget.itemName, null, 30, null, false),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    color: custom_color.primaryBGBrown,
                    border: Border.all(
                      color: custom_color.outlineBrown,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        fit: BoxFit.none,
                        image:
                            AssetImage('lib/assets/shop/${widget.fileName}')))),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Price: ${widget.itemPrice.toString()}",
                    style: TextStylingOptions.bodyText(
                        custom_color.primaryTextBlack, false, 20)),
                CustomIcons.currencyIcon(20)
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                widget.description,
                style: TextStylingOptions.bodyText(null, null, null),
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Buy'),
          onPressed: () {
            //TO ADD UPDATE METHOD

            account = Future.value(ApiService().getAccountByUsername(username));
            Future.value(account).then((value) {
              Account a = value!;
              bool buy = purchasePossible(widget.itemPrice, a);
              if (buy) {
                a.balance = calculatePurchase(a.balance, widget.itemPrice);

                // Update items
                bool itemExist = false;
                for (UserItem i in a.items) {
                  if (i.itemName == widget.itemName) {
                    i.itemCount += 1;
                    itemExist = true;
                    break;
                  }
                }
                !itemExist
                    ? a.items
                        .add(UserItem(itemName: widget.itemName, itemCount: 1))
                    : null;

                // Testing - print statements
                debugPrint(a.balance.toString());
                print(a);

                var result = Future.value(ApiService().putAccount(username, a));
                if (result != null) {
                  const Text("Purchased!");
                } else {
                  const Text("Purchase failed!");
                }
              } else {
                const Text("You do not have enough currency!");
              }
              setState(() {});
            });
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
