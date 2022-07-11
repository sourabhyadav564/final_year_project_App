import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  CatalogModel catalogModel = new CatalogModel();
  CartModel cartModel = new CartModel();

  MyStore(){
    catalogModel = CatalogModel();
    cartModel = CartModel();
    cartModel.catalog = catalogModel;
  }
}

