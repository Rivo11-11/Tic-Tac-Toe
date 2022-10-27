import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
 required void onpressed() ,
  required String text ,
  double fontsize=20,
  double radius=5,
  double width=double.infinity,
  double height=50 ,
})
{

  return MaterialButton(
    
     onPressed:onpressed,
     child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(radius)
      ),
       child: Center(
         child: DefaultText(
          text: text,
          fontsize:fontsize,
          color: Colors.white
          ),
       ),
     ),
      
     
    
    ) ;
}

Widget DefaultText({
  required String text ,
  FontWeight? fontWeight ,
  double?  fontsize ,
  Color? color ,
  int?  maxlines,
 TextAlign? aligment ,

})=>Text(
text ,
style: TextStyle(
  fontSize: fontsize ,
  fontWeight:fontWeight,
  color: color,
  
  
),
maxLines: maxlines,
overflow:TextOverflow.ellipsis,
textAlign:aligment



);
