import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'calculator.dart';
import 'dart:async';
import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';



void main() {

  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   //Navigator.pushNamed(context, '/calculatorscreen');
  //
  //   Navigator.push(context, MaterialPageRoute(
  //       builder: (context) => Calculator()),);
  //   super.initState();
  //
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/firstscreen',
      routes:{
        '/firstscreen':(context)=>FirstScreen(),
        '/calculatorscreen':(context)=> Calculator(),

      } ,

    );
  }
}


class FirstScreen extends StatefulWidget {
  //scheduleMicrotask(() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Calculator())));

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {



  @override
  void initState() {
    // TODO: implement initState

     super.initState();
    Timer.run(() { // import 'dart:async:
      sleep(Duration(seconds: 5));
      Navigator.of(context).pushNamed('/calculatorscreen');
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black12,

       body: Container(
           child:Center(child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(child: Text('Calculator',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),),),

             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Divider(thickness: 10,color: Colors.white,),
             )
             ],
           ),)


      )
    );

  }
}

