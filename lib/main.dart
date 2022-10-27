import 'package:flutter/material.dart';
import 'package:flutter_application/modules/Tic%20Tac%20Toe/cubit/cubit.dart';
import 'package:flutter_application/modules/Tic%20Tac%20Toe/cubit/states.dart';
import 'package:flutter_application/modules/Tic%20Tac%20Toe/game.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>GameCubit(),
      child: BlocConsumer<GameCubit,GameStates>(
        listener: (BuildContext context,state)
        {

        },
        builder: (BuildContext context,state)
        {
            return MaterialApp(
            home: Game(),
            debugShowCheckedModeBanner: false,
          );
        },
       
      ),
    );
   
  }
}


