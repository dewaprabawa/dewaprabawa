import 'package:flutter/material.dart';
import "package:carousel_slider/carousel_slider.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodscanner/UI/QrScanner/qrscanner.dart';

final List<String> dummyImage = [
  "1.jpg",
  "2.jpg",
  "3.jpg",
  "4.jpg",
  "5.jpg",
];

 List<IconData> dummyData(){
  return [
    Icons.local_pizza, Icons.emoji_food_beverage, Icons.set_meal, Icons.icecream
  ];  
}

final List item = map<Widget>(dummyImage, (index,i) {
  return Container(
    margin: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
            image: AssetImage("images/${i}"), fit: BoxFit.fill),
        color: Colors.orange),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Usable Drink for Health',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Lorem Ipsum is simply dummy text use for printing and type script',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
});

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}




class ShopePage extends StatefulWidget {
  ShopePage({Key key}) : super(key: key);

  @override
  _ShopePageState createState() => _ShopePageState();
}

class _ShopePageState extends State<ShopePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[200],
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => QRscanner()));
      },child: Icon(FontAwesomeIcons.qrcode),),
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text("Category"),
      ),
      body: ListView(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 180,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
            ),
            items: item,
          ),
          Container(
            height: 600,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
               
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                     elevation: 14.0,
                     shadowColor: Color(0x802196F3),
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center(
                        child: Text(
                          "",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                     elevation: 14.0,
                     shadowColor: Color(0x802196F3),
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center(
                        child: Text(
                          "",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child:  Material(
                     elevation: 14.0,
                     shadowColor: Color(0x802196F3),
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center(
                        child: Text(
                          "",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                     elevation: 14.0,
                     shadowColor: Color(0x802196F3),
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center(
                        child: Text(
                          "",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                     elevation: 14.0,
                     shadowColor: Color(0x802196F3),
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center(
                        child: Text(
                          "",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
