import 'package:counter/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController titleController = TextEditingController(),
      bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Provider Demo"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Enter Title',
            ),
          ),
          const Spacer(),
          TextFormField(
            controller: bodyController,
            decoration: const InputDecoration(
              hintText: 'Enter User Id',
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              data.postData(context, titleController.text, bodyController.text);
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
