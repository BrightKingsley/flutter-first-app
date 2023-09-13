import 'package:flutter/material.dart';
import 'package:flutter_first_app/services/countries.dart';
import 'package:flutter_first_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  // void updateTime(index) async {
  //   WorldTime instance = WorldTime(
  //       location: "${countries[index]["name"]["common"]}",
  //       url:
  //           "${countries[index]["region"]}/${countries[index]["name"]["common"]}",
  //       flag: "${locations[index]["flags"]["png"]}");
  //   await instance.getTime();

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });

    //navigate to home screen
    // Navigator.pop(context, {
    //   "time": instance.time,
    //   "location": instance.location,
    //   "flag": instance.flag,
    //   "isDaytime": instance.isDaytime
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("Choose Location"),
          centerTitle: true,
          shadowColor: Colors.blue[200],
        ),
        // body: const Text("choose location screen"),
        body: SafeArea(
            child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1, vertical: 4),
                      child: Card(
                        child: ListTile(
                            onTap: () {
                              updateTime(index);
                            },
                            title: Text(locations[index].location),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/${locations[index].flag}"),
                            )),
                      ),
                    ))));
  }
}
