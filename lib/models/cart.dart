import 'package:flutter_application_1/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog.dart';

class CartModel {

  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cartModel._itemIds.add(item.id);
  }
}
class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cartModel._itemIds.remove(item.id);
  }
}