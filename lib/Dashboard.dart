import 'package:flutter/material.dart';

import 'FabBottomAppbarItem.dart';
import 'HomePage.dart';
import 'SpecialDay.dart';
import 'YourDesk.dart';



class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  @override
  bool get wantKeepAlive {
    return true;
  }

  int _tabSelected = 0;

  void selectedTab(int index) {
    if (_tabSelected == index) {
      tabAlreadySelected(index);
    } else {
      moveToTab(index);
    }
  }

  void moveToTab(int index) {
    setState(() {
      _tabSelected = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 10), curve: Curves.ease);
    });
  }

  void tabAlreadySelected(int index) {
    if (index == 0) {
      HomePage();
    } else if (index == 2) {
    }
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );


  var homePage = HomePage();
  var specialday = Specialday();
  var desk = YourDesk();

  Widget buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      pageSnapping: false,
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        homePage,
        specialday,
        desk
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      _tabSelected = index;
    });
  }

  Widget build(BuildContext context) {
    super.build(context);
    return getMainDashboardWidget(context);
  }
  Scaffold getMainDashboardWidget(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
//        appBar: PreferredSize(
//            preferredSize: Size.fromHeight(48.0),
//            // here the desired height
//            child: MyAppBar().getAppBar(
//              context: context,
//            )),
        body: buildPageView(),
        bottomNavigationBar: AnimatedContainer(
            color: Colors.white,
            duration: Duration(milliseconds: 500),
            child: FabBottomAppBar(
              selectedIndex: _tabSelected,
              backgroundColor: Theme.of(context).bottomAppBarColor,
              color: Theme.of(context).iconTheme.color,
              selectedColor: Colors.pink,
              onTabSelected: selectedTab,
              items: [
                FabBottomAppBarItem(
                    selectedAssetImage: "assets/home_filled_icon.png",
                    unselectedAssetImage: "assets/home_tymoff.png",
                    text: "Home"),
                FabBottomAppBarItem(
                    selectedAssetImage: "assets/home_filled_icon.png",
                    unselectedAssetImage: "assets/home_tymoff.png",
                    text: "SpecialDay"),
                FabBottomAppBarItem(
                    selectedAssetImage: "assets/home_filled_icon.png",
                    unselectedAssetImage: "assets/home_tymoff.png",
                    text: "YourDesk"),
              ],
            )));
  }
}


