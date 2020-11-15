import 'package:app_lab_flutter/mall/goods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';

class MallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc()..add(LoadCart()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ListView.separated(
                    padding: EdgeInsets.only(top: 8),
                    itemCount: state.goodsList.length,
                    separatorBuilder: (_, __) => Divider(),
                    itemBuilder: (context, index) {
                      return _GoodsItem(state.goodsList[index]);
                    },
                  );
                },
              ),
            ),
            _CartBottomBar()
          ],
        ),
      ),
    );
  }
}

class _CartBottomBar extends StatelessWidget {
  const _CartBottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Center(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Text(
                  '数量：${state.totalCount} 价格：${state.totalPrice}',
                );
              },
            ),
          ),
          SizedBox(
            width: 30,
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              context.bloc<CartBloc>().add(LoadCart());
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              context.bloc<CartBloc>().add(AddOneCart());
            },
          ),
        ],
      ),
    );
  }
}

class _GoodsItem extends StatelessWidget {
  final Goods goods;

  const _GoodsItem(
    this.goods, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1,
        child: Placeholder(),
      ),
      title: Text('商品ID：${goods.id}'),
      subtitle: Text('单价：${goods.price}'),
      trailing: Container(
        width: 200,
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('数量：${goods.count}'),
                SizedBox(
                  height: 8,
                ),
                Text('总价：${goods.totalPrice.toStringAsFixed(1)}'),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Goods cur = Goods(goods.id, 1, goods.price);
                context.bloc<CartBloc>()..add(AddCart(cur));
              },
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                Goods cur = Goods(goods.id, 1, goods.price);
                context.bloc<CartBloc>()..add(RemoveCart(cur));
              },
            ),
          ],
        ),
      ),
    );
  }
}
