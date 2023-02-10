class Recipe {
  late final String label;
  late final String image;
  late final String cuisineType;
  late final double totalTime;

  Recipe({
    this.label = "label",
    this.image = "image",
    this.cuisineType = "cusine",
    this.totalTime = 0,
  });

  factory Recipe.fromMap(Map recipe) {
    return Recipe(
      label: recipe['label'] as String,
      image: recipe['image'] as String,
      cuisineType: recipe['cuisineType'][0] as String,
      totalTime: recipe['totalTime'] as double,
    );
  }
}
