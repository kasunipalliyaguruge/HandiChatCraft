class CategoryModel {
  late String categoryname;
  late String imagePath;
  bool active;

  CategoryModel(
      {required this.categoryname,
      required this.imagePath,
      required this.active});
}

//category data list

List categoryDataList = [
  CategoryModel(
      categoryname: "Mask", imagePath: "asset/images/Masks.jpg", active: false),
  CategoryModel(
      categoryname: "cane", imagePath: "asset/images/Cane.jpg", active: false),
  CategoryModel(
      categoryname: "Batik",
      imagePath: "asset/images/Batik.jpg",
      active: false),
  CategoryModel(
      categoryname: "Jewellery",
      imagePath: "asset/images/handicraftJewellery.jpg",
      active: false),
  CategoryModel(
      categoryname: "Pottery",
      imagePath: "asset/images/Pottery.jpg",
      active: false),
  CategoryModel(
      categoryname: "ResinArt",
      imagePath: "asset/images/ResinArt.jpg",
      active: false),
  CategoryModel(
      categoryname: "ResinArt",
      imagePath: "asset/images/ResinArt.jpg",
      active: false),
  CategoryModel(
      categoryname: "ResinArt",
      imagePath: "asset/images/ResinArt.jpg",
      active: false),
];
