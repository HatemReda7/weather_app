import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import 'api_models/WeatherModel.dart';

class ApiFunction{

  static Future<WeatherModel> getWeatherResults({required String q}) async {
    Uri url = Uri.https(baseUrl, "/v1/current.json", {
      "accept": "application/json",
      "key": apiKey,
      "q": q,
      "Connection": "keep-alive",
      "Vary": "Accept-Encoding",
      "CDN-PullZone": "93447",
      "CDN-Uid": "8fa3a04a-75d9-4707-8056-b7b33c8ac7fe",
      "CDN-RequestCountryCode": "GB",
      "Age": "0",
      "x-weatherapi-qpm-left": "5000001",
      "CDN-ProxyVer": "1.04",
      "CDN-RequestPullSuccess": "True",
      "CDN-RequestPullCode": "200",
      "CDN-CachedAt": "11/08/2023 17:05:15",
      "CDN-EdgeStorageId": "1078",
      "CDN-Status": "200",
      "CDN-RequestId": "a5627dbb9a1e8b8407c256cdbdb4511d",
      "CDN-Cache": "MISS",
      "Accept-Ranges": "bytes",
      "Content-Length": "662",
      "Cache-Control": "public, max-age=180",
      "Content-Type": "application/json",
      "Date": "Wed, 08 Nov 2023 17:05:15 GMT",
      "Server": "BunnyCDN-DE1-755",
      "Via": "1.1 varnish (Varnish/6.0)"
    });
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    WeatherModel data = WeatherModel.fromJson(jsonData);
    return data;
  }
}
