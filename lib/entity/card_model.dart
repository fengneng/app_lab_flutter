abstract class FeedCardModel {
  int get crossAxisCount => 1;
}

class LargeCoverCardModel extends FeedCardModel {
  @override
  int get crossAxisCount => 2;
}

class SmallCoverCardModel extends FeedCardModel {}
