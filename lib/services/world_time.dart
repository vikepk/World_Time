import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import "package:intl/intl.dart";

class Worldtime {
  late String time;
  late String url;
  late String location;
  late String flag;

  Worldtime({required this.location, required this.flag, required this.url});

  Future<void> get_time() async {
    try {
      // var the_url = Uri.parse('https://zenanvibe.me/premkumar/get_data.php');
      // var res = await http.get(the_url);
      var theUrl = Uri.parse("http://worldtimeapi.org/api/timezone/$url");

      Response response = await get(theUrl);
      Map data = jsonDecode(response.body);
      print(data);
      // print(data["datetime"]);
      // print(data["utc_offset"]);

      String datetime = data["datetime"];
      print(datetime);
      String offset = data["utc_offset"].substring(1, 3);
      print(offset);

      DateTime now = DateTime.parse(datetime);
      print(now);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now);
      time = DateFormat.jm().format(now);
      print(time);

      //print(now);

      // print(datetime);
      // print(offset);
    } catch (e) {
      print("Error:$e");
      time = "Could get time data";
    }
  }
}
