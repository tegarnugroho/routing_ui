import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routing UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Routing UI Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  PageController page = PageController();
  List<SideMenuItem> items = [];

  Widget _menuContent() {
    return Expanded(
      child: PageView(
        controller: page,
        children: [
          Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Cashier',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Receipt Archive',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Report',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Parked Receipt',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Stock Display',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'User Settings',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: const Center(
              child: Text( 
                'Inventory Management',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return SizedBox(
      width: 112,
      child: SideMenu(
        controller: page,
        style: SideMenuStyle(
            displayMode: SideMenuDisplayMode.auto,
            hoverColor: Colors.grey[100],
            selectedColor: Colors.transparent,
            selectedTitleTextStyle: TextStyle(color: Colors.blue.shade900),
            selectedIconColor: Colors.blue,
            itemHeight: 80,
            backgroundColor: Colors.white),
        items: items,
      ),
    );
  }

  SideMenuItem _sideMenuItem(
      {required int index, required String title, required IconData icon}) {
    return SideMenuItem(
      priority: index,
      title: title,
      onTap: () {
        page.jumpToPage(index);
      },
      builder: (context, displayMode) {
        return page.positions.isEmpty
            ? Container()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon,
                      color: index == page.page ? Colors.blue : Colors.grey),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: index == page.page ? Colors.blue : Colors.grey,
                    ),
                  ),
                ],
              );
      },
    );
  }

  @override
  void didChangeDependencies() {
    items.addAll([
      _sideMenuItem(
        index: 0,
        title: 'Cashier',
        icon: Icons.casino_sharp,
      ),
      _sideMenuItem(
        index: 1,
        title: 'Receipt Archive',
        icon: Icons.archive,
      ),
      _sideMenuItem(
        index: 2,
        title: 'Report',
        icon: Icons.report,
      ),
      _sideMenuItem(
        index: 3,
        title: 'Parked Receipt',
        icon: Icons.storage,
      ),
      _sideMenuItem(
        index: 4,
        title: 'Stock Display',
        icon: Icons.add_box,
      ),
      _sideMenuItem(
        index: 5,
        title: 'User Settings',
        icon: Icons.group,
      ),
      _sideMenuItem(
        index: 6,
        title: 'Inventory Management',
        icon: Icons.share_sharp,
      ),
    ]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _sideMenu(),
          _menuContent(),
        ],
      ),
    );
  }
}
