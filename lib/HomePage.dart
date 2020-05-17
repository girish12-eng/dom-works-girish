import 'package:flutter/material.dart';

import 'DrawerUtils.dart';
import 'ListUtils.dart';
import 'Milk_Note.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerUtil(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.list,color: Colors.pink,size: 40.0,),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            )
        ),
        //Icon(Icons.list,color: Colors.pink,size: 40.0,),
        title: Container(
          color: Colors.pink,
          height: 50,
          width: 50,
          child: Center(
              child: Text("!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold),
              )
          ),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text("Help",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 10),
                child: Text("Hisab Chutki mein",
                  style: TextStyle(color: Colors.black,
                      fontSize: 16.0),
                ),
              ),
            ],
          )
        ],
      ),

       body: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             SizedBox(
               height: 12.0,
             ),
             Container(
               height: 200.0,
               color: Colors.pink,
             ),
             SizedBox(
               height: 40.0,
             ),
             itemContainer(),
           ],
         ),
       )
    );
  }

  Widget itemContainer(){
  return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3
      ),
      shrinkWrap: true,
      itemCount: ListUtils.listOfContainersNames.length,
      itemBuilder: (BuildContext, int index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) =>
                        MilkNote()
                ));
          },
          child: Column(
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Image.asset(ListUtils.listOfContainersIcons[index]),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(ListUtils.listOfContainersNames[index])
            ],
          ),
        );
      });
  }
}
