import 'package:flutter/material.dart';
import 'home/TheaterMovie.dart';
import 'home/page2.dart';
import 'home/page3.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomeAppState();
  }
}

class _MyHomeAppState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Tab> titleTabs = <Tab>[
    Tab(text: '院线'),
    Tab(text: '喜欢'),
    Tab(text: '发现'),
  ];
  List<Widget> tabViews = [TheaterMovie(), page2(), page3()];

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        switch (_tabController.index) {
          case 0:
            print(0);
            break;
          case 1:
            print(1);
            break;
          case 2:
            print(2);
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget tabView = new Column(
      children: <Widget>[
        new Container(
          child: new TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Color(0xff666666),
            tabs: titleTabs,
            controller: _tabController,
          ),
        ),
        new Expanded(
          child: TabBarView(
            children: tabViews,
            controller: _tabController,
          ),
        )
      ],
    );
    return tabView;
  }

}

