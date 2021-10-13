import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_task/provider/provider.dart';

// ignore: must_be_immutable
class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isload = false;
  @override
  void initState() {
    start();
    super.initState();
  }

  Future start() async {
    await Provider.of<ProviderScreen>(context, listen: false).getNetworkData();
    setState(() {
      //isload = !isload;
    });
  }

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ProviderScreen>(context).itemList;

    return
        //isload == false
        //  ? const Center(child: CircularProgressIndicator())
        ListView.builder(
            itemCount: list.length,
            itemBuilder: (ctx, i) {
              final _list = list[i];
              return ListTile(
                  title: Text(
                    _list.id.toString(),
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(_list.title.toString()));
            });
  }
}
