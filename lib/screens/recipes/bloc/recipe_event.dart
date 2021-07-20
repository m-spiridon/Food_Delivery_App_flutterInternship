abstract class RecipeEvent {}

class RecipeLoadEvent extends RecipeEvent {
  String searchQuery;
  RecipeLoadEvent(this.searchQuery);
}
