import 'package:flutter/cupertino.dart';
import 'package:provider_task/models/model_data.dart';
import 'package:provider_task/network/network_helper.dart';

class ProviderScreen extends ChangeNotifier {
  List<DataModel> itemList = [];
  List<DataModel> get data {
    return itemList;
  }

  Future getNetworkData() async {
    try {
      NetworkHelper networkHelper =
          NetworkHelper(url: 'https://jsonplaceholder.typicode.com/albums');
      itemList = await networkHelper.network();
    } catch (e) {
      rethrow;
    }
  }
}
