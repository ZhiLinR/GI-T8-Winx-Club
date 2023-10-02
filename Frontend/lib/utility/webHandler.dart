import 'dart:developer';
import 'package:http/http.dart' as http;

import 'constants.dart';
import 'item_model.dart';
import 'task_model.dart';
import 'account_model.dart';

class ApiService {
  final headers = {'Content-Type': 'application/json'};

  Future<Account?> getAccountByUsername(String username) async {
    try {
      var endPoint = "/$username";
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.accountEndpoint + endPoint);

      return await http.get(url).then((response) {
        if (response.statusCode == 200) {
          Account model = accountFromJson(response.body);
          return model;
        } else {
          throw Exception("Failed to fetch account.");
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Account?> getAccountByUsernameAndPassword(
      String username, String password) async {
    try {
      var endPoint = "/$username/$password";
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.accountEndpoint + endPoint);

      return await http.get(url).then((response) {
        if (response.statusCode == 200) {
          Account model = accountFromJson(response.body);
          return model;
        } else {
          throw Exception("Failed to fetch account.");
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Account?> postAccount(Account account) async {
    try {
      final body = accountToJson(account);

      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.accountEndpoint);
      var response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        Account model = accountFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Account?> putAccount(String username, Account account) async {
    try {
      final body = accountToJson(account);
      var endPoint = "/$username";

      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.accountEndpoint + endPoint);

      return await http.put(url, headers: headers, body: body).then((response) {
        if (response.statusCode == 201) {
          Account model = accountFromJson(response.body);
          return model;
        } else {
          throw Exception("Failed to update account.");
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Item>?> getItems() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.itemEndpoint);

      return await http.get(url).then((response) {
        if (response.statusCode == 200) {
          List<Item> model = itemsFromJson(response.body);
          return model;
        } else {
          throw Exception("Failed to fetch items.");
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Task>?> getTasks() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.taskEndpoint);

      return await http.get(url).then((response) {
        if (response.statusCode == 200) {
          List<Task> model = tasksFromJson(response.body);
          return model;
        } else {
          throw Exception("Failed to fetch tasks.");
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
