class CategoryModel {
   String? categoryName;
   String? id;
  late String path;

  // CategoryModel();
  CategoryModel({
    required this.id,
    required this.categoryName
});

  CategoryModel.formMap(Map<String, dynamic> map) {
    id = map['id'];
    categoryName = map['categoryName'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['categoryName'] = categoryName;
    return map;
  }
}
