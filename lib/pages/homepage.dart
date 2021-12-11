import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/provider/google_sign_in.dart';
import 'package:news_app/services/api_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'articlepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  void initState() {
    super.initState();
    setState(() {
      getNews(); // Calls getNews function to fetch data from API
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(user.photoURL!)), // Profile Picture of User
            elevation: 0.0,
            title: Text(
              "Latest News",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.logout(); // Logout Implementation
                    });
                  },
                  child: Text("LogOut"))
            ]),
        body: SingleChildScrollView(
          // physics: ScrollPhysics(),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: msglist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticlePage(
                                index: index)), // Navigate to ArticlePage
                      );
                    });
                  },
                  child: Card(
                    child: Container(
                        height: 100,
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              imgUrllist == null
                                  ? Container()
                                  : Image.network(
                                      imgUrllist[index + 1].toString(),
                                      width: 50,
                                      height: 50,
                                    ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  DescriptionTextWidget(
                                    text: titlelist[index]
                                        .toString(), // Displays title of news article
                                  ),
                                  SizedBox(height: 20),
                                  Text("Published at:   " +
                                      datelist[index]
                                          .toString()), // Displays Published date of news article
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                );
              }),
        ),
        bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset("assets/images/Home.svg",
                      color: Colors.black),
                ),
                Container(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset("assets/images/SearchIcon.svg"))
              ],
            )));
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf = "";
  String secondHalf = "";

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 30) {
      firstHalf = widget.text.substring(0, 30);
      secondHalf = widget.text.substring(30, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf)
          : new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text(
                    // flag
                    // ? (firstHalf + "...")
                    // : (firstHalf + "\n" + secondHalf),
                    (firstHalf + "..."),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                // new InkWell(
                //   child: new Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: <Widget>[
                //       new Text(
                //         flag ? "show more" : "show less",
                //         style: new TextStyle(color: Colors.blue),
                //       ),
                //     ],
                //   ),
                //   onTap: () {
                //     setState(() {
                //       flag = !flag;
                //     });
                //   },
                // ),
              ],
            ),
    );
  }
}
