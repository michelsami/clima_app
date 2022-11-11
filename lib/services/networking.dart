import 'dart:convert';

import 'package:http/http.dart' as HTTPPackage;

class NetworkManager {
  NetworkManager(this.url);

  final String url;

  Future getData() async {
    HTTPPackage.Response response = await HTTPPackage.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //  print("success");
      //  print(response.body);
      String dataFromAPI = response.body;

      return jsonDecode(dataFromAPI);
    } else {
      // print("not success");
      print(response.statusCode);
    }
  }
}
