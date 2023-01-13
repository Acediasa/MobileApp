import 'pokemon_counter.dart';
import 'pokemon_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pokemon_service.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            PokemonCounter(),
            PokemonList(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: pokemonService.theme,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.catching_pokemon),
                label: 'Pokemon'
            ),
          ],
        ),
      );
    });
  }
}
