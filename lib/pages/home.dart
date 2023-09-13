import 'package:flutter/material.dart';
// import 'package:flutter_first_app/services/countries.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data = {};

  @override
  Widget build(BuildContext context) {
    // Countries().getCountries();
    // data =  ModalRoute.of(context)?.settings.arguments;
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments;

    String bgImage = data["isDaytime"] ? "day.jpeg" : "night.png";
    Color bgColor = data["isDaytime"] ? Colors.blue : Colors.indigo;
    Color textColor = data["isDaytime"] ? Colors.grey : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$bgImage"), fit: BoxFit.cover)),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
                icon: const Icon(Icons.edit_location),
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  setState(() {
                    data = {
                      "time": result["time"],
                      "location": result["location"],
                      "flag": result["flag"],
                      "isDaytime": result["isDaytime"]
                    };
                  });
                },
                label: const Text("Choose a location")),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data["location"],
                  style: const TextStyle(fontSize: 28, letterSpacing: 2),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              data["time"],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 66, color: textColor),
            )
          ],
        ),
      )),
    );
  }
}
