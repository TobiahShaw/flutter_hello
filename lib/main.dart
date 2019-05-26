import 'package:flutter/material.dart';
import 'package:hello_world/demo/animation/animation_demo.dart';
import 'package:hello_world/demo/bloc/bloc_demo.dart';
import 'package:hello_world/demo/http/http_demo.dart';
import 'package:hello_world/demo/i18n/i18n_demo.dart';
import 'package:hello_world/demo/rxdart/rxdart_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/listview_demo.dart';
import 'demo/basic_demo.dart';
import 'demo/layout_demo.dart';
import 'demo/stream/stream.dart';
import 'demo/view_demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/form_demo.dart';
import 'demo/material-components.dart';
import 'demo/state/state_management_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // iOS 应用支持多语言需要去项目配置
      localizationsDelegates: [
         GlobalMaterialLocalizations.delegate,
         GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
      // 手动指定语言地区
      locale: Locale('en', 'US'),
      // 最终决定使用的语言地区，本方法用于对应用户的语言地区和至此的语言地区
      localeListResolutionCallback: (List<Locale> locale, Iterable<Locale> supports) {
        return Locale('zh', 'CN');
      },
      debugShowCheckedModeBanner: false,
      // home: NavigatorDemo(),
      // 不使用home，使用初始路由
      initialRoute: '/i18n',
      // 通过名字路由
      routes: {
        '/': (context) => Home(),
        '/about': (context) => Page(title: 'about'),
        '/navigator': (context) => NavigatorDemo(),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),
        '/state-management': (context) => StateManagementDemo(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxDartDemo(),
        '/bloc': (context) => BlocDemo(),
        '/http': (context) => HttpDemo(),
        '/animation': (context) => AnimationDemo(),
        '/i18n': (context) => I18NDemo(),
      },
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          // 水波纹颜色
          splashColor: Colors.white70,
          // 按下颜色
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          accentColor: Color.fromRGBO(3, 54, 255, 1.0)),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("Tobiah"),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: "search",
              onPressed: () => debugPrint("search onPressed"),
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.view_quilt)),
              Tab(icon: Icon(Icons.view_agenda)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            ViewDemo(),
            SliverDemo(),
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
