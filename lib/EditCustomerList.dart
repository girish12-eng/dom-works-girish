import 'package:flutter/material.dart';

import 'MilkNotebook.dart';

class EditCustomerList extends StatefulWidget {

  String listOfCustomersListNames;
  String listOfCustomersAddress;
  EditCustomerList({this.listOfCustomersListNames,this.listOfCustomersAddress});

  @override
  _EditCustomerListState createState() => _EditCustomerListState();
}

class _EditCustomerListState extends State<EditCustomerList> {
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
        children: [
          Column(
            children: <Widget>[
              customerDetailsContainer(),
              SizedBox(
                height: 2,
              ),
              milkDetailContainer(),
              Container(
                child: Table(
                  border: TableBorder.all(color: Colors.pink),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 60,
                                    width: 60,
                                    color:Color(0xffcee6c1),
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("01",style: TextStyle(color: Colors.pink,fontSize: 18,fontWeight: FontWeight.bold),),
                                    Text("SUN",style: TextStyle(color: Colors.pink,fontSize: 15),),
                                  ],
                                )
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border(
                                        left: BorderSide(
                                          color: Colors.pink,
                                          width: 1,
                                        ),
                                        right: BorderSide(
                                          color: Colors.pink,
                                          width: 1,
                                        ),
                                        bottom: BorderSide(
                                          color: Colors.pink,
                                          width: 1,
                                        ),
                                        top: BorderSide(
                                          color: Colors.pink,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Text("No.100")),
                                Text("Rate Rs. 300"),
                              ],
                            ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  customerDetailsContainer(){
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: Colors.pink,
      child: Padding(
        padding: const EdgeInsets.only(left: 10,top: 6,right: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.listOfCustomersListNames,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                Text(widget.listOfCustomersAddress,style: TextStyle(color: Colors.white,fontSize: 16),),
              ],
            ),
            GestureDetector(
    onTap: (){
    Navigator.push(context,
    MaterialPageRoute(
    builder: (context) =>
    MilkNotebook()));
    },
              child: Container(
                //color: Colors.white,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border(
                    left: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    right: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    top: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: <Widget>[
                      Text("Diary",style: TextStyle(color: Colors.white),),
                      Icon(Icons.book,color: Colors.white,size: 15,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget milkDetailContainer(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              color: Colors.pink,
              child: Padding(
                padding: const EdgeInsets.only(left:10.0,right: 8.0),
                child: Row(
                  children: <Widget>[
                    Text("Milk Rate",style: TextStyle(color: Colors.white,fontSize: 20),),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border(
                          left: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          right: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          top: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text("Rs.75",style: TextStyle(color: Colors.white,fontSize: 16),),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.edit,color: Colors.white,size: 20,)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 2,
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              color: Colors.pink,
              child: Padding(
                padding: const EdgeInsets.only(left:10.0,right: 8.0),
                child: Row(
                  children: <Widget>[
                    Text("Total Milk",style: TextStyle(color: Colors.white,fontSize: 20),),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border(
                          left: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          right: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          top: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text("3000 Kg",style: TextStyle(color: Colors.white,fontSize: 16),),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    //Icon(Icons.edit,color: Colors.white,size: 20,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
