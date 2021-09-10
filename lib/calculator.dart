import 'package:flutter/material.dart';
String text='';
String text2='';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  dynamic num1=0,num2=0;
  var result;
  var operator;
  String myNum1='';
  String myNum2='';
  bool pointFlag=false;

  void solveBeforeEqual()
  {
    setState(() {
      num1=double.parse(myNum1);
      num2=double.parse(myNum2);
      num1=solve();
      num1=num1.toStringAsFixed(num1.truncateToDouble() == num1 ? 0 : 2);  //it will remove zeros after point like 7.0. to 7
      myNum1=num1.toString();
      text2=num1.toString();
      text=num1.toString();
      num2=0;
      myNum2='';

    });
  }


  bool operatorFlag=false;

  dynamic solve()  {
    if(operator=='+') {
      return num1 + num2;
    }
    if(operator=='x')
      return num1*num2;
    if(operator=='-')
      return num1-num2;
    if(operator=='/')
      return num1/num2;
  }

  void reduceNumber()
  {
    if(operatorFlag==false)
    {
      num1=double.parse(myNum1);
      num1=num1/10;
      //num1=num1.toStringAsFixed(num1.truncateToDouble() == num1 ? 0 : 2);  //it will remove zeros after point like 7.0. to 7
      num1=num1.truncate();
      if(num1<=0)
        myNum1='';
      else
        myNum1=num1.toString();

      text=myNum1;
    }
    else if(operatorFlag==true&&myNum2=='')
    {
      text=myNum1.toString();
      operatorFlag=false;

    }
    else{
      num2=double.parse(myNum2);
      num2=num2/10;
      num2=num2.truncate();
      if(num2<=0)
        myNum2='';
      else
        myNum2=num2.toString();
      text=myNum1+operator+myNum2;
    }
  }

  dynamic convertToNumber(var temp)
  {
    if(operatorFlag==false) {
      myNum1=myNum1+temp.toString();
    }
    else
    {
      myNum2=myNum2+temp.toString();
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 70,bottom: 20),
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        border: null,
                        color: Colors.white,

                      ),
                      child: Text(text,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 70,bottom: 20),
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        border: null,
                        color: Colors.white,
                      ),
                      child: Text('$text2',style: TextStyle(
                          fontSize: 40,
                          color: Colors.black
                      ),),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child:Column(

                children: [
                  Row(children: [Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FlatButton(
                          height: 60,

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.blueAccent,
                          onPressed: (){
                            setState(() {
                              text='';
                              text2='';
                              num1=num2=0;
                              operatorFlag=false;
                              myNum1='';
                              myNum2='';
                              pointFlag=false;
                            });
                          }, child: Text('C',style: TextStyle(fontSize: 30),)),
                    ),
                  ),
                    MyButton(onpressed: (){
                      setState(() {
                        reduceNumber();

                      });

                    },text: '⌫',),
                    MyButton(onpressed: (){
                      setState(() {
                        if(operatorFlag==true)
                        {
                          num2=double.parse(myNum2);
                          num2=num2/100;
                          myNum2=num2.toString();
                          text='$myNum1 $operator $myNum2';
                          pointFlag=true;
                        }
                        else {
                          num1 = double.parse(myNum1);
                          num1 = num1 / 100;
                          myNum1 = num1.toString();
                          text = '$myNum1';
                          pointFlag = true;
                        }
                      });
                    },text: '%',),
                    MyButton(onpressed: (){
                      if(myNum1==''||myNum1=='.')
                      {}
                      else {
                        setState(() {
                          pointFlag = false;
                          if (operatorFlag == true) {
                            solveBeforeEqual();
                            setState(() {
                              text = text + '/';
                            });
                          }
                          else {
                            text = myNum1 + '/';
                            operatorFlag = true;
                            operator = '/';
                            num1 = double.parse(myNum1);
                          }
                        });
                      }
                    },text: '/',),

                  ]
                    ,),
                  Row(children: [
                    MyButton(onpressed: (){
                      setState(() {
                        text=text+'7';
                        convertToNumber(7);

                      });

                    },text: '7',),
                    MyButton(onpressed: (){
                      setState(() {
                        text=text+'8';
                        convertToNumber(8);

                      });
                    },text: '8',),
                    MyButton(onpressed: (){
                      setState(() {
                        convertToNumber(9);

                        text=text+'9';
                      });
                    },text: '9',),
                    MyButton(onpressed: (){
                      if(myNum1==''||myNum1=='.')
                      {}
                      else {
                        pointFlag = false;
                        if (operatorFlag == true) {
                          solveBeforeEqual();
                          setState(() {
                            text = text + 'x';
                          });
                        }
                        else {
                          setState(() {
                            operatorFlag = true;
                            text = myNum1 + 'x';
                            operator = 'x';
                            num1 = double.parse(myNum1);
                          });
                        }
                      }
                    },text: 'x',),

                  ]
                    ,),
                  Row(children: [
                    MyButton(onpressed: (){
                      setState(() {
                        text=text+'4';
                        convertToNumber(4);

                      });
                    },text: '4',),
                    MyButton(onpressed: (){
                      setState(() {
                        convertToNumber(5);

                        text=text+'5';
                      });
                    },text: '5',),
                    MyButton(onpressed: (){
                      setState(() {
                        text=text+'6';
                        convertToNumber(6);

                      });
                    },text: '6',),
                    MyButton(onpressed: (){
                      if(myNum1==''||myNum1=='.'){}
                      else {
                        setState(() {
                          pointFlag = false;
                          if (operatorFlag == true) {
                            solveBeforeEqual();
                            setState(() {
                              text = text + '-';
                            });
                          }
                          else {
                            operatorFlag = true;
                            text = myNum1 + '-';
                            operator = '-';
                            num1 = double.parse(myNum1);
                          }
                        });
                      }
                    },text: '-',),

                  ]
                    ,),
                  Row(children: [
                    MyButton(onpressed: (){
                      setState(() {
                        text=text+'1';
                        convertToNumber(1);

                      });
                    },text: '1',),
                    MyButton(onpressed: (){
                      setState(() {
                        text=text+'2';
                        convertToNumber(2);

                      });
                    },text: '2',),
                    MyButton(onpressed: (){
                      setState(() {
                        text=text+'3';
                        convertToNumber(3);

                      });
                    },text: '3',),
                    MyButton(onpressed: (){
                      if(myNum1==''||myNum1=='.'){}
                      else{
                        pointFlag=false;
                        if(operatorFlag==true)
                        {
                          solveBeforeEqual();
                          setState(() {
                            text=text+'+';
                          });
                        }
                        else {
                          setState(() {
                            operatorFlag = true;
                            text = myNum1 + '+';
                            operator = '+';
                            num1 = double.parse(myNum1);
                          });
                        }
                      }
                    },text: '+',),

                  ]
                    ,),
                  Row(children: [
                    MyButton(onpressed: (
                        ){
                      setState(() {
                        text=text+'0';
                        convertToNumber(0);

                      });
                    },text: '0',),
                    MyButton(onpressed: (){

                      setState(() {
                        if(pointFlag==false)
                        {
                          convertToNumber('.');
                          text=text+'.';
                          pointFlag=true;
                        }



                      });
                    },text: '.',),
                    MyButton(onpressed: (){
                      solveBeforeEqual();
                      setState(() {
                        operatorFlag=false;
                        operator='';
                        pointFlag=false;
                      });

                    },text: '=',),
                    MyButton(onpressed: (){
                      setState(() {
                        if(operatorFlag==false)
                        {
                          final number= int.tryParse(myNum1);
                          if(number==null)
                          {
                            num1=double.parse(myNum1);
                          }
                          else
                            num1=int.parse(myNum1);

                          num1=-num1;
                          myNum1=num1.toString();
                          text='$myNum1';
                        }
                        else
                        {
                          final number2= int.tryParse(myNum2);
                          if(number2==null)
                          {
                            num2=double.parse(myNum2);
                          }
                          else
                            num2=int.parse(myNum2);
                          num2=-num2;
                          myNum2=num2.toString();
                          text='$myNum1 $operator ($myNum2)';
                        }
                      });
                    },text: '+-',)

                  ]
                    ,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  Function onpressed;
  final String text;

  MyButton({this.onpressed,this.text});

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  Color color=Colors.black;


  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FlatButton(
            height: 60,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            color: color,


            onPressed: widget.onpressed, child: Text('${widget.text}',style: TextStyle(fontSize: 30),)),
      ),
    );
  }
}

