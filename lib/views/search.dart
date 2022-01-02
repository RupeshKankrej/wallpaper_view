import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_view/data/data.dart';
import 'package:wallpaper_view/model/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_view/widget/widget.dart';

class Search extends StatefulWidget {
  final String searchQuery;
  const Search({Key? key, required this.searchQuery}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  List<WallpaperModel> wallpapers = [];

  getSearchWallpers(query) async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=15"),
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
    getSearchWallpers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: brandName(),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      getSearchWallpers(searchController.text);
                    },
                    child: const Icon(Icons.search),
                  ),
                ],
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
