import 'package:flutter/material.dart';

class Backcircles extends CustomPainter{

  
  
  @override 
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the paint color to be white
    paint.color = Color(0xFFF8C8C6);    
    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);
    // set the color property of the paint
    
   /* //cen cir
    paint.color = Color(0xFF493058);
    // center of the canvas is (x,y) => (width/2, height/2)
    var center1 = Offset(size.width / 2.5, size.height / 2.5);
    // draw the circle with center having radius 75.0
    canvas.drawCircle(center1, size.width/1.375, paint);
  */
    
    //top left
    paint.color = Colors.black;
    // center of the canvas is (x,y) => (width/2, height/2)
    var center2 = Offset(0,size.height*0.55);
    // draw the circle with center having radius 75.0
    canvas.drawCircle(center2, 300, paint);

    paint.color = Color(0xFF239480);
    canvas.drawCircle(center2, 250, paint);

    


    //right
    paint.color = Colors.black;
    // center of the canvas is (x,y) => (width/2, height/2)
    var center3 = Offset(size.width*0.95, size.height/2.8);
    // draw the circle with center having radius 75.0
    canvas.drawCircle(center3, size.width/1.30, paint);

    paint.color = Color(0xFFFAC918);
    // center of the canvas is (x,y) => (width/2, height/2)
    
    // draw the circle with center having radius 75.0
    canvas.drawCircle(center3, size.width/1.5, paint);

    
  }

  

@override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return null;
  }
}

class InfoCard extends CustomPainter{
  
  @override 
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the paint color to be white
    paint.color = Color(0xFF249782);  
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);    
    canvas.drawRect(rect, paint);


    // Create a rectangle with size and width same as the canvas
    
    // draw the rectangle using the paint
    
    // set the color property of the paint
    
    //cen cir
    paint.color = Colors.white.withOpacity(0.3);
    
    // center of the canvas is (x,y) => (width/2, height/2)
    var center1 = Offset(350,200);
    // draw the circle with center having radius 75.0
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawCircle(center1, 90, paint); 


    
    
    // center of the canvas is (x,y) => (width/2, height/2)
    

    


  

    
  }

    @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return null;
  }
}


class TripName extends CustomPainter{
  
  @override 
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the paint color to be white
      
    // Create a rectangle with size and width same as the canvas
    
    // draw the rectangle using the paint
    
    // set the color property of the paint
    
    //cen cir
   
    


    paint.color = Colors.white.withOpacity(0.12);
    
    // center of the canvas is (x,y) => (width/2, height/2)
    var center2 = Offset(420,110);
    // draw the circle with center having radius 75.0
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawCircle(center2, 120, paint); 

    


  

    
  }

    @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return null;
  }
}