// Flutter code sample for material.Card.2

// This sample shows creation of a [Card] widget that can be tapped. When
// tapped this [Card]'s [InkWell] displays an "ink splash" that fills the
// entire card.

import 'package:flutter/material.dart';
import 'package:newsApp/HomePage.dart';
import 'package:newsApp/MsgPage.dart';
import 'package:newsApp/PersonPage.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
String _title = 'flutter项目';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: _title,
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: new ScaffoldRoute());
  }
}

class ScaffoldRoute extends StatefulWidget {
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

var homepage = HomePage();
var msgPage = MsgPage();
var personPage = PersonPage();
final List pages = [homepage, msgPage, personPage];
final titles = ["home", "find", "favorite"];

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text(titles[_selectedIndex]),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {})
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text(titles[0])),
          BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text(titles[1])),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text(titles[2]))
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        children: <Widget>[
          HomePage(),MsgPage(),PersonPage()
        ],
       index: _selectedIndex,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
