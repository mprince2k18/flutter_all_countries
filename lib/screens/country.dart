import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final String name;
  Country(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(name),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            FlipCard(
                front: CountryCard(title: "Capital"),
                back: CountryDetailCard("Dhaka")
            ),
            FlipCard(
                front: CountryCard(title: "Population"),
                back: CountryDetailCard("1,324324,43242")
            ),
            FlipCard(
                front: CountryCard(title: "Flag"),
                back: CountryDetailCard("BD")
            ),
            FlipCard(
                front: CountryCard(title: "Currency"),
                back: CountryDetailCard("Taka")
            ),
            FlipCard(
                front: CountryCard(title: "Map"),
                back: CountryDetailCard("Map")
            ),

          ],
        ),
      )
    );
  }
}

class CountryDetailCard extends StatelessWidget {
  final String title;
  const CountryDetailCard(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Center(
          child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({
    Key key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      )
    );
  }
}