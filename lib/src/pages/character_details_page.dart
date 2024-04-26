import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:strat_plus_exam/src/models/item_model.dart';
import 'package:strat_plus_exam/src/models/marvel_character_model.dart.dart';

class CharacterDetailsPage extends StatelessWidget {
  final MarvelCharacter character;
  const CharacterDetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      "${character.thumbnail.path}.${character.thumbnail.extension.name}",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Visibility(
                    visible: character.description.isNotEmpty,
                    child: Text(character.description),
                  ),
                  const SizedBox(height: 15),
                  _buildSection("Comics", character.comics.items),
                  const SizedBox(height: 15),
                  _buildSection("Series", character.series.items),
                  const SizedBox(height: 15),
                  _buildSection("Stories", character.stories.items),
                  const SizedBox(height: 15),
                  _buildSection("Events", character.events.items),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Item> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 5),
        Visibility(
          visible: items.isNotEmpty,
          replacement: Text("No ${title.toLowerCase()} available"),
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 15),
            itemCount: items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "-",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(items[index].name)),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
