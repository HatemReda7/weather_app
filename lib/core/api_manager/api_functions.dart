import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import 'api_models/search_result.dart';
import 'api_models/weather_model.dart';

class ApiFunction{

  static Future<WeatherModel> getWeatherResults({required String q}) async {
    Uri url = Uri.https(baseUrl, "/v1/current.json", {
      "accept": "application/json",
      "key": apiKey,
      "q": q,
    });
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    WeatherModel data = WeatherModel.fromJson(jsonData);
    return data;
  }

  static Future<SearchResult> searchWeather({required String q}) async {
    Uri url = Uri.https(baseUrl, "/v1/search.json", {
      "accept": "application/json",
      "key": apiKey,
      "q": q,
    });
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SearchResult data = SearchResult.fromJson(jsonData);
    return data;
  }
}
