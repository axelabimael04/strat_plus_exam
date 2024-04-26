import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strat_plus_exam/src/getx/characters_provider.dart';
import 'package:strat_plus_exam/src/models/marvel_character_model.dart.dart';
import 'package:strat_plus_exam/src/pages/character_details_page.dart';
import 'package:strat_plus_exam/src/widgets/character_card.dart';
import 'package:strat_plus_exam/src/widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !isLoading) {
      _loadMoreItems();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _loadMoreItems() async {
    setState(() {
      isLoading = true;
    });

    await Get.find<MarvelCharactersProvider>().loadMoreCharacters();
  }

  @override
  Widget build(BuildContext context) {
    MarvelCharactersProvider provider = Get.find<MarvelCharactersProvider>();

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: SafeArea(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Marvel characters".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "${provider.count} / ${provider.total} characters",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SearchWidget(),
                const SizedBox(height: 10),
                Visibility(
                  visible: provider.searchResult.isEmpty &&
                      provider.searchValue.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No coincidences with '${provider.searchValue}' "),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.charactersToRender.length,
                  itemBuilder: (context, index) {
                    MarvelCharacter character =
                        provider.charactersToRender[index];
                    int position = index + 1;
                    return InkWell(
                      child:
                          CharacterCard(index: position, character: character),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => CharacterDetailsPage(
                                    character: character)));
                      },
                    );
                  },
                ),
                Visibility(
                  visible: provider.searchValue.isEmpty,
                  child: const Padding(
                    padding: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
