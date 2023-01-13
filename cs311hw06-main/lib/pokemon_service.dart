import 'pokemon_api.dart';
import 'package:flutter/material.dart';

class PokemonService extends ChangeNotifier {
  int pokemonCount = 1;
  int currentPokemon = 0;
  var theme = const Color (0xFF6390F0);
  var themeSet = {
    'normal' : const Color (0xFFA8A77A),
    'fire' : const Color (0xFFEE8130),
    'water' : const Color (0xFF6390F0),
    'electric' : const Color (0xFFF7D02C),
    'grass' : const Color (0xFF7AC74C),
    'ice' : const Color (0xFF96D9D6),
    'fighting' : const Color (0xFFC22E28),
    'poison' : const Color (0xFFA33EA1),
    'ground' : const Color (0xFFE2BF65),
    'flying' : const Color (0xFFA98FF3),
    'psychic' : const Color (0xFFF95587),
    'bug' : const Color (0xFFA6B91A),
    'rock' : const Color (0xFFB6A136),
    'ghost' : const Color (0xFF735797),
    'dragon' : const Color (0xFF6F35FC),
    'dark' : const Color (0xFF705746),
    'steel' : const Color (0xFFB7B7CE),
    'fairy' : const Color (0xFFD685AD),
  };

  void changePokemonTheme(int pokemonId) async {
    var pokemon = await fetchPokemonInfo(pokemonId);
    theme = themeSet[pokemon.types[0]]!;
    notifyListeners();
  }

  void changePokemonCount(int value) {
    pokemonCount += value;
    if (pokemonCount < 0) {
      pokemonCount = 0;
    }
    notifyListeners();
  }

  void currentPokemonBorder(int pokemonId){
    currentPokemon = pokemonId;
    notifyListeners();
  }
}

