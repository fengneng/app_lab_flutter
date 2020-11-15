part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class LoadCart extends CartEvent {
  LoadCart();
}

class AddOneCart extends CartEvent {
  AddOneCart();
}

class AddCart extends CartEvent {
  final Goods goods;
  AddCart(this.goods);
}

class RemoveCart extends CartEvent {
  final Goods goods;
  RemoveCart(this.goods);
}
