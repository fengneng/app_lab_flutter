part of 'cart_bloc.dart';

@immutable
abstract class CartState {
  final List<Goods> goodsList;

  int get totalCount {
    if (goodsList.length == 0) {
      return 0;
    }
    return goodsList
        .map((e) => e.count)
        .reduce((value, element) => value + element);
  }

  double get totalPrice {
    if (goodsList.length == 0) {
      return 0;
    }
    return goodsList
        .map((e) => e.totalPrice)
        .reduce((value, element) => value + element);
  }

  CartState(this.goodsList);
}

class CartLoaded extends CartState {
  CartLoaded(List<Goods> goodsList) : super(goodsList);
}
