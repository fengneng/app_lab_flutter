class Goods {
  final int id;
  int count;
  double price;

  double get totalPrice {
    return count * price;
  }

  Goods(
    this.id,
    this.count,
    this.price,
  );
}
