import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  late String time; // time in that location
  String location; // location name for the ui
  String flag; // url to the asset file
  String url; // this is the location url for api endpoint
  bool isDaytime = false; // true or false if daytime or  not

  WorldTime({this.location = "", this.flag = '', this.url = ""});

  Future<void> getTime() async {
    //make the request
    try {
      print("URL====> $url");
      Response response =
          await get(Uri.https("www.worldtimeapi.org", "/api/timezone/$url"));

      Map data = jsonDecode(response.body);
      print(data);

      //get properties from date-time
      String datetime = data["datetime"];
      String offset = data["utc_offset"].toString().substring(1, 3);

      // print(datetime);
      // print(offset);

      //create DateTime Object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "could not get time";
    }
  }
}
