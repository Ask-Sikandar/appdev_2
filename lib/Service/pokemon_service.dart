
import 'dart:convert';

import 'package:dio/dio.dart';
import '../Models/pokemon.dart';


final dio = Dio();
class PokemonService{
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final res = await dio.get(
          'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
      if (res.statusCode == 200) {
        final jsonData = jsonDecode(res.data)['pokemon'];
        final List<Pokemon> toRet =
        jsonData.map<Pokemon>((e) => Pokemon.fromJson(e)).toList();
        return toRet;
      } else {
        throw Exception('Some error occured');
      }
    } on DioException catch (e){
      throw Exception(e);
    }
  }
}
Future<void> main() async {
  var pok = PokemonService();
  List<Pokemon> poki = await pok.getAllPokemons();
  for(Pokemon p in poki){
    print(p.name);
  }
}