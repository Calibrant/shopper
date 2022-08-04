import 'package:flutter/material.dart';
import 'package:flutter_test__task/models/newmodel/catalog_model.dart';

class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;
  final List _itemIds = [];
  List<Item> _cloneItemsIds = [];

  List<Item> get cloneItemsIds => _cloneItemsIds;

  set cloneItemsIds(List<Item> newClone) {
    _cloneItemsIds = newClone;
    notifyListeners();
  }

  List<Item> _listArray = [];

  // ignore: unnecessary_getters_setters
  List<Item> get listArray => _listArray;

  set listArray(List<Item> newListArray) {
    _listArray = newListArray;
  }

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  int totalPrice(List<Item> items) {
    return items.fold(
        0, (previousValue, element) => previousValue + element.price);
  }

  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();

  int orderNumber(List<Item> items) {
    return items.first.orderNumber;
  }

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
