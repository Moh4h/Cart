

import 'package:cart_example/model/item.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier{
List<Item> _item=[];
double _price=0;
void addItem(Item item){
  _item.add(item);
  _price +=item.price!;
notifyListeners();
}
void removeItem(Item item){
  _price -=item.price!;
  _item.remove(item);
  
notifyListeners();
}
int get getItemCount => _item.length;
double get getPrice => _price;
List<Item>  get getItem => _item;
}