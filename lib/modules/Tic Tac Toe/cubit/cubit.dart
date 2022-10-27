import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/modules/Tic%20Tac%20Toe/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameCubit extends Cubit<GameStates>
{
  GameCubit() : super(GameInitialState()) ;
static GameCubit get(context)=>BlocProvider.of(context );

  
// ignore: deprecated_member_use
List <List<String>> items = new List.generate(3, (i) => new List.filled(3,'e'));

bool flag=true ;
Color? color ;
String? text ;
 
Widget BoxForm({
  box_dimension,
  String? url ,
  VoidCallback? onpressed ,
 required  widget ,
})
{
 
return Container(
            width: box_dimension,
            height: box_dimension,
            child: FlatButton(
          onPressed:onpressed ,
           child:widget ,
             
           
         ),
                );
}
void Tap 
(
   int x ,int y,
   
   
) 
{
   

 emit(BoxTapState()) ;
if(oWinner()=='o Win')
{
 
 return ; 
}
if(xWinner()=='x Win')
{
 
 return ; 
}

// if(isDraw()=='draw') 
//   {
//     return ;
//   }


 if(items[x][y]=='e')
 {
 if(flag==true)
 {
 items[x][y]='x' ;
 print(xWinner()) ;
 
 
 }
 else
 {
  items[x][y]='o' ;
  print(oWinner()) ;
  
 }
  changeflag() ;
   print(items) ;
 }
 // setEmptyField() ;

} 
Widget State(int x,int y)
{
 
 if(items[x][y]=='x')
  return  Image.asset('assets/images/x.png') ;
  else  if(items[x][y]=='o')
  return  Image.asset('assets/images/o.png') ; 
  else if(oWinner()=='o Win' || xWinner()=='x Win')
  return Container();
  return Container();

}
String xWinner()
{
  String result='' ;
  // Win Horizontally
   for (var i = 0; i <3; i++) {
     for (var j = 0; j <3; j++) {
     
     result+=items[i][j] ;
   }
   if(result=='xxx')
   break ;
   else
   result='' ;
   }

 if(result=='xxx')
 return 'x Win' ;

   // Win vertically
for (var i = 0; i <3; i++) {
     for (var j = 0; j <3; j++) {
     
     result+=items[j][i] ;
   }
   if(result=='xxx')
   break ;
   else
   result='' ;
   }
   if(result=='xxx')
 return 'x Win' ;

     // Win diagonally

    String result1=items[0][0]+items[1][1]+items[2][2] ;
    String result2=items[0][2]+items[1][1]+items[2][0] ;
   if(result1=='xxx' || result2=='xxx')
        return 'x Win' ;
 else
 {
   result1='' ;
   result2='' ;
 }

return 'x didnt win' ;

 } 
String oWinner()
{
  String result='' ;
  // Win Horizontally
   for (var i = 0; i <3; i++) {
     for (var j = 0; j <3; j++) {
     
     result+=items[i][j] ;
   }
   if(result=='ooo')
   break ;
   else
   result='' ;
   }

 if(result=='ooo')
 return 'o Win' ;

   // Win vertically
for (var i = 0; i <3; i++) {
     for (var j = 0; j <3; j++) {
     
     result+=items[j][i] ;
   }
   if(result=='ooo')
   break ;
   else
   result='' ;
   }
   if(result=='ooo')
 return 'o Win' ;

     // Win diagonally

    String result1=items[0][0]+items[1][1]+items[2][2] ;
    String result2=items[0][2]+items[1][1]+items[2][0] ;
   if(result1=='ooo' || result2=='ooo')
         return 'o Win' ;
 else
 {
   result1='' ;
   result2='' ;
 }

return 'o didnt win' ;

 } 
 String isDraw()
 {
   int temp=0 ;
   String temp1=xWinner() ;
   String temp2=oWinner() ;
   for (var i = 0; i < 3; i++) {
     for (var j = 0; j < 3; j++) {
       if(items[i][j]!='e')
       temp++ ;
     }
  
   }
   
   if(temp==9 )
   return 'draw' ;
   return 'nothing';
 }
void changeflag()
{
  flag=!flag ;
  emit(ChangeFlagState()) ;
}
void setEmptyField() 
{ 
  // if(oWinner()=='o Win'  xWinner()=='x Win' || isDraw()=='draw' )
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 3; j++) {
      items[i][j]='e' ;
    }

    emit(ChangeColorState()) ;
    
  }
}

String? setText(

)
{
 //emit(ChangeColorState()) ;
   if(isDraw()=='draw')
   {
     color=Colors.black ;
     return 'Draw' ;
   }
  if(flag==true)
  {
    //emit(ChangeColorState()) ;
   color=oWinner()=='o Win' ? Colors.red:Colors.blue ;
   //  emit(ChangeColorState()) ;
  text=oWinner()=='o Win'? 'O Wins!':'X Turn' ;
  
  return text ;
  }
  else
  {
  //  emit(ChangeColorState()) ;

   color=xWinner()=='x Win' ? Colors.blue:Colors.red ;
   //  emit(ChangeColorState()) ;
  text=xWinner()=='x Win'? 'X Wins!':'O Turn' ;
  return text ;
  }
}





}