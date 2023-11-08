

import 'package:flutter/cupertino.dart';
import 'package:shopapp/cart/widgets/header.dart';

import '../item.dart';
class CartItemContainer{
  final List<Item> items;
   double total;
  CartItemContainer({required this.items, this.total=0.0});
}
class CartItemProvider extends ValueNotifier<CartItemContainer>{
  CartItemProvider._sharedInstance():super(
     CartItemContainer(items: [
       Item(id: 1, name: 'white chicken', subTitle: 'spacy chicken', price: 18.99,
           qty: 0, rate: 4.8, photo: 'assets/images/pizza2.jpeg', calury: 16.2,
           chart: 40,offer: 1.0),
      Item(id: 2, name: 'white chicken', subTitle: 'spacy chicken', price: 18.99,
          qty: 0, rate: 4.8, photo: 'assets/images/pizza2.jpeg', calury: 16.2,
          chart: 50),
      Item(id: 3, name: 'white chicken', subTitle: 'spacy chicken', price: 8.99,
          qty: 0, rate: 4.8, photo: 'assets/images/pizza3.jpeg', calury: 16.2,
          chart: 70),
     ], total: 0.0),

  );
  static final CartItemProvider _shared = CartItemProvider._sharedInstance();
  factory CartItemProvider() => _shared;
  int get length => value.items.length;
  void add({required Item item}) {
    item.qty++;
    value.total += item.price;
    notifyListeners();
  }
  void incrementTotal({required Item item}){
    value.total += item.price;
    notifyListeners();
  }
  void decrementTotal({required Item item}){
    value.total -= item.price;
    notifyListeners();
  }
  void remove({required Item item}) {
    item.qty--;
    value.total -= item.price;
    notifyListeners();
  }

  get total => value.total;
}