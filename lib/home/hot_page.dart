import 'package:app_lab_flutter/component/large_cover_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotPage extends StatelessWidget {
  const HotPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 4),
      itemBuilder: (context, index) {
        return LargeCoverCard();
      },
      separatorBuilder: (context, index) {
        return Divider(
          indent: 12,
          height: 0.5,
        );
      },
      itemCount: 30,
    );
  }
}
