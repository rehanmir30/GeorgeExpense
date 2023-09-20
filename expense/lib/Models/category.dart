class CategoryModel{

  var id;
  var cat_name;
  var cat_image;
  var cat_type;

  CategoryModel({
    this.id,
    this.cat_name,
    this.cat_type,
    this.cat_image
});

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    cat_name: json["cat_name"],
    cat_image: json["cat_image"],
    cat_type: json["cat_type"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "cat_name": cat_name,
    "cat_image": cat_image,
    "cat_type": cat_type,
  };

}