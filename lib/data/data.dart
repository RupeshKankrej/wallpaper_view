import 'package:wallpaper_view/model/categeries_model.dart';

String apiKey = "563492ad6f91700001000001d49bffb174734754995bfd7a5a05cc2d";

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = [];
  CategoriesModel categoriesModel = CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/3018073/pexels-photo-3018073.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName = "Street Art";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();
  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/4220967/pexels-photo-4220967.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Nature";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();
  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/47547/squirrel-animal-cute-rodents-47547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName = "Wild Life";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();
  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/219692/pexels-photo-219692.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName = "City";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();
  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/1910230/pexels-photo-1910230.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName = "Abstract";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();
  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/39855/lamborghini-brno-racing-car-automobiles-39855.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName = "Cars";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();
  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/2582937/pexels-photo-2582937.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Technology";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();
  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/1076758/pexels-photo-1076758.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName = "Marine Life";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  return categories;
}
