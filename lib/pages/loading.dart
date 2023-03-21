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
  void setupWorldTime() async {
    Worldtime instance = Worldtime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.get_time();
    print(instance.time);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init Works");
    //get_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('time'),
    );
  }
}
