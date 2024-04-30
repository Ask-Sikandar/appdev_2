
import 'package:appdev_2/Models/pokemon.dart';
import 'package:appdev_2/Service/pokemon_service.dart';
import 'package:flutter/foundation.dart';

class PokemonProvider extends ChangeNotifier{
  final _service = PokemonService();
  bool isLoading = true;
  @override
  notifyListeners();
  List<Pokemon> _pokemons = [];
  List<Pokemon> get pokemons => _pokemons;

  Future<void> getAllPokemons() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAllPokemons();

    _pokemons = response;
    isLoading = false;
    notifyListeners();
  }
}