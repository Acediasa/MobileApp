import 'pokemon_api.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
          backgroundColor: pokemonService.theme,
        ),
        body: GridView.builder(
          itemCount: pokemonService.pokemonCount,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                pokemonService.changePokemonTheme(index+1);
                pokemonService.currentPokemonBorder(index+1);
              },
              child: Container(
                decoration: BoxDecoration(border: pokemonService.currentPokemon == index+1 ? Border.all(color: Colors.black, width: 3.0) : Border.all(color: Colors.transparent,),),
                child: Image.network(genPokemonImageUrl(index + 1)),
              ),
              // child: Image.network(genPokemonImageUrl(index + 1)),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      );
    });
  }
}


