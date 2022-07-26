import 'package:flutter/material.dart';
import 'package:flutter_test__task/models/newmodel/catalog_model.dart';

class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;
  //late HistoryModel historyModel;
  final List _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();

  int get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }

//
  void removeAll() {
    _itemIds.clear();
    notifyListeners();
  }
}
