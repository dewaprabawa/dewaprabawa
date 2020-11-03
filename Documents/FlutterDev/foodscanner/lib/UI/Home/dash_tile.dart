import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodscanner/Models/userdata.dart';
import 'package:provider/provider.dart';

class DashTile extends StatefulWidget {
  DashTile({Key key}) : super(key: key);

  @override
  _DashTileState createState() => _DashTileState();
}

class _DashTileState extends State<DashTile> {
  @override
  Widget build(BuildContext context) {

    final userData = Provider.of<UserData>(context);

    return StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal:16.0,vertical:10.0),
      children: <Widget>[
        customItemExtended(Icons.person_pin,Colors.greenAccent,"Username", "${userData.email}",15),
        customItem(Icons.monetization_on,Colors.green[200],"${userData.balance}", "Balance"),
        customItem(Icons.circle_notifications,Colors.orange[300],"Unkown", "Notification"),
        customItemChart("Drink Volume", "10K"),
        customItemExtended(Icons.insert_emoticon,Colors.orangeAccent,"Emotion", "Happiness",25)
        
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, 100),
        StaggeredTile.extent(1, 150),
        StaggeredTile.extent(1, 150),
        StaggeredTile.extent(2, 150),
        StaggeredTile.extent(2, 100),
      ],
      );
  }


  Material customItemExtended(IconData icon,Color colorIcon, String title, String heading, double textSize){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Padding(padding: EdgeInsets.symmetric(horizontal:25,vertical:10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Text(title, style: TextStyle(color: Colors.blue[300], letterSpacing: 1.5),),
          SizedBox(height: 10,),
          Expanded(child: Text(heading,style:TextStyle(fontSize: textSize,color: Colors.blueGrey,fontWeight: FontWeight.w700,letterSpacing: 1.5)))
        ]),
        Icon(icon,size: 40.0,color: colorIcon,)
      ]),
      )
    );
  }

  Material customItem(IconData icon, Color colorIcon,String title, String heading){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Padding(padding: EdgeInsets.symmetric(horizontal:25, vertical:10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(icon,size:50, color: colorIcon,),
          Text(heading,style:TextStyle(fontSize: 15,color: Colors.blueGrey,fontWeight: FontWeight.w700,letterSpacing: 1.5)),
          Text(title, style: TextStyle(color: Colors.blue[300],letterSpacing: 1.5),)
          
        ],),
      ),
    );
  }

  Material customItemChart(String title, String heading){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child:Padding(padding: EdgeInsets.symmetric(horizontal:25, vertical:10),
        child: Column(children: [
          //Upper view
          Row(children: [
            //Heading and title
            Column(children: [
              Text(title, style: TextStyle(color: Colors.blue[300]),),
              Text(heading,style:TextStyle(fontSize: 25,color: Colors.blueGrey,fontWeight: FontWeight.w700,letterSpacing: 1.5))
            ],)
          ],)

          //bottom view
          //Show Chart Here Bro!
        ],),
      )
    );
  }

}