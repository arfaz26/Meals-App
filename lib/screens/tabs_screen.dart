import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Category'},
    {'page': FavoriteScreen(), 'title': 'Favorite'},
  ];
  int _selectedIndexPage = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndexPage]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndexPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndexPage,
        onTap: _selectPage,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
          ),
        ],
      ),
    );

    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 0,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       bottomOpacity: 1.0,
    //       title: Text('Meals'),
    //       bottom: TabBar(
    //         indicatorColor: Colors.white,
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Category',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.favorite),
    //             text: 'Favorite',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(children: [
    //       CategoriesScreen(),
    //       FavoriteScreen(),
    //     ]),
    //   ),
    // );
  }
}
