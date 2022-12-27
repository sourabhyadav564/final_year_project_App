import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';
import '../widgets/add_to_cart.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\u20B9${catalog.price}",
                  // "\$${catalog.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800,
                      fontSize: 28),
                ),
                Container(
                  height: 50,
                  width: 140,
                  child: AddToCart(catalog),
                )
              ],
            ),
          ),
        ),
        backgroundColor: context.canvasColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(
                  catalog.image,
                  height: 250.0,
                ),
              ),
            ),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    edge: VxEdge.TOP,
                    arcType: VxArcType.CONVEY,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        width: context.screenWidth,
                        color: context.cardColor,
                        child: Column(
                          children: [
                            Text(
                              catalog.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 38.0,
                                  height: 3,
                                  color: context.accentColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 25, 10, 150),
                              child: Text(
                                catalog.desc,
                                style: TextStyle(
                                  color: context.accentColor,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(15, 25, 10, 0),
                            //   child: Text(
                            //     "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate",
                            //     style: TextStyle(
                            //       color: context.accentColor,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
