import 'package:assignment6/pokemon_detail.dart';
import 'package:flutter/material.dart';
import 'pokemon_api.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pokemon List'),
      ),
      body: Row(
        children: [
          Expanded(child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => const PokemonDetail(pokemonId: 130))
                );
              },
              child: Image.network(genPokemonImageUrl(130)))),
          Expanded(child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => const PokemonDetail(pokemonId: 4))
                );
              },
              child: Image.network(genPokemonImageUrl(4)))),
          Expanded(child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => const PokemonDetail(pokemonId: 256))
                );
              },
              child: Image.network(genPokemonImageUrl(256)))),
        ],
      ),
    );
  }
}