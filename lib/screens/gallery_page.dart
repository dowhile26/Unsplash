import 'dart:ui';
import '../utilities/capitalize_func.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utilities/picture.dart';
import 'picture_page.dart';
import '../utilities/constants.dart';
import '../utilities/reusable_card.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() {
    return _GalleryPageState();
  }
}

class _GalleryPageState extends State<GalleryPage> {
  Future<List<Picture>> gallery;

  Future<List<Picture>> getData() async {
    http.Response response = await http.get(dataUrl);
    List<Picture> album = [];
    if (response.statusCode == 200) {
      String data = response.body;
      var result = jsonDecode(data);
      for (Map i in result) {
        album.add(Picture.fromJson(i));
      }
    } else {
      print(response.statusCode);
    }
    return album;
  }

  @override
  void initState() {
    super.initState();
    gallery = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'UNSPLASH',
          style: kTitleStyle,
        ),
      ),
      body: FutureBuilder<List<Picture>>(
        future: gallery,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(snapshot.data.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PicturePage(
                          imageUrl: snapshot.data[index].imageURL
                        ),
                      ),
                    );
                  },
                  child: ReusableCard(
                    username: snapshot.data[index].username,
                    description: capitalize(snapshot.data[index].description),
                    imageUrl: snapshot.data[index].imageURL,
                  ),
                );
              }),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


