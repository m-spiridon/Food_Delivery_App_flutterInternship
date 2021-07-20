class Recipe {
  int id;
  String image;
  String name;
  int timeToCook;
  String portions;
  int price;
  String portionSize;
  String description;
  List productsList;
  String recipeInstructions;

  Recipe(
      {this.id,
      this.image,
      this.name,
      this.timeToCook,
      this.portions,
      this.price,
      this.portionSize,
      this.description,
      this.productsList,
      this.recipeInstructions});
}
