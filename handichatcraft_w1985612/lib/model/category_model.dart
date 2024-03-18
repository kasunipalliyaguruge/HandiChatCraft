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
      categoryname: "Mask", imagePath: "asset/images/Mask.jpg", active: false),
  CategoryModel(
      categoryname: "Handloom",
      imagePath: "asset/images/Handloom.jpg",
      active: false),
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
      imagePath: "asset/images/Pottery1.jpg",
      active: false),
  CategoryModel(
      categoryname: "ResinArt",
      imagePath: "asset/images/ResinArt.jpg",
      active: false),    
  CategoryModel(
      categoryname: "Basket",
      imagePath: "asset/images/Basket.jpg",
      active: false),
  
];
