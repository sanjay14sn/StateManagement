import 'package:flutter/material.dart';
import '../models/Dress.dart';

class DressTile extends StatelessWidget {
  final Dress dress;
  void Function()? onPressed;
  final Widget icon;
  DressTile({super.key, required this.dress,required this.onPressed,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color:Colors.grey[200],
        borderRadius:BorderRadius.circular(12),

      ),
      margin:EdgeInsets.only(bottom: 10),
      padding:EdgeInsets.symmetric(vertical:25,horizontal:15),
      child: ListTile(
        title: Text(dress.name),
        subtitle: Text(dress.price.toString()),
        leading: Image.asset(dress.imagepath),
        trailing:IconButton( icon: icon, onPressed: onPressed)
      ),
    );
  }
}
