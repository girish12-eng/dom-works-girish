import 'package:flutter/material.dart';


class DrawerUtil extends StatefulWidget {
  @override
  _DrawerUtilState createState() => _DrawerUtilState();
}

class _DrawerUtilState extends State<DrawerUtil> {



  _buildDrawerItems({String text, ontap}){
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.pink,
                    width: 0.5
                )
            )
        ),
        padding: EdgeInsets.only(left: 15.0,top:6 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15
            ),
            ),
          ],
        ),
      ),
    );
  }

  drawerHeader(){
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.pink,
                  width: 0.5
              )
          )
      ),
      child: Align(
        child: ListTile(
          leading:
          Container(
              height: 100.0,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 30,
                      child: Icon(Icons.person,size: 40,color: Colors.pink,)
                    //new Image.asset('assets/user.png'),
                  )),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(
                  color: Colors.pink,
                  width: 2.0,
                ),
              )),
          title: Text("Welcome User",style: TextStyle(fontSize: 18),),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          drawerHeader(),
          _buildDrawerItems(text: 'Home',
            ontap: (){
              Navigator.pop(context);
              },
          ),
          _buildDrawerItems(text: 'Categories',
            ontap: (){},),
        ],
      ),
    );
  }
}
