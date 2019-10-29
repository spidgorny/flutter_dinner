import 'package:flutter/material.dart';

import 'ui/bottom_navigation_view.dart';
import 'ui/recipes_list_view.dart';

final _kThemeDataRoot =
    new ThemeData(brightness: Brightness.light, primarySwatch: Colors.red);

class CookingApp extends StatefulWidget {
  @override
  CookingAppState createState() => new CookingAppState();
}

class CookingAppState extends State<CookingApp>
    implements BottomNavigationStatus {
  // final TargetPlatform _kPlatform = defaultTargetPlatform;

  Widget _home;
  Widget _bodyContent;

  @override
  void initState() {
    super.initState();

    _bodyContent = new RecipesScrollListView();

    _home = new Scaffold(
        appBar: new AppBar(centerTitle: false, title: new Text("Cooking Mama")),
        body: _bodyContent,
        bottomNavigationBar: new BottomNavigationView(this));
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Cooking Mama", theme: _kThemeDataRoot, home: _home);
  }

  @override
  void onTapChangeIndex(int position) {
    setState(() {
      if (position == 0) {
        _bodyContent = new RecipesScrollListView();
      } else {
        _bodyContent = new RecipesScrollListView();
      }
    });
  }
}
