
import 'package:flutter/material.dart';
import 'package:shopapp/cart/cart_screen.dart';
import 'package:shopapp/cart/widgets/chart.dart';
import 'package:shopapp/cart/widgets/header.dart';
import 'package:shopapp/cart/widgets/positiond.dart';
import 'package:shopapp/cart/widgets/state_provider.dart';

import '../item.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key,required this.item});
 final Item item;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final cartProvider = CartItemProvider();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset:const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(widget.item.photo),),
                    ),
                    positioned(widget.item),
                    countPositioned(widget.item),
                  ]
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.item.name,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text(widget.item.subTitle),
                  Row(
                    children: [
                      const Icon(Icons.star,color: Colors.orange,),
                       Text(widget.item.rate.toString())
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: widget.item.qty! > 0 ? CircleAvatar(
                          backgroundColor: Colors.grey[300],
                            child: IconButton(onPressed: (){
                              if(widget.item.qty! > 0 && widget.item.qty != 0){
                                setState(() {
                                  cartProvider.remove(item: widget.item);
                                 cartProvider.decrementTotal(item: widget.item);
                                  print(cartProvider.total);

                                });
                              }
                            }, icon:const Icon(Icons.remove))):null,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text((widget.item.price).toString()),
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.black,
                          child: IconButton(onPressed: (){
                            setState(() {
                              cartProvider.add(item: widget.item);
                              cartProvider.incrementTotal(item: widget.item);
                              print(cartProvider.total);
                            });
                          }, icon: const Icon(Icons.add,color: Colors.white,)))
                    ],
                  ),
                ],
              ),
             Padding(
               padding: const EdgeInsets.only(right: 10,top: 5),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Container(
                     width: 50,
                     height: 50,
                     child: CustomPaint(
                       painter: ChartWidget(value: widget.item.chart),
                       child: Center(child: Text(widget.item.chart.toString()),),
                     ),
                   ),
                   Container(
                     child: Column(
                       children: [
                         const Text('calury'),
                         Text(widget.item.calury.toString())
                       ],
                     ),
                   )
                 ],
               ),
             ),
            ],
          )
        ),
      ),
    );
  }
}
