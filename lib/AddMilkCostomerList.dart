import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

import 'DailyMilkCostomerList.dart';

class AddMilkCostomerList extends StatefulWidget {
  @override
  _AddMilkCostomerListState createState() => _AddMilkCostomerListState();
}

class _AddMilkCostomerListState extends State<AddMilkCostomerList> {

  String data = "";
  String nameKey = "_key_name";
  //String showData;

  TextEditingController username = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController mobile = new TextEditingController();

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler(
          (MethodCall methodcall) async {
        if (methodcall.method == 'getAll') {
          return {"flutter." + nameKey: "[ No Name Saved ]"};
        }
        return null;
      },
    );
    setData();
  }

  Future<bool> saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameKey, username.text,);
  }

  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameKey);
  }

  List showData= new List();

  setData() {
    loadData().then((value) {
      setState(() {
//        data = value;
        showData.add(value);
      });
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
        title: Text("Add Customers",style: TextStyle(color: Colors.pink,fontSize: 20.0),),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            //height: 600,
            //MediaQuery.of(context).size.height,
            color: Color(0xffcee6c1),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: 360,
                      child: TextField(
                        controller: username,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Full Name',
                          hintText: 'Enter Full Name',
                        ),
                        autofocus: true,
                      )
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: 360,
                      child: TextField(
                        controller: address,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Address',
                          hintText: 'Enter Address',
                        ),
                        autofocus: true,
                      )
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: 360,
                      child: TextField(
                        controller: mobile,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mobile No.',
                          hintText: 'Enter Your No.',
                        ),
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                      )
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Center(child: GestureDetector(
                      onTap: (){
                        saveData();
                       //_navigator();
                        setData();
                        print(showData);
                      },
                        child: Text("Save",style: TextStyle(color: Colors.white),))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: showData.length,
              itemBuilder: (context, int index){
                return Text(showData[index]);
              }),

        ],
      ),

    );
  }

  _navigator() {
    if (username.text.length != 0 || address.text.length != 0 || mobile.text.length !=0) {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              builder: (BuildContext context) => new
              DailyMilkCostomerList(
                //showData: showData.toString(),
              )
          ),
              (Route<dynamic> route) => false);
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          child: new CupertinoAlertDialog(
            content: new Text(
              "username or mobile \ncan't be empty",
              style: new TextStyle(fontSize: 16.0),
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text("OK"))
            ],
          ));
    }
  }

}

