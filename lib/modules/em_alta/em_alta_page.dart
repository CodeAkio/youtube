import 'package:flutter/material.dart';

class EmAltaPage extends StatefulWidget {
  const EmAltaPage({Key? key}) : super(key: key);

  @override
  _EmAltaPageState createState() => _EmAltaPageState();
}

class _EmAltaPageState extends State<EmAltaPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Em Alta",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
