import 'package:flutter/material.dart';
import 'package:flutternewsapp/model/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl = "https://www.openbusinesscouncil.org/wp-content/uploads/2018/09/business-3152586_960_720.jpg";
  category.add(categoryModel);

  // 2
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl = "https://unsplash.com/photos/eOvv4N6yNmk";
  category.add(categoryModel);

  // 3
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl = "https://unsplash.com/photos/H9t723yPjYI";
  category.add(categoryModel);

  // 4
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl = "https://unsplash.com/photos/Im7lZjxeLhg";
  category.add(categoryModel);

  // 5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl = "https://unsplash.com/photos/hIgeoQjS_iE";
  category.add(categoryModel);

  // 6
  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl = "https://unsplash.com/photos/DFtjXYd5Pto";
  category.add(categoryModel);

  // 7
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "https://unsplash.com/photos/8pwPnveOEiE";
  category.add(categoryModel);

  return category;
}