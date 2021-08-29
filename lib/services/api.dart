import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyANSRlOtdE9h5r4V-yoV8MbY9rJLMN-tlQ";
const ID_CANAL = "UCwXdFgeE9KYzlDdR7TG9cMw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    var uri = Uri.parse(URL_BASE +
        "search/"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa");

    print(uri);

    var response = await http.get(uri);

    if( response.statusCode == 200 ) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(
              (map){
            return Video.fromJson(map);
          }
      ).toList();

      return videos;

    } else {
      print("Erro na API");
      return [];
    }
  }
}
