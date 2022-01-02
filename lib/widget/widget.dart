import 'package:flutter/material.dart';
import 'package:wallpaper_view/model/wallpaper_model.dart';
import 'package:wallpaper_view/views/image_view.dart';

Widget brandName() {
  return RichText(
    text: const TextSpan(
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      children: <TextSpan>[
        TextSpan(text: 'Wallpaper', style: TextStyle(color: Colors.black87)),
        TextSpan(text: 'View', style: TextStyle(color: Colors.blue)),
      ],
    ),
    textAlign: TextAlign.center,
  );
}

Widget wallpapersList({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: GridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map(
        (wallpaper) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageView(
                      imgUrl: wallpaper.src!.portrait,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: wallpaper.src!.portrait,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    wallpaper.src!.portrait,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    ),
  );
}
