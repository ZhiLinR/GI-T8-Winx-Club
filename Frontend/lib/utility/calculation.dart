import 'account_model.dart';
import 'item_model.dart';

bool calculate(Item item, Account account) {
  var result = account.balance - item.itemPrice > 0 ? true : false;
  return result;
}
