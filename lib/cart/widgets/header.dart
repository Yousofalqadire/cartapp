import 'package:flutter/material.dart';
import 'package:shopapp/cart/widgets/state_provider.dart';

class HeaderWidget extends StatefulWidget {
 const  HeaderWidget({super.key,required this.constraints});
final BoxConstraints constraints;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset:const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: widget.constraints.maxHeight * 0.30,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const  Icon(Icons.menu_sharp),
                  Text('Today ${DateTime.now().day} ${DateTime.now().year}'),
                  const Icon(Icons.search),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pizza1.jpeg'),
                    radius: 50,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Total Amount'),
                    ValueListenableBuilder(
                      valueListenable:CartItemProvider() ,
                      builder: (context, value, child){
                        return Text(value.total.toString());
                      },
                    ),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: (){}, child:const Text('Pay',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                      ),
                    ),
                  ],
                ),
              ],),
          ],
        ),
      ),
    );
  }
}

