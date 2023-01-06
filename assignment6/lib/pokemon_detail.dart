import 'package:flutter/material.dart';
import 'package:strings/strings.dart';
import 'pokemon_api.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({Key? key, required this.pokemonId}) : super(key: key);

  final int pokemonId;

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: fetchPokemonInfo(pokemonId),
      builder: (context, AsyncSnapshot <PokemonInfo> snapshot) {
        if(snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(capitalize(snapshot.data!.name)),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(genPokemonImageUrl(pokemonId)),
                  Text("NAME: ${capitalize(snapshot.data!.name)}",),
                  Text("TYPE: ${snapshot.data!.typesToString()}",),
                  Text("ABILITY: ${capitalize(snapshot.data!.ability)}",),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: const Text(''),),
            body: const CircularProgressIndicator(),
          ) ;
        }
      }
    );
  }
}