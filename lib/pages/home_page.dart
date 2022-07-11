import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/add_to_cart.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
        backgroundColor: context.theme.buttonColor,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 25, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                Expanded(child: CatalogList())
              else
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: context.theme.accentColor),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text(
            "Trending Products",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: context.accentColor),
          ),
        ),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 170,
      child: Container(
        decoration: BoxDecoration(
            color: context.cardColor,
            borderRadius: BorderRadius.circular(20.0)),
        padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Row(
          children: [
            Container(
              child: Hero(
                tag: Key(catalog.id.toString()),
                child: CatalogImage(
                  image: catalog.image,
                ),
              ),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: context.canvasColor,
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      catalog.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: context.accentColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      catalog.desc,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                    children: [
                      Text(
                        "\$${catalog.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: context.accentColor,
                            fontSize: 16),
                      ),
                      AddToCart(catalog),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image})
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: 100.0,
    );
  }
}
