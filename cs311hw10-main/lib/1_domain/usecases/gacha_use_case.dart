import 'dart:math';

import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';
import 'package:cs311hw10/2_data/repositories/gacha_repo_impl.dart';
import 'package:flutter/material.dart';

class GachaUseCase extends ChangeNotifier {
  GenshinCharacterEntity? randomCharacter;
  Map<String, List<String>> nation = {};
  final gachaRepo = GachaRepoImpl();

  Future<void> getCharacterNationInfo(List<String> characters) async {
    nation = {'mondstadt': [], 'liyue': [], 'inazuma': [], 'sumeru': []};
    for (int i = 0; i < characters.length; i++) {
      randomCharacter = await gachaRepo.getCharacterInfo(characters[i]);
      nation[randomCharacter!.nation.toLowerCase()]?.add(randomCharacter!.name);
    }
  }

  Future<GenshinCharacterEntity> getRandomCharacter() async {
    final characters = await gachaRepo.getCharactersFromApi();
    final nations = await gachaRepo.getNationFromApi();
    if (nation.isEmpty) {
      await getCharacterNationInfo(characters);
    }
    final randomNations = nations[Random().nextInt(nations.length)];
    final randomCharacters = characters[Random().nextInt(nation[randomNations]!.length)];

    randomCharacter = await gachaRepo.getCharacterInfo(randomCharacters);
    notifyListeners();
    return randomCharacter!;
  }
}
