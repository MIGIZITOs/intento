import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(Final());

class Final extends StatelessWidget {
  const Final({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Final",
      debugShowCheckedModeBanner: false,
      home: FinalApp(),
    );
  }
}

class FinalApp extends StatefulWidget {
  FinalApp({Key key}) : super(key: key);

  @override
  _FinalAppState createState() => _FinalAppState();
}

class _FinalAppState extends State<FinalApp> {
  Future<void> getAPI(String number) async {
    var response = await http.get(
        "https://wsfinal.azurewebsites.net/api/" + number,
        headers: {"Accept": "application/json"});
    var data = json.decode(response.body);
    //print(data);
    responseController.text = data.toString();
  }

  final TextEditingController numberController = new TextEditingController();
  final TextEditingController responseController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Final"),
      ),
      body: ListView(
        children: [
          TextFormField(
            controller: numberController,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Ingresar numero",
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          RaisedButton(
              child: Text("API"),
              onPressed: () {
                getAPI(numberController.text);
              }),
          TextFormField(
            controller: responseController,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(),
          )
        ],
      ),
    );
  }
}
