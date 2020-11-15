import 'dart:async';
import 'dart:math';

import 'package:app_lab_flutter/mall/goods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoaded([]));

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is LoadCart) {
      final list = [
        Goods(123, 1, 10),
        Goods(124, 3, 45),
        Goods(125, 2, 1),
      ];
      yield CartLoaded(list);
    } else if (event is AddOneCart) {
      final random = Goods(
        Random().nextInt(3) + 10,
        Random().nextInt(3) + 1,
        (Random().nextDouble() * 10).ceilToDouble(),
      );
      add(AddCart(random));
    }
    if (event is AddCart) {
      var list = state.goodsList;
      var find = list.where((element) => event.goods.id == element.id).toList();
      if (find.length > 0) {
        find.forEach((element) {
          element.count += event.goods.count;
        });
      } else {
        list += [event.goods];
      }
      yield CartLoaded(list);
    } else if (event is RemoveCart) {
      var list = state.goodsList;
      list.where((element) => event.goods.id == element.id).forEach((element) {
        element.count -= event.goods.count;
      });
      list.removeWhere((element) => element.count == 0);
      yield CartLoaded(list);
    }
  }
}
