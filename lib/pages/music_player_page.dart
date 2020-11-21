import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.asset(
              'images/IMG_201702122008.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              color: Colors.black38,
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 88,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  brightness: Brightness.dark,
                  elevation: 0,
                  leading: BackButton(
                    color: Colors.white,
                  ),
                  title: Column(
                    children: <Widget>[
                      Text(
                        '穿越人海',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '再遇见',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 13,
                            height: 18 / 13,
                          ),
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.white,
                                size: 17,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    IconButton(
                      iconSize: 40,
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: RotationWidget(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.file_download,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.toys,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.textsms,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '00:14',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: 0.3,
                        activeColor: Colors.red,
                        inactiveColor: Colors.white,
                        onChanged: (double value) {},
                      ),
                    ),
                    Text(
                      '04:29',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 88),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.repeat,
                        color: Colors.white,
                        size: 44,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.arrow_left,
                        color: Colors.white,
                        size: 44,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 66,
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 44,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.format_list_bulleted,
                        color: Colors.white,
                        size: 44,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RotationWidget extends StatefulWidget {
  @override
  _RotationWidgetState createState() => _RotationWidgetState();
}

class _RotationWidgetState extends State<RotationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 30),
      vsync: this,
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      alignment: Alignment.center,
      turns: _controller,
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Material(
          elevation: 40,
          color: Colors.white,
          borderRadius: BorderRadius.circular(500),
          child: Container(
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/playing_page_disc.png"),
              ),
            ),
            child: ClipOval(
              child: Image.network(
                'http://p2.music.126.net/NKcfKJKBFIeKwm_w06jj3A==/109951163517935030.jpg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
