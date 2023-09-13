import 'package:flutter/material.dart';
import 'package:flutter_first_app/pages/choose_location.dart';
import "package:flutter_first_app/pages/home.dart";
import 'package:flutter_first_app/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
        "/location": (context) => const ChooseLocation()
      },
    ));
