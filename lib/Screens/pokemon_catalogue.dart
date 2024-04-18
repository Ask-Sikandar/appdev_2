import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/pokemon_provider.dart';

class PokemonCatalogue extends StatefulWidget {
  const PokemonCatalogue({super.key});

  @override
  State<PokemonCatalogue> createState() => _PokemonCatalogueState();
}

class _PokemonCatalogueState extends State<PokemonCatalogue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80,),
          const Text('Pokedex'),
          Consumer<PokemonProvider>(
              builder: (context, value, child) {
                if (value.isLoading){
                  return const Center(child: CircularProgressIndicator(),);
                } else {
                  final pokemon = value.pokemons;
                  return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          child: ListTile(
                            leading: Text(pokemon[index].name),
                          ),
                        );
                      });
                }
              }
            )
        ],
      ),
    );
  }
}
