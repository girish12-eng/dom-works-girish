import 'package:flutter/material.dart';

import 'EditCustomerList.dart';
import 'ListUtils.dart';

class CowMilkHome extends StatefulWidget {
  @override
  _CowMilkHomeState createState() => _CowMilkHomeState();
}

class _CowMilkHomeState extends State<CowMilkHome> {
  final TextEditingController _searchControl = new TextEditingController();

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
        title:Padding(
          padding:
          const EdgeInsets.only(bottom: 10.0, right: 10.0,top: 10.0),
          child: Container(
            height: 35.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.0),
              border: Border(
                left: BorderSide(
                  color: Colors.pink,
                  width: 2,
                ),
                right: BorderSide(
                  color: Colors.pink,
                  width: 2,
                ),
                bottom: BorderSide(
                  color: Colors.pink,
                  width: 2,
                ),
                top: BorderSide(
                  color: Colors.pink,
                  width: 2,
                ),
              ),
            ),
            child: TextField(
              controller: _searchControl,
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.only(left: 10.0, top: 8.0, bottom: 10.0),
                hintText: "Search",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  size: 25.0,
                  color: Colors.pink,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: ListUtils.listOfCustomersListNames.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: 80.0,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditCustomerList(
                                listOfCustomersListNames: ListUtils.listOfCustomersListNames[index],
                                listOfCustomersAddress: ListUtils.listOfCustomersAddress[index],
                              )));
                },
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(ListUtils.listOfCustomersListIcons[index]),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            Text(ListUtils.listOfCustomersListNames[index],style: TextStyle(color: Colors.pink,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text(ListUtils.listOfCustomersAddress[index])
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit,color: Colors.pink,),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),


    );
  }
}
