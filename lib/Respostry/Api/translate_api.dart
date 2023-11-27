import 'dart:convert';

import 'package:http/http.dart';
import '../ModelClass/translate.dart';
import './api_client.dart';

class TranslateApi {
  ApiClient apiClient = ApiClient();

  Future<Translate> getAnime(String text) async {
    String trendingpath =
        'https://google-translate113.p.rapidapi.com/api/v1/translator/text';
    var body = {"from": "auto", "to": "ml", "text": text};
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', body);

    return Translate.fromJson(jsonDecode(response.body));
  }
}
