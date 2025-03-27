import 'package:cafe_curator/model/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  const BrewTile({super.key, required this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 6),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.brown[brew.strength],
            backgroundImage: AssetImage('images/coffee_icon.png'),
          ),
          title: Text(
            brew.name,
            style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Takes ${brew.sugars} sugar(s)',
          ),
        ),
      ),
    );
  }
}