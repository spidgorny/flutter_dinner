import 'package:flutter/material.dart';
import 'package:flutter_dinner/app/data/recipe_data.dart';
import 'package:flutter_dinner/app/injection/injector.dart';

class DetailsPage extends StatefulWidget {
  final int id;

  const DetailsPage(
    this.id, {
    Key key,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  RecipeRepository _repository;
  bool _isLoading = false;
  bool _isError = false;
  ScaffoldState _parentView;
  Recipe _recipe;

  @override
  void initState() {
    super.initState();
    loadRecipe();
  }

  void loadRecipe() async {
    _isLoading = true;
    _repository = new Injector().recipeRepository;
    var recipe = await _repository.get(widget.id);
    onLoadRecipesComplete(recipe);
  }

  @override
  void onLoadRecipesComplete(Recipe recipe) {
    setState(() {
      _recipe = recipe;
      _isLoading = false;
    });
  }

  @override
  void onLoadRecipesError() {
    setState(() {
      _isError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;

    //_parentView = Scaffold.of(context);

    if (_isLoading) {
      widget = new Center(
          child: new Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: new CircularProgressIndicator()));
    } else {
      if (_isError || _recipe == null) {
        widget = new Center(child: new Text("Error fetching server data"));
      } else {
        widget = new ListView(children: [
          new SizedBox(
              width: double.infinity,
              height: 300.0,
              child: new Image.network(
                _recipe.imageURL,
                fit: BoxFit.cover,
              )),
          ListTile(
            title: Text(
              _recipe.name,
              textScaleFactor: 2,
            ),
            subtitle: Text(_recipe.category),
            trailing: Text(
              _recipe.recipeID.toString(),
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _recipe.ingredients.map((line) {
                  return Text(
                    "* " + line,
                  );
                }).toList()),
          ),
        ]);
      }
    }

    return new Scaffold(
      appBar: new AppBar(centerTitle: false, title: new Text("Cooking Mama")),
      body: widget,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          // add to favorites
        },
      ),
    );
  }
}
