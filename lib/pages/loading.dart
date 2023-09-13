import 'package:flutter/material.dart';
import 'package:flutter_first_app/services/countries.dart';
import 'package:flutter_first_app/services/world_time.dart';
// import 'package:';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading..";

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: "Berlin", flag: "", url: "Europe/Berlin");
    await instance.getTime();
    // instance.getTime();

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "time": instance.time,
      "location": instance.location,
      "flag": instance.flag,
      "isDaytime": instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Text(time)));
  }
}
