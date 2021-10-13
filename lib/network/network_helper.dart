import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_task/models/model_data.dart';

class NetworkHelper {
  NetworkHelper({@required this.url});
  String? url;
  // ignore: prefer_typing_uninitialized_variables
  var data;
  Future network() async {
    try {
      http.Response response = await http.get(Uri.parse(url!));
      if (response.statusCode == 200) {
        data = dataModelFromJson(response.body);

        return data;
      }
    } catch (e) {
      SnackBar(content: Text(e.toString()));
    }
  }
}
