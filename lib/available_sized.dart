import 'package:flutter/material.dart';

class AvailableSize extends StatefulWidget {
  final String size;
  const AvailableSize({Key? key, required this.size}): super(key: key);

  @override
  State<AvailableSize> createState() => _AvailableSize();
}

class _AvailableSize extends State<AvailableSize> {
  bool isSelected= false;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: (){
      setState(() {
        isSelected =! isSelected;
      });
    },
    child:Container(
      margin: EdgeInsets.only(right: 16),
      width: 30, height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected? Colors.brown[100] :Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black),
      ),
      child: Text(widget.size, style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
    ) ,
  );




}