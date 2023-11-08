import 'package:flutter/material.dart';
import 'package:shopapp/cart/widgets/header.dart';
import 'package:shopapp/cart/widgets/item_widget.dart';
import 'package:shopapp/cart/widgets/state_provider.dart';

import 'item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
static double total = 0.0;
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
 final cartProvider = CartItemProvider();

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: LayoutBuilder(
            builder:(context,constraints) =>Column(
              children: [
                HeaderWidget( constraints: constraints,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: constraints.maxHeight * 0.10,
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('pizza'),
                        Row(
                          children: [
                            Text('max price'),
                            Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.50,
                  child: ListView.builder(
                    itemCount: cartProvider.length,
                    itemBuilder: (context,index) {
                      return ItemWidget(item: cartProvider.value.items[index]);
                    },
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }

}
