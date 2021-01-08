import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'country.dart';

class AllCountries extends StatefulWidget {

  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {

  Future<List> countries;

  Future<List> getCountries() async {
    var response = await Dio().get("https://restcountries.eu/rest/v2/all");
    return response.data;
  }

  @override
  void initState() {
    countries = getCountries();
    super.initState();
  }

  @override

  Widget build(BuildContext context) => Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('All Countries'),
      ),
      body:FutureBuilder<List>(
        future: countries, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){
                  var push = Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Country(snapshot.data[index]['name'])
                    ),
                  );
                },
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 8
                    ),
                    child: Text(
                      snapshot.data[index]['name'],
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              );
            });
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),

    );
}
