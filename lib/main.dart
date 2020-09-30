import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/*
  The Box Class is wrapped in a stateless widget

 */


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Color Changing Box'),
          centerTitle: true,
        ),
        body: Box(),
      ),

    );
  }
}


class Box extends StatefulWidget {
  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
  /*
    _colors is a list of the colors the user cycles through when the button is pressed
    i represents the index of the _colors list

  */

  var _colors = [Colors.red, Colors.blue, Colors.yellow, Colors.green, Colors.orange];
  var i = 0;

  /*
    Inside the padding widget is a Column widget that contains the Colored Box and a row of buttons
    The SizedBox widget is used in order to add spacing
   */

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(50.0),
      /*
        In the Column Widget is a couple of widgets wrapped in it.
        The Container widget represents the actual box that changes color
        the Center widget contains a Row widget that holds the buttons to change the color of the box
       */
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 200.0),
            color: _colors[i],
          ),
          Center(
            child: Row(
              children: [
                FlatButton.icon(
                  onPressed: () {
                    i =i - 1;
                    if(i < 0){
                      i = _colors.length - 1;
                    }
                    setState(() {
                      _colors[i];
                    });
                  },
                  icon: Icon(Icons.arrow_back),
                  label: Text(''),
                ),
                SizedBox(width: 115.0),
                FlatButton.icon(
                  onPressed:() {
                    i =i + 1;
                    if(i == _colors.length){
                      i = 0;
                    }
                    setState(() {
                      _colors[i];
                    });
                  },
                  icon: Icon(Icons.arrow_forward),
                  label: Text(''),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
