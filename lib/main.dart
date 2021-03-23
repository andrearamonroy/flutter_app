import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//+ Adding an open source package
//Open source package named english_words, which contains a few thousand of the most used english words and some utility functions.
//using an external package: go to "pubspec.yaml" and click pub get to pull the package into the project.
//pub get auto-generates the pubspec.lock file with a list of all packages pulled into the project and their version numbers.
//now import the package
//when making adding to the dependencies list in "pubspec.yaml" indention is IMPORTANT if not added correctly it won't work and it won't add the packages.



//+ Adding a Stateful Widget
//Stateless widgets are immutable = properties can't change, all values are final.
//Stateful widget state that might change during the lifetime of the widget.
//Stateful widgets contain 2 classes = 1. stateful widget class(immutable) that creates an instance of 2. a state class (persist over the lifetime of the widget.)


void main() => runApp(MyApp()); // => for one function or methods

// MyApp
class MyApp extends StatelessWidget { //stateless widget makes the app itself a widget
  // build
  @override
  Widget build(BuildContext context) { //describes how to display the widget in terms of lower widgets
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
//end build
}
// end MyApp

// Adding variables to the class
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  // end var but don't close with brackets

  // function _buildSuggestions
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/ //divides i by 2 and returns an integer result
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }
  // end function _buildSuggestions

  // function _buildRow
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
  // end function _buildRow

  // #update widget-build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
// end of update widget-build
// end of var
}
// close var with bracket

//update stateful widget
class RandomWords extends StatefulWidget {
  @override
  State<RandomWords> createState() => _RandomWordsState();
}
