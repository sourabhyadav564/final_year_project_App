import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: "My Ration".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cartModel;
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: (context, MyStore, _) {
              return Text(
                "\u20B9${_cart.totalPrice}",
                // "\$${_cart.totalPrice}",
                style: TextStyle(fontSize: 32, color: context.accentColor),
              );
            },
            notifications: {},
            mutations: {RemoveMutation},
          ),
          SizedBox(
            width: 40,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Coming Soon...")));
            },
            child: Text(
              "Buy",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cartModel;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? Center(
            child: Column(
              children: [
                Lottie.asset(
                    "assets/lottie/empty_cart.json",
                    animate: true,
                    width: 200,
                    height: 300,
                    // reverse: true,
                    repeat: true,
                ),
                // Icon(
                //   CupertinoIcons.,
                //   size: 100,
                //   color: context.theme.accentColor,
                // ),
                Text(
                  "Nothing To Show",
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () => {RemoveMutation(_cart.items[index])},
              ),
              title: Text(_cart.items[index].name.toString()),
            ),
          );
  }
}
