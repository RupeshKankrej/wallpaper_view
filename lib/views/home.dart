import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper_view/data/data.dart';
import 'package:wallpaper_view/model/categeries_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_view/model/wallpaper_model.dart';
import 'package:wallpaper_view/views/catagarie.dart';
import 'package:wallpaper_view/views/search.dart';
import 'package:wallpaper_view/widget/widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];
  TextEditingController searchController = TextEditingController();
  // String url = "https://api.pexels.com/v1/curated?per_page=1";
  // var url = Uri.https('www.api.pexels.com', '/v1/curated?per_page=1',
  //     {"Authorization": apiKey});

  getTrendingWallpers() async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=15&page=1"),
        headers: {"Authorization": apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach(
      (element) {
        WallpaperModel wallpaperModel = WallpaperModel();
        wallpaperModel = WallpaperModel.fromMap(element);
        wallpapers.add(wallpaperModel);
      },
    );
    setState(() {});
  }

  @override
  void initState() {
    getTrendingWallpers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: brandName()),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: const Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search wallpaper",
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Search(
                              searchQuery: searchController.text,
                            ),
                          ),
                        );
                      },
                      child: const Icon(Icons.search)),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoriesTile(
                    imgUrl: categories[index].imgUrl,
                    title: categories[index].categoriesName,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            wallpapersList(wallpapers: wallpapers, context: context),
          ],
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({
    Key? key,
    required this.imgUrl,
    required this.title,
  }) : super(key: key);

  final String imgUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Categorie(categorieName: title.toLowerCase()),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 4.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              height: 50,
              width: 100,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
