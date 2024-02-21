import 'package:flutter/material.dart';

class CategoryModel {
  late String categoryname;
  late IconData categoryicon;

  CategoryModel({required this.categoryname, required this.categoryicon});
}

//category data list

List categoryDataList = [
  CategoryModel(categoryname: "Mask", categoryicon: Icons.masks),
  CategoryModel(categoryname: "Mask", categoryicon: Icons.masks),
  CategoryModel(categoryname: "Mask", categoryicon: Icons.masks),
  CategoryModel(categoryname: "Mask", categoryicon: Icons.masks),
  CategoryModel(categoryname: "Mask", categoryicon: Icons.masks),
];
