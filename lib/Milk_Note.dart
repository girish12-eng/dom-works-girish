import 'package:flutter/material.dart';

import 'DailyMilkCostomerList.dart';

class MilkNote extends StatefulWidget {
  @override
  _MilkNoteState createState() => _MilkNoteState();
}

class _MilkNoteState extends State<MilkNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text("calcu",
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
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 12.0,
          ),
          Container(
            height: 200.0,
            color: Colors.pink,
          ),
          SizedBox(
            height: 80.0,
          ),
          cowMilkContainer(),
        ],
      ),
    );
  }

  Widget cowMilkContainer(){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Image.asset("assets/For Dairy Milk.png"),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text("Dairy milk")
            ],
          ),
          SizedBox(
            width: 12.0,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DailyMilkCostomerList()
                  ));
            },
            child: Column(
              children: <Widget>[
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Image.asset("assets/Milk Notebook.png"),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text("Cow milk")
              ],
            ),
          ),

        ],
      ),
    );
  }

}
