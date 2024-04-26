import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:strat_plus_exam/src/getx/characters_provider.dart';
import 'package:strat_plus_exam/src/models/marvel_character_model.dart.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    MarvelCharactersProvider provider = Get.find<MarvelCharactersProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CupertinoSearchTextField(
        controller: searchController,
        padding: const EdgeInsets.all(10),
        keyboardType: TextInputType.name,
        onChanged: (String value) {
          onSearchTextChanged(value, provider.characters);
        },
        onSubmitted: (String value) {
          onSearchTextChanged(value, provider.characters);
        },
      ),
    );
  }

  void onSearchTextChanged(
      String text, List<MarvelCharacter> characters) async {
    MarvelCharactersProvider provider = Get.find<MarvelCharactersProvider>();

    provider.searchValue.value = text;

    if (text.isEmpty) {
      provider.searchResult.clear();
      return;
    }

    List<MarvelCharacter> searchResult = [];

    for (MarvelCharacter character in characters) {
      RegExp punctuationPattern = RegExp(r'[^\w\s]');
      String nameRaw = character.name.replaceAll(punctuationPattern, ' ');
      String nameRawNoSpaces =
          character.name.replaceAll(punctuationPattern, '');
      String nameLowerCase =
          character.name.toLowerCase().replaceAll(punctuationPattern, ' ');
      String nameLowerCaseNoSpaces =
          character.name.toLowerCase().replaceAll(punctuationPattern, '');

      List<String> coincidences = [
        nameRaw,
        nameRawNoSpaces,
        nameLowerCase,
        nameLowerCaseNoSpaces
      ];

      bool hasCoincidences = coincidences
          .where((element) => element.contains(text))
          .toList()
          .isNotEmpty;

      if (hasCoincidences) {
        searchResult.add(character);
      }
    }

    provider.searchResult.value = searchResult;
  }
}
