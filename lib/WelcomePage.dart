import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lokalwala/SignInPage.dart';
import 'package:lokalwala/SignUpPage.dart';
import 'package:parallax_image/parallax_image.dart';

final List<String> imgList = [
  'A Complete\nLocal Online Partner',
  'Send Your Things for\n your one’s',
  'Get Your Order in\nHours From Your \nNear By Stores'
];

String skip = " Skip";

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i));
  }

  return result;
}

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WelcomePageState createState() => new _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = new ScrollController();

    return new Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Container(
                height: 250,
//                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/curve.png')),
          ),
          Positioned(
              bottom: 1,
              right: 0,
              left: 0,
              child: Container(
//                color: Colors.lightGreenAccent,
                height: 220,
                child: ListView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                       ParallaxImage(
                        image:  AssetImage('assets/images/city.png'),
                        extent: MediaQuery.of(context).size.width,
                        controller: _controller,
                      ),
                    ]),
              )
//            Container(
//                height: 250,
////                width: MediaQuery.of(context).size.width,
//                child: Image.asset('assets/images/city.png')),
              ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 75),
                Container(
                  height: 50,
//                color: Colors.black26,
                  child: Image.asset(
                    'assets/images/lokalwala-logo.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                CarouselSlider(
                  items: imgList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
//                          height: 700,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
//                              color: Colors.black26
                                ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 150,
                                  child: Image.asset(
                                      'assets/images/delivery-bike.png'),
                                ),
                                Center(
                                    child: Text(
                                  i,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                )),
                              ],
                            ));
                      },
                    );
                  }).toList(),
//                  autoPlay: true,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                      print(_current);
                    });
                  },
                  aspectRatio: 1.2,
                  viewportFraction: 1.0,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                  },
                  child: Text(
                    skip,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(imgList, (index) {
                    return Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                          color: _current == index
                              ? Color(0xff325DF9)
                              : Colors.transparent),
                    );
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
