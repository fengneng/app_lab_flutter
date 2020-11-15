import 'package:app_lab_flutter/component/small_cover_card.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  final List<SmallCoverItem> items = List.generate(20, (index) {
    return SmallCoverItem(index.toString(), false);
  });

  @override
  Widget build(BuildContext context) {
    final w = ((MediaQuery.of(context).size.width - 24) / 2);
    final h = w / 16 * 9 + 74;
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: w / h,
      ),
      itemBuilder: (context, index) {
        return SmallCoverCard(
          item: items[index],
        );
      },
      itemCount: items.length,
    );
  }
}
