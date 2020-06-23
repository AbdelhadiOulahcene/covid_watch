import 'package:flutter/material.dart';
class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.icon, this.title,this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Color.fromRGBO(252,92,155,1),
              size: 28,
            ),
            SizedBox(
              width: 20,
            ),
            Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.white),),
          ],
        ),
      ),
    );
  }
}