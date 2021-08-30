import 'package:flutter/material.dart';
import 'package:youtube/model/video.dart';
import 'package:youtube/services/api.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class InicioPage extends StatefulWidget {
  final String? pesquisa;

  const InicioPage({Key? key, required this.pesquisa}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  _listarVideo(String? pesquisa) {
    Api api = Api();
    var videos = api.pesquisar(pesquisa ?? "");

    return videos;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
        future: _listarVideo(widget.pesquisa),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      var videos = snapshot.data;
                      var video = videos![index];

                      return GestureDetector(
                        onTap: () {
                          FlutterYoutube.playYoutubeVideoById(
                              apiKey: CHAVE_YOUTUBE_API,
                              videoId: video.id,
                              autoPlay: true,
                              fullScreen: true);
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(video.imagem!),
                              )),
                            ),
                            ListTile(
                              title: Text(video.titulo!),
                              subtitle: Text(video.canal!),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                    itemCount: snapshot.data!.length);
              } else {
                return Text("Nenhum dado a ser exibido");
              }
          }
        });
  }
}
