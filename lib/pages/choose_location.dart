import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print("Build Works");
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
          onPressed: () {
            setState(() {
              count = count + 1;
            });
          },
          child: Text("Count Value $count")),
    );
  }
}
