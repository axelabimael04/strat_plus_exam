import 'package:get/get.dart';
import 'package:strat_plus_exam/src/data/marvel_process.dart';
import 'package:strat_plus_exam/src/models/marvel_character_model.dart.dart';
import 'package:strat_plus_exam/src/models/marvel_response_model.dart';

class MarvelCharactersProvider extends GetxController {
  RxInt offset = 0.obs;
  RxInt limit = 0.obs;
  RxInt total = 0.obs;
  RxInt count = 0.obs;
  RxList<MarvelCharacter> characters = <MarvelCharacter>[].obs;

  RxString searchValue = "".obs;
  RxList<MarvelCharacter> searchResult = <MarvelCharacter>[].obs;

  List<MarvelCharacter> get charactersToRender =>
      searchResult.isEmpty ? characters : searchResult;

  /// Initialize all values for MarvelCharactersProvider
  Future<void> init() async {
    await MarvelProcess.init().then((data) {
      if (data != null) _upateValues(data);
    });
  }

  /// Load the next 10 characters
  Future<void> loadMoreCharacters() async {
    List<MarvelCharacter> previousCharacters = characters.call();
    await MarvelProcess.getMoreCharacters(
      count.value,
      MarvelCharactersResponse(
        offset: offset.value,
        limit: limit.value,
        total: total.value,
        count: count.value,
        characters: previousCharacters,
      ),
    ).then((value) {
      MarvelCharactersResponse? data = value;
      if (data != null) _upateValues(data);
    });
  }

  void _upateValues(MarvelCharactersResponse data) {
    offset.value = data.offset;
    limit.value = data.limit;
    total.value = data.total;
    count.value = data.count;
    characters.value = data.characters;
  }
}
