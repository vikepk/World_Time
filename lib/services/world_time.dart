import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Worldtime {
  late String time;
  late String url;
  late String location;
  late String flag;

  Worldtime({required this.location, required this.flag, required this.url});

  void get_data() async {
    // var the_url = Uri.parse('https://zenanvibe.me/premkumar/get_data.php');
    // var res = await http.get(the_url);
    var theUrl = Uri.parse("http://worldtimeapi.org/api/timezone/$url");

    Response response = await get(theUrl);
    Map data = jsonDecode(response.body);
    // print(data);
    // print(data["datetime"]);
    // print(data["utc_offset"]);

    String datetime = data["datetime"];
    //print(datetime);
    String offset = data["utc_offset"].substring(1, 3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    time = now.toString();

    //print(now);

    // print(datetime);
    // print(offset);
  }
}
