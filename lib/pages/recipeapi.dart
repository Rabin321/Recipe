import 'dart:convert';

import 'package:http/http.dart' as http;
import 'recipefromapi.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.http('yummly2.p.rapidapi.com', 'feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'x-rapidapi-key': 'API KEY HERE FROM YUMMLY API',
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['conttent']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
