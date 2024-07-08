class ProductsModel {
  int id;
  String title;
  num price;
  String description;
  // Category category;
  String image;
  // Rating rating;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    // required this.category,
    required this.image,
    // required this.rating,
  });
}

// enum Category { ELECTRONICS, JEWELERY, MEN_S_CLOTHING, WOMEN_S_CLOTHING }

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });
}
