import 'package:flutter/material.dart';
import 'package:tables24new/res_view.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'main.dart';

class ResCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getRestaurants(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List snap1 = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error fetching Data"),
              );
            }
            print(snap1);
            return Expanded(

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snap1.length,


                itemBuilder: (context, index) {
                  return resCard('${snap1[index]['res_name']}','${snap1[index]['image']}');

                },
              ),


            );
          }
      ),
    );
  }
}



getRestaurants() async {
  String theUrl = 'https://tables24.000webhostapp.com/Rahul/getRestaurants.php';
  var res = await http.get(
      Uri.encodeFull(theUrl), headers: {"Accept": "application/json"});
  var responsBody = json.decode(res.body);
  print(responsBody);
  return responsBody;
}



