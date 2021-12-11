import 'package:http/http.dart' as http;
import 'dart:convert';

List msglist = ["kk"];
Map mapresponse = {
  "a": 1,
  "b": 2,
};
Map dataresponse = {
  "a": 1,
  "b": 2,
};
String stringresponse = "a";
var author = [""];
var authorlist = [""];
var title = [""];
var titlelist = [""];
var description = [""];
var descriptionlist = [""];
var imgUrl = [""];
var date = [""];
var content = [""];
var url = [""];
var imgUrllist = [""];
var datelist = [""];
var contentlist = [""];
var urllist = [""];
// News API implementation to get the data of news as response
Future getNews() async {
  http.Response response;
  response = await http.get(
    Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=dbcebe9eb6fa4ddb8efc126303bc2503"),
  );

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      mapresponse = json.decode(response.body);
    }
    msglist = mapresponse['articles'];
    // dataresponse = msglist[0];
    for (int i = 0; i < msglist.length; i++) {
      author.add(msglist[i]['author']);
      title.add(msglist[i]['title']);
      description.add(msglist[i]['description']);
      imgUrl.add(msglist[i]['urlToImage']);
      date.add(msglist[i]['publishedAt']);
      content.add(msglist[i]['content']);
      url.add(msglist[i]['url']);
    }
    authorlist = author;
    titlelist = title;
    descriptionlist = description;
    imgUrllist = imgUrl;
    datelist = date;
    contentlist = content;
    urllist = url;
    print(imgUrllist);
  }
}
