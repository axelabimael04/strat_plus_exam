import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:strat_plus_exam/src/models/marvel_character_model.dart.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.index,
    required this.character,
  });

  final MarvelCharacter character;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Text(
              "$index.",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
            const  SizedBox(width: 10),
            CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(
                "${character.thumbnail.path}.${character.thumbnail.extension.name}",
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),
                  Visibility(
                    visible: character.description.isNotEmpty,
                    replacement: Container(),
                    child: Text(
                      character.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
