import 'package:flutter/material.dart';

void main() {
  runApp(const Lufit());
}

class Lufit extends StatelessWidget {
  const Lufit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title: Text('Lufit')
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity, height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.black),
            ),
            margin: EdgeInsets.all(20),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            width:200, height:100, color: Colors.blue,
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.phone),
                Icon(Icons.message),
                Icon(Icons.contact_page)
              ],
            ),
          ),
        ),
      )
    );
  }
}
