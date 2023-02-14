class Recipe {
  late final String label;
  late final String image;
  late final String cuisineType;
  late final String url;

  Recipe(
      {this.label = "label",
      this.image = "image",
      this.cuisineType = "cusine",
      this.url = "url"});

  factory Recipe.fromMap(Map recipe) {
    return Recipe(
      label: recipe['label'] as String,
      image: recipe['image'] as String,
      cuisineType: recipe['cuisineType'][0] as String,
      url: recipe['url'] as String,
    );
  }
}
