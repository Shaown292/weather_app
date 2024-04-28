import 'package:flutter/cupertino.dart';

class CustomClipPath extends CustomClipper <Path>{
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.moveTo(size.width*-0.0008333,size.height*0.2171429);
    path.quadraticBezierTo(size.width*0.3747917,size.height*0.0012429,size.width*0.5000000,size.height*0.0008857);
    path.quadraticBezierTo(size.width*0.6270083,size.height*0.0020714,size.width*0.9991667,size.height*0.2128571);
    path.lineTo(size.width*0.9991667,size.height*0.9957143);
    path.lineTo(size.width*-0.0025000,size.height*1.0014286);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}