import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';
import 'dart:async';

class Parser {
  final url = "http://france24.com/fr/actualites/rss";
  Future chargerRSS() async {
    final reponse = await get(url);

    if(reponse.statusCode == 200) {
      final feed = new RssFeed.parse(reponse.body);
      print(feed);
      return feed;

    } else {
      print("Erreur : ${reponse.statusCode}");
    }

  }

}