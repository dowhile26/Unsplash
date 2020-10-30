import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String description;

  ReusableCard({
    @required this.username,
    @required this.description,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Card(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          elevation: 8.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 4.0, top: 0, right: 4.0, bottom: 4.0),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withAlpha(0),
                Colors.black38,
                Colors.black45,
                Colors.black54,
                Colors.black87,
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                username ?? '',
                style: kCardTitleStyle,
              ),
              Text(
                description ?? '',
                textAlign: TextAlign.left,
                style: kCardTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}