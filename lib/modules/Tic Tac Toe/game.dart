
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/component.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Game extends StatelessWidget
{
  
  Widget build(BuildContext context)
   {
    
       return BlocConsumer<GameCubit,GameStates>(
          listener: (context,state)
          {

          },
          builder: (context,state)
          {
            GameCubit cubit=GameCubit.get(context) ;
              return  Scaffold(
           appBar: AppBar(
            title: Text(
              'Tic Tac Toe' ,
              style: TextStyle(
                fontSize: 20.0 ,
                fontWeight: FontWeight.bold,
              ),
            ),
           elevation: 0.0,
           ),
           body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             mainAxisSize: MainAxisSize.min,
             children: [
               SizedBox(
                 height: 30.0,
               ),
               Text(
                 '${cubit.setText()}',
               style: TextStyle(
                 fontSize: 50.0,
                color:cubit.color,
                 fontWeight: FontWeight.bold,
               ),
               ),
               SizedBox(
                 height: 60.0,
               ),
               Center(
                child:Stack(
                  children: [
                 Image.asset('assets/images/board.png')  , BoardForm()
                  ],
                )
                   ),
             ],
           )
           );
          },
       
       );
  }
 
}
  
class BoardForm extends StatelessWidget
{
 
  Widget build(BuildContext context)
   {
       
    final board_dimension=MediaQuery.of(context).size.width ;
    final box_dimension=board_dimension/3;
       GameCubit cubit=GameCubit.get(context) ;
      return BlocConsumer<GameCubit,GameStates>(
          listener: (context,state)
          {
          },
          builder: (context,state)
          {
            
              return  SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                            //  width: board_dimension,
                             // height:board_dimension,
                            
                              child: Column(
                                            children: [
                                              Row(
                                                  children: [
                              cubit.BoxForm(
                                box_dimension: box_dimension,
                                                   
                                onpressed: ()
                                {
                                  
                                   cubit.Tap(0,0) ;
                                 
                                },
                              widget: cubit.State(0,0) ,
                                // widget: ConditionalBuilder(
                                //   condition: cubit.xWinner()=='x Win' || cubit.oWinner()=='o Win' , 
                                //   builder: (context)=>Container(),
                                //   fallback:(context)=> cubit.State(0,0) ,
                                  
                              ),
                              cubit.BoxForm(
                                box_dimension: box_dimension,
                               
                                onpressed: ()
                                {
                                  
                                   cubit.Tap(0,1) ;
                                 
                                },
                              widget: cubit.State(0,1) ,
                                
                              ),
                                                   cubit.BoxForm(
                                box_dimension: box_dimension,
                                
                                  onpressed: ()
                                {
                                  
                                   cubit.Tap(0,2) ;
                                 
                                },
                              widget: cubit.State(0,2) ,
                                
                              ),
                                                  ],
                                                ),
                                              Row(
                                                  children: [
                               cubit.BoxForm(
                                box_dimension: box_dimension,
                               
                                  onpressed: ()
                                {
                                  
                                   cubit.Tap(1,0) ;
                                 
                                },
                              widget: cubit.State(1,0) ,
                                
                              ),
                               cubit.BoxForm(
                                box_dimension: box_dimension,
                               
                                 onpressed: ()
                                {
                                  
                                   cubit.Tap(1,1) ;
                                 
                                },
                                                  widget: cubit.State(1,1) ,
                                
                              ),
                               cubit.BoxForm(
                                box_dimension: box_dimension,
                                onpressed: ()
                                {
                                  
                                   cubit.Tap(1,2) ;
                                 
                                },
                              widget: cubit.State(1,2) ,
                                
                                                
                              ),
                                                  ],
                                                ),
                                              Row(
                                                  children: [
                               cubit.BoxForm(
                                box_dimension: box_dimension,
                                  onpressed: ()
                                {
                                  
                                   cubit.Tap(2,0) ;
                                 
                                },
                              widget: cubit.State(2,0) ,
                                
                                                
                              ),
                               cubit.BoxForm(
                                box_dimension: box_dimension,
                              
                                  onpressed: ()
                                {
                                  
                                   cubit.Tap(2,1) ;
                                 
                                },
                              widget: cubit.State(2,1) ,
                                
                                                
                              ),
                              cubit.BoxForm(
                                box_dimension: box_dimension,
                                                  
                                  onpressed: ()
                                {
                                  
                                   cubit.Tap(2,2) ;
                                 
                                },
                              widget: cubit.State(2,2) ,
                                
                                                
                              ),
                                                  ],
                                                ),
                                             
                                            
                              
                              
                                            ])
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultButton(
                               onpressed: ()
                            {
                                       cubit.setEmptyField() ;
                                       print(cubit.items); 
                                       cubit.flag=true ;
                                       cubit.setText() ;
                            },
                                               text: 'Reset' ,
                                               radius: 30.0,
                                               width: 200.0, 
                                               )
                    ],
                  ),
                ),
              );
           
    
         });
}
}