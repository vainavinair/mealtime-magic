class Recipe {
  late final String label;
  late final String image;
  late final String cuisineType;
  late final double totalTime;
  late final String url;

  Recipe(
      {this.label = "label",
      this.image = "image",
      this.cuisineType = "cusine",
      this.totalTime = 0,
      this.url = "url"});
//factory constructor is a special type of constructor that returns an object of the same class, but with a different state  The main use case for factory constructors is to provide a way to create instances of a class in a way that can be customized, while still ensuring that the instances are of the same class.
  factory Recipe.fromMap(Map recipe) {
    return Recipe(
      label: recipe['label'] as String,
      image: recipe['image'] as String,
      cuisineType: recipe['cuisineType'][0] as String,
      totalTime: recipe['totalTime'] as double,
      url: recipe['url'] as String,
    );
  }
}
