

import 'package:flutter/material.dart';

import '../item.dart';

Widget positioned(Item item) {
  if(item.offer != null){
    return Positioned(
      top: 30,
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.orangeAccent,
        child: Text(item.offer.toString(),style:const TextStyle(
          color: Colors.white
        ),),),
    );
  }else{
    return Container();
  }
}

Widget countPositioned(Item item) {
  if(item.qty! > 0){
    return Positioned(
      bottom: 30,
        child: CircleAvatar(
          backgroundColor: Colors.black,
          child: Center(child: Text(item.qty.toString(),style:const TextStyle(color: Colors.white),),),));
  }else{
    return Container();
  }
}