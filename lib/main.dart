import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Building Layout App",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Building Layout App"),
        ),
        body: ListView(
          children: [
            ImgBox(
                url:
                    "https://shepherdtraveller.com/wp-content/uploads/2021/04/oeschinensee-camping-Lakes-in-Switzerland-1024x683.jpg"),
            TitleBox(
              title: "Oeschimen Lake Campground",
              subtitle: "Kandersteg, Switzerland",
            ),
            InteractiveBox(),
            InfoBox(text: 'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.',)
          ],
        ));
  }
}

class ImgBox extends StatelessWidget {
  const ImgBox({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        this.url,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TitleBox extends StatelessWidget {
  const TitleBox({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 20, 32, 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.title,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  this.subtitle,
                  style: TextStyle(color: Colors.black38),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.redAccent,
          ),
          const Text("41"),
        ],
      ),
    );
  }
}

class InteractiveBox extends StatelessWidget {
  const InteractiveBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Button(
            title: "call",
            icon: Icons.phone,
          ),
          Button(
            title: "route",
            icon: Icons.near_me,
          ),
          Button(
            title: "share",
            icon: Icons.share,
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key, required this.icon, required this.title})
      : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            this.icon,
            color: Colors.blue,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            this.title.toUpperCase(),
            style: TextStyle(
                color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Text(this.text, softWrap: true,),
    );
  }
}
