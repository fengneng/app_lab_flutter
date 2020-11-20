part of 'cart_bloc.dart';

@immutable
abstract class CartState {
  final List<Goods> goodsList;

  int get totalCount {
    if (goodsList.isEmpty) {
      return 0;
    }
    return goodsList
        .map((e) => e.count)
        .reduce((value, element) => value + element);
  }

  double get totalPrice {
    if (goodsList.isEmpty) {
      return 0;
    }
    return goodsList
        .map((e) => e.totalPrice)
        .reduce((value, element) => value + element);
  }

  const CartState(this.goodsList);
}

class CartLoaded extends CartState {
  const CartLoaded(List<Goods> goodsList) : super(goodsList);
}
