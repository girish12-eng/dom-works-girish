import 'package:flutter/material.dart';

class MilkNotebook extends StatefulWidget {
  @override
  _MilkNotebookState createState() => _MilkNotebookState();
}

class _MilkNotebookState extends State<MilkNotebook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.pink,)),
        title: Row(
          children: <Widget>[
            Text("Share",style: TextStyle(color: Colors.pink,fontSize: 20.0,),),
            Icon(Icons.share,color: Colors.pink,)
          ],
        ),
        actions: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.arrow_left,color: Colors.pink,size: 30,),
                Text("January 2020",style: TextStyle(color: Colors.pink,fontSize: 20),),
                Icon(Icons.arrow_right,color: Colors.pink,size: 30,),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.pink,
            height: 50,
            child: Center(child: Text("NoteBook",style: TextStyle(color: Colors.white,fontSize: 22),)),
          ),
          Container(
            height: 50,
            color:Color(0xffcee6c1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Total Milk",style: TextStyle(color: Colors.pink,fontSize: 20),),
                SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                      color: Colors.pink
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text("40000 Kg",style: TextStyle(color: Colors.white,fontSize: 16),),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            height: 50,
            color:Color(0xffcee6c1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Total",style: TextStyle(color: Colors.pink,fontSize: 20),),
                SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.pink
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text("Rs. 7500000/-",style: TextStyle(color: Colors.white,fontSize: 16),),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Container(
              child: TextField(
                maxLines: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
