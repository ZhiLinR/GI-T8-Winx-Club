import 'account_model.dart';
import 'item_model.dart';

bool purchasePossible(int price, Account account) {
  var result = account.balance - price > 0 ? true : false;
  return result;
}

int calculatePurchase(int balance, int price) {
  return balance - price;
}
