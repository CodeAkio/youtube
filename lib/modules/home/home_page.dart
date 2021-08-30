import 'package:flutter/material.dart';
import 'package:youtube/modules/biblioteca/biblioteca_page.dart';
import 'package:youtube/modules/custom_search_delegate/CustomSearchDelegate.dart';
import 'package:youtube/modules/em_alta/em_alta_page.dart';
import 'package:youtube/modules/inicio/inicio_page.dart';
import 'package:youtube/modules/inscricao/inscricao_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;
  String? _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> _telas = [
      InicioPage(pesquisa: this._resultado),
      EmAltaPage(),
      InscricaoPage(),
      BibliotecaPage()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String? res = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              setState(() {
                _resultado = res;
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Em alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
