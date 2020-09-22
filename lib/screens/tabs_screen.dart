import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  //We need statefull only because of the tabs in the lower part of the screen.
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>>
      _pages; //This is done because, we cannot access widget when initialising properties without build method. so we must use it inside our initState method.
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Category'},
      {'page': FavouritesScreen(widget.favoriteMeals), 'title': 'Favorites'},
    ];
  }

  void _selectPage(int index) //Index is provided by flutter automatically.
  {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //FOr Tabs above in the appBar.
    // return DefaultTabController(
    //   //This handes basic tab elements for us.
    //   length: 2, //How many tabs one want to have.
    //   child: Scaffold(
    //For lower tab bar.
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.orange,
        selectedItemColor: Theme.of(context).primaryColor,

        currentIndex:
            _selectedPageIndex, //Tells us which tab is currently selcted,
        // type: BottomNavigationBarType.shifting,
        items: [
          //These are the tabs that are visible
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.star),
            title: Text("Favourites"),
          ),
        ],
      ),
    );
  }
}
