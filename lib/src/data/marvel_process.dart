import 'package:sqflite/sqflite.dart';
import 'package:strat_plus_exam/src/data/marvel_database.dart';
import 'package:strat_plus_exam/src/data/marvel_service.dart';
import 'package:strat_plus_exam/src/models/marvel_character_model.dart.dart';
import 'package:strat_plus_exam/src/models/marvel_response_model.dart';

class MarvelProcess {
  ///Initilize database and the first load of characters
  static Future<MarvelCharactersResponse?> init() async {
    Database database = await MarvelDatabase.initDataBase();

    MarvelCharactersResponse? response;

    Map<String, dynamic>? dataBaseValues =
        await MarvelDatabase.getSavedCharacters(database);

    if (dataBaseValues != null) {
      response = MarvelCharactersResponse.fromMap(dataBaseValues);
      return response;
    }

    response = await MarvelService().getInitialCharacters();
    if (response != null) {
      await MarvelDatabase.saveCharacters(database, response.toMap(), true);
    }

    return response;
  }

  ///Get the next 10 characters and save(or update) them in local database
  static Future<MarvelCharactersResponse?> getMoreCharacters(
      int startAt, MarvelCharactersResponse previousResponse) async {
    MarvelCharactersResponse? response;
    MarvelCharactersResponse? moreCharactersResponse =
        await MarvelService().getNextCharacters(startAt);

    if (moreCharactersResponse != null) {
      Database database = await MarvelDatabase.initDataBase();

      List<MarvelCharacter> updatedCharacters = previousResponse.characters;

      updatedCharacters.addAll(moreCharactersResponse.characters);

      response = MarvelCharactersResponse(
        offset: previousResponse.offset,
        limit: previousResponse.limit + moreCharactersResponse.limit,
        total: moreCharactersResponse.total,
        count: previousResponse.count + moreCharactersResponse.count,
        characters: updatedCharacters,
      );

      await MarvelDatabase.saveCharacters(database, response.toMap(), false);
    }

    return response;
  }
}
