import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<Worldtime> locations = [
    Worldtime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    Worldtime(url: 'Europe/Berlin', location: 'Berlin', flag: 'greece.png'),
    Worldtime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    Worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    Worldtime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    Worldtime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    Worldtime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    Worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    Worldtime(url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: ''),
    Worldtime(url: 'Europe/Paris', location: 'Paris', flag: ''),
    Worldtime(url: 'Indian/Maldives', location: 'Maldives', flag: ''),
    Worldtime(url: 'Europe/Rome', location: 'Rome', flag: ''),
    Worldtime(url: 'Europe/Moscow', location: 'Moscow', flag: ''),
    Worldtime(url: 'Australia/Melbourne', location: 'Melbourne', flag: ''),
    // Worldtime(url: 'America/Mexico_City', location: 'Mexico', flag: ''),
  ];

  void updateTime(index) async {
    Worldtime instance = locations[index];
    await instance.get_time();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text("Choose Location"),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
            }));
  }
}
