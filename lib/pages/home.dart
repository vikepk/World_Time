import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    //print(data);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(Icons.location_on_outlined),
              label: Text("Choose Location"),
            ),
          ],
        ),
      ),
    );
  }
}
