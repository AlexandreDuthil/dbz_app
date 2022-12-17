import 'dart:convert';

import 'package:http/http.dart' as http;

class Character{
  String name;
  String description;

  Character({required this.name, required this.description});
}

var sonGoku = Character(name: "Son Goku", description: "Le personnage principal de la série");
var vegeta = Character(name: "Vegeta", description: "Le personnage secondaire, vachement moins fort");
var sonGohan = Character(name: "Son Gohan", description: "Le premier fils de Son Goku");
var sonGoten = Character(name: "Son Goten", description: "Le deuxième fils de Son Goku");
var trunks = Character(name: "Trunks", description: "Le fils de Vegeta");

var characters = [sonGoku,vegeta,sonGohan,sonGoten,trunks];

class Characterz {
  Future<List<Character>> getCharacters() async {
    try {
      final response = await http
          .get(Uri.parse('http://localhost:1323/characters'), headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      });
      final extractedData = json.decode(response.body) as List<dynamic>;
      final List<Character> characters = [];
      for (dynamic element in extractedData) {
        characters.add(Character(
            name: element["Name"], description: element["Description"]));
      }
      return characters;
    } catch (e) {
      rethrow;
    }
  }
}