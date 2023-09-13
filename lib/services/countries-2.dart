import 'dart:convert';

import 'package:http/http.dart' as http;

class Countries {
  late List countries = [];

  Future<void> getCountries() async {
    try {
      print("RUNNING_GETTING");

      http.Response response =
          await http.get(Uri.https("restcountries.com", "v3.1/all"));

      print("RSPONSE==> $response");
      countries = jsonDecode(response.body);
      // countries = data;

      // countries = data.map((d) => d["name"]["common"]).toList();
      print(countries);
    } catch (e) {
      // TODO
      print("An error occured $e");
    }
    // countries = data.map((d) => d["name"]["common"]).toList();
    // print("COUNTRIES_LIST $countries");

    // countries = data.map((key, value) => );
  }
}
