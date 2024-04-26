import 'dart:convert';
import 'package:http/http.dart';
import 'package:strat_plus_exam/src/data/marvel_server_constants.dart';

class MarvelEndpoints {
   Future<Map<String, dynamic>?> getCharacters(
      {int startAt = 0, int limit = 20}) async {
    late Response response;

    try {
      response = await get(
        Uri.https(
          MarvelServerConstants.marvelServerContext,
          MarvelServerConstants.charactersPath,
          {
            "limit": "$limit",
            "ts": "1713904002",
            "apikey": MarvelServerConstants.publicKey,
            "hash": "39691ebb4c3236e64cff5480d71c434c",
            "offset": "$startAt"
          },
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );

      Map<String, dynamic> data = jsonDecode(response.body)['data'];

      if (response.statusCode != 200) return null;

      return data;
    } catch (e) {
      return null;
    }
  }
}
