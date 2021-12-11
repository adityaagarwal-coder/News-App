import 'package:flutter/material.dart';
import 'package:news_app/services/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'homepage.dart';

class ArticlePage extends StatefulWidget {
  // const ArticlePage({Key? key}) : super(key: key);
  final int index;
  ArticlePage({required this.index});
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pop(context); // Go back to previous Screen
                });
              },
              child: Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: Colors.white),
      body: Container(
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
            SizedBox(height: 20),
            Text(titlelist[widget.index],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Image.network(
              imgUrllist[widget.index]
                  .toString(), // Displays image of news article from network
            ),
            Text(datelist[widget.index],
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "By " +
                  authorlist[
                      widget.index], // Displays Author name of news article
            ),
            SizedBox(height: 20),
            Text(
                descriptionlist[widget.index] +
                    "\n", // Displays description of news article
                style: TextStyle(fontSize: 20)),
            Text(contentlist[widget.index],
                style: TextStyle(
                    fontSize: 20)), // Displays content of news article
            InkWell(
                onTap: () {
                  setState(() {
                    _launchURL(widget
                        .index); // Redirects to external url of news article in web browser
                  });
                },
                child: Container(
                  child: Center(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text("Read More",
                                style: TextStyle(color: Colors.white)))),
                  ),
                ))
          ]))),
    );
  }
}

_launchURL(int index) async {
  var url = urllist[index].toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
