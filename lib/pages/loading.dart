import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String a = "loading";
  void setupWorldTime() async {
    Worldtime instance =
        Worldtime(location: 'Berlin', flag: 'germany.png', url: 'Asia/India');
    await instance.get_time();
    print(instance.time);
    setState(() {
      a = instance.time;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print("Init Works");
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(a),
      ),
    );
  }
}
