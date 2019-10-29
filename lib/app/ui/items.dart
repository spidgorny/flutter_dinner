import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/recipe_data.dart';

class RecipeItem extends StatelessWidget {
  final Recipe _recipe;
  final ScaffoldState _parentView;

  RecipeItem(this._recipe, this._parentView);

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = [
      new SizedBox(
          width: double.infinity,
          height: 300.0,
          child: new Image.network(
            _recipe.imageURL,
            fit: BoxFit.cover,
          )),
      new Padding(
          padding: new EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
          child: new Text(_recipe.name, maxLines: 1)),
      new Container(
          child: new Align(
              alignment: FractionalOffset.bottomRight,
              child: new FlatButton(
                  child: new Text("Save in Favorites"),
                  onPressed: () {
                    print("heyyy");
                    _parentView.showSnackBar(new SnackBar(
                        content:
                            new Text("This recipe is saved in Favorites")));
                  })))
    ];

    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
            elevation: 3.0,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _widgets)));
  }
}
