import 'package:flutter/material.dart';
import 'package:youtube/services/api.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    Api api = Api();
    api.pesquisar("");

    return Container(
      child: Center(
        child: Text(
          "Início",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
