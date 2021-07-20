import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_project_1/screens/recipes/models/recipe.dart';

class RecipeClient {
  Future<List<Recipe>> getRecipes(String searchQuery) async {
    QuerySnapshot recipesDocs;
    List<QueryDocumentSnapshot> recipes;
    List<Recipe> recipesList = [];

    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      recipesDocs = await FirebaseFirestore.instance
          .collection('Recipes')
          .where('lowerName', isGreaterThanOrEqualTo: searchQuery.toLowerCase())
          .where('lowerName', isLessThan: searchQuery.toLowerCase() + '\uf8ff')
          .get();
    } else {
      recipesDocs =
          await FirebaseFirestore.instance.collection('Recipes').get();
    }

    recipes = recipesDocs.docs;

    recipes.forEach((docSnap) {
      recipesList.add(Recipe(
        name: docSnap.id,
        id: docSnap['id'],
        image: docSnap['image'],
        timeToCook: docSnap['timeToCook'],
        portions: docSnap['portions'],
        portionSize: docSnap['portionSize'],
        price: docSnap['price'],
        description: docSnap['description'],
      ));
    });

    return recipesList;
  }

  Future<Recipe> getSingleRecipe(int id) async {
    QuerySnapshot recipeSnap = await FirebaseFirestore.instance
        .collection('Recipes')
        .where('id', isEqualTo: id)
        .get();

    QueryDocumentSnapshot recipe = recipeSnap.docs.first;

    return Recipe(
      name: recipe.id,
      id: recipe['id'],
      image: recipe['image'],
      timeToCook: recipe['timeToCook'],
      portions: recipe['portions'],
      portionSize: recipe['portionSize'],
      price: recipe['price'],
      description: recipe['description'],
      productsList: recipe['products'],
      recipeInstructions: recipe['recipeInstructions'],
    );
  }
}
