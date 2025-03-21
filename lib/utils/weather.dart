import 'package:http/http.dart' as http;

Future<String> getTemperature(String city) async {
  var url = Uri.parse("https://wttr.in/$city?format=%t");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return response.body.trim();
  } else {
    throw Exception("Failed to load weather data");
  }
}
