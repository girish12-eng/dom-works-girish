import 'package:flutter/material.dart';
import 'AddMilkCostomerList.dart';
import 'EditCustomerList.dart';
import 'ListUtils.dart';

class DailyMilkCostomerList extends StatefulWidget {

  String listOfCustomersListNames;
  String listOfCustomersAddress;
  DailyMilkCostomerList({this.listOfCustomersListNames, this.listOfCustomersAddress});

  @override
  _DailyMilkCostomerListState createState() => _DailyMilkCostomerListState();
}

class _DailyMilkCostomerListState extends State<DailyMilkCostomerList> {



  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green)
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.only(left: 10.0, top: 8.0, bottom: 10.0),
                hintText: "Search",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
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
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffcee6c1),
        currentIndex: _currentIndex,
        onTap: onTabTapped,// this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.delete),
            title: new Text('Delete'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              title: GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddMilkCostomerList()
                        ));
                  },
                  child: Text('Add'))
          )
        ],
      ),
    );
  }
}
class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(
                    builder: (context) =>
                        EditCustomerList(
                          //listOfCustomersListNames: ListUtils.listOfCustomersListNames,
                          //addCustomer: ListUtils.listOfCustomersAddress.toString(),
                        )));
          },
          child: tabContainers()),
    );
  }

  Widget tabContainers(){
    return ListView.builder(
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
        });
  }
}
