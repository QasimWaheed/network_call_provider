import 'package:counter/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    final data = Provider.of<DataProvider>(context, listen: false);
    data.fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    // final dataModel = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Fetch Data"),
      ),
      body: Consumer<DataProvider>(
        builder: (context, value, child) {
          // value.fetchData(context);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: value.usersList.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(value.usersList[index].title),
                subtitle: Text(value.usersList[index].id.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
