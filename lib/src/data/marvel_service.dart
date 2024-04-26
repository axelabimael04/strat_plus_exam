import 'package:strat_plus_exam/src/data/marvel_endpoints.dart';
import 'package:strat_plus_exam/src/models/marvel_response_model.dart';

class MarvelService {
  MarvelEndpoints endpoints = MarvelEndpoints();

  ///Get initial load of characters
  Future<MarvelCharactersResponse?> getInitialCharacters() async {
    try {
      Map<String, dynamic>? response = await endpoints.getCharacters();
      if (response == null) return null;

      MarvelCharactersResponse data =
          MarvelCharactersResponse.fromMap(response);
      return data;
    } catch (e) {
      return null;
    }
  }

  ///Get the next 10 characters
  Future<MarvelCharactersResponse?> getNextCharacters(int startAt) async {
    try {
      Map<String, dynamic>? response =
          await endpoints.getCharacters(limit: 10, startAt: startAt);
      if (response == null) return null;

      MarvelCharactersResponse data =
          MarvelCharactersResponse.fromMap(response);
      return data;
    } catch (e) {
      return null;
    }
  }
}
