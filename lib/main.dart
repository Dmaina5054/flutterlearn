import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //replace hello world with random word pair
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Test Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Skeleton'),
        ),
        body: Center(
          child: RandomWords(),
        ),
        
          
      ),
      
    );
  }
}

//design a stateful widget
class RandomWords extends StatefulWidget {
  RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}


//this code below will contain the apps logic
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; //suggestions of type wordpair
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Startup Name Generator'),
      // ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if (i.isOdd) return const Divider();
        final index = i ~/2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }
}

Widget _buildRow(WordPair suggestion) {
  var biggerFont = const TextStyle(fontSize: 18.0);;
  return ListTile(
    title: Text(
      suggestion.asSnakeCase,
      style: biggerFont,
    ),
  );
}
