import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tables24new/constants.dart';
import 'package:tables24new/res_card.dart';
import 'package:tables24new/res_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Poppins",
          scaffoldBackgroundColor: kWhiteColor,
          primaryColor: kPrimaryColor,
          textTheme: TextTheme(
            headline: TextStyle(fontWeight: FontWeight.bold),
            button: TextStyle(fontWeight: FontWeight.bold),
          )

      ),
      home: HomePage(),


    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(





      bottomNavigationBar: CustomBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 50),
            child: Align(
              alignment: Alignment.topRight,

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Where would you\n like to eat",style: Theme.of(context).textTheme.headline,),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                CategoryTitle(title: "All",active: true),
                CategoryTitle(title: "Indian"),
                CategoryTitle(title: "Arabian"),
                CategoryTitle(title: "Continental"),
                CategoryTitle(title: "Chinese"),
              ],
            ),
          ),

          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kBorderColor),
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 9.0),
                hintText: "Search Restaurants",
                suffixIcon: Icon(
                    Icons.search),
                border: InputBorder.none,
              ),

            ),



          ),
          ResCard(),
          /* Expanded(

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: resList.length,


                  itemBuilder: (context, index) {
                  return resCard(resList[index]);
    },
            ),






            ),*/
        ],
      ),





    );
  }
}



class resCard extends StatelessWidget {

  final String res;
  final String image;

  resCard(this.res,this.image);


  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Container(
              width: (MediaQuery.of(context).size.width / 2) * 1.2,
              height: (MediaQuery.of(context).size.height / 2) * 0.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(this.image),fit: BoxFit.cover

                ),
              ),


            ),


          ),

          Positioned(
            top: (MediaQuery.of(context).size.height / 2) * 0.5,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Container(
                padding: EdgeInsets.all(10),
                width: (MediaQuery.of(context).size.width / 2),
                height: (MediaQuery.of(context).size.height / 2) * 0.33,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      res,
                      style: kBlackSmall,


                    ),


                    Container(
                      width: double.infinity,
                      height: 15,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index){
                            if(index<5){
                              return Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 15,
                              );
                            }
                            return Icon(
                              Icons.star,
                              color: Colors.grey,
                              size: 15,
                            );




                          }),
                    ),
                    SizedBox(height: 10),
                    Container(

                      width: double.infinity,
                      height: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (context, index){
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                            padding: EdgeInsets.symmetric(horizontal: 3,vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red[100],
                            ),
                            child: Text(
                              res,
                              style: TextStyle(color: Colors.red,fontSize: 13),
                            ),
                          );

                        },

                      ),
                    ),




                  ],
                ),

              ),
            ),
          )


        ]

    );
  }
}







class CategoryTitle extends StatelessWidget {
  final String title;
  final bool active;
  const CategoryTitle({
    Key key,
    this.active = false,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 30),
      child: Text(
        title,
        style: Theme.of(context).textTheme.button.copyWith(
          color: active ? kPrimaryColor : kTextColor.withOpacity(.4),
        ),
      ),
    );
  }
}

class CustomBar extends StatefulWidget {


  @override
  _CustomBarState createState() => _CustomBarState();
}

class _CustomBarState extends State<CustomBar> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex:currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex=index;
        });
      },

      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text("HOME"),
          icon: Icon(Icons.home),

        ),
        BottomNavigationBarItem(
          title: Text("MY BOOKINGS"),
          icon: Icon(Icons.bookmark_border),

        ),


        BottomNavigationBarItem(
          title: Text("PROFILE"),
          icon: Icon(Icons.person),

        ),



      ],

    );
  }
}





