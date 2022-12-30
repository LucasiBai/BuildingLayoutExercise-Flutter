import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
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
          children:const  [
            ImgBox(
              asset: "images/lake.jpg",
            ),
            TitleBox(
              title: "Oeschimen Lake Campground",
              subtitle: "Kandersteg, Switzerland",
            ),
            InteractiveBox(),
            InfoBox(
              text:
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                  'Alps. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                  'half-hour walk through pastures and pine forest, leads you to the '
                  'lake, which warms to 20 degrees Celsius in the summer. Activities '
                  'enjoyed here include rowing, and riding the summer toboggan run.',
            )
          ],
        ));
  }
}

class ImgBox extends StatelessWidget {
  const ImgBox({Key? key, required this.asset}) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
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
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black38),
                ),
              ],
            ),
          ),
          const FavButton()
        ],
      ),
    );
  }
}

class FavButton extends StatefulWidget {
  const FavButton({Key? key}) : super(key: key);

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  bool _isFavourite = true;
  int _favouriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          alignment: Alignment.centerRight,
          icon: (_isFavourite
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border)),
          onPressed: _toggleFav,
          color: Colors.redAccent,
        ),
        SizedBox(
            width: 18,
            child: SizedBox(
              child: Text("$_favouriteCount"),
            ))
      ],
    );
  }

  void _toggleFav(){
    setState(() {
      _favouriteCount = _isFavourite? _favouriteCount-1 : _favouriteCount+1;
       _isFavourite = !_isFavourite;
    });
  }
}

class InteractiveBox extends StatelessWidget {
  const InteractiveBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.blue,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title.toUpperCase(),
          style: const TextStyle(
              color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        text,
        softWrap: true,
      ),
    );
  }
}
