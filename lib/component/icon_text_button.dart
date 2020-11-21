import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    Key key,
    this.text = '按钮标题',
    this.iconData = Icons.grade,
    this.iconColor = Colors.deepOrangeAccent,
    this.iconSize = 44,
    this.onPressed,
  }) : super(key: key);

  final Color iconColor;
  final String text;
  final IconData iconData;
  final double iconSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            color: iconColor,
            size: iconSize,
          ),
          SizedBox(height: 4),
          Text(
            text,
            style: Theme.of(context).primaryTextTheme.button,
          ),
        ],
      ),
    );
  }
}
