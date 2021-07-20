abstract class SingleRecipeEvent {}

class SingleRecipeLoadEvent extends SingleRecipeEvent {
  int id;
  SingleRecipeLoadEvent(this.id);
}
