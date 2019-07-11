import 'package:flutter/material.dart';
import 'home/TheaterMovie.dart';
import 'home/Collect.dart';
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
  PageController mPageController = PageController(initialPage: 0);
  TabController mTabController;
  bool isPageCanChanged = true;
  List<Tab> titleTabs = <Tab>[
    Tab(text: '院线'),
    Tab(text: '喜欢'),
    Tab(text: '发现'),
  ];
  List<Widget> tabViews = [TheaterMovie(), Collect(), page3()];

  @override
  void initState() {
    super.initState();

    mTabController = new TabController(vsync: this, length: titleTabs.length);
    mTabController.addListener(() {
      if (mTabController.indexIsChanging) {
        onPageChange(mTabController.index, p: mPageController);
      }
    });
  }

  onPageChange(int index, {PageController p, TabController t}) async {
    if (p != null) {
      //判断是哪一个切换
      isPageCanChanged = false;
      await mPageController.animateToPage(index,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease); //等待pageview切换完毕,再释放pageivew监听
      isPageCanChanged = true;
    } else {
      mTabController.animateTo(index); //切换Tabbar
    }
  }

  @override
  void dispose() {
    mTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget tabView = new Column(
      children: <Widget>[
        Container(
          child: new TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Color(0xff666666),
            tabs: titleTabs,
            controller: mTabController,
            onTap: (index) {
              return tabViews[index];
            },
          ),
        ),
        Expanded(
          child: PageView.builder(
            itemCount: titleTabs.length,
            controller: mPageController,
            onPageChanged: (index) {
              if (isPageCanChanged) {
                //由于pageview切换是会回调这个方法,又会触发切换tabbar的操作,所以定义一个flag,控制pageview的回调
                onPageChange(index);
              }
            },
            itemBuilder: (BuildContext context, int index) {
              return tabViews[index];
            },
          ),
        )
      ],
    );
    return tabView;
  }
}
