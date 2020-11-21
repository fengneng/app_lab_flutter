import 'package:flutter/material.dart';

class DouyinPage extends StatelessWidget {
  Widget _buildButton(IconData iconData, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.white,
          size: 44,
        ),
        SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.asset(
              'images/IMG_201702122001.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(
            height: 88,
            child: AppBar(
              backgroundColor: Colors.transparent,
              brightness: Brightness.dark,
              elevation: 0,
              leading: BackButton(
                color: Colors.white70,
              ),
              actions: <Widget>[
                IconButton(
                  iconSize: 40,
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 88,
            child: AppBar(
              backgroundColor: Colors.transparent,
              brightness: Brightness.dark,
              elevation: 0,
              leading: BackButton(
                color: Colors.white70,
              ),
              actions: <Widget>[
                IconButton(
                  iconSize: 40,
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '@随手做美食',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: ' · 5月26日',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          maxLines: 4,
                          text: TextSpan(
                            text: '夏天饭桌上肯定不能少的皮蛋拌豆腐',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: ' #助力湖北#',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: ' #卖光湖北货#',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.music_note,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: '@随手做美食 创作的原声',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 22,
                        ),
                        _buildButton(Icons.favorite_border, '35.3w'),
                        _buildButton(Icons.comment, '4445'),
                        _buildButton(Icons.share, '5.0w'),
                        RotationWidget(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 88,
        color: Color.fromRGBO(21, 21, 21, 1),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '有爱评论，说出你的看法～',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Icon(
              Icons.account_circle,
              color: Colors.grey,
            ),
            Icon(
              Icons.account_circle,
              color: Colors.grey,
            ),
          ],
        ),
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
      duration: Duration(seconds: 6),
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
      child: CircleAvatar(
        radius: 25,
        child: Text(
          '天才',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
