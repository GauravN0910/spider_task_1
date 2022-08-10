import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:spider_task_1/sharedpref.dart';
import 'package:spider_task_1/splash.dart';
import 'package:vibration/vibration.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await sharedpref.init();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splash()
    )
  );
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
        }, icon: Icon(Icons.menu)),
        title: Center(child: Text("Unit Converter", style: TextStyle(color: Colors.white))),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => History())
              );
          }, icon: Icon(Icons.history))
        ],
      ),
      body:SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => tempConversion())
                      );
                    },
                    child:Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            image:DecorationImage(image: AssetImage('Images/temp.png')),
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Container(
                          height:30,
                          width:150,
                          child:Center(child: Text('Temperature',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400)))
                        )
                      ],
                    )
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => weightConversion())
                      );
                    },
                    child:Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            image:DecorationImage(image: AssetImage('Images/weight.png')),
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Container(
                          height:30,
                          width:150,
                          child:Center(child: Text('Weight',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400)))
                        )
                      ],
                    )
                  ),
                ],
              ),
              SizedBox(height:50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => lengthConversion())
                      );
                    },
                    child:Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            image:DecorationImage(image: AssetImage('Images/length.png')),
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Container(
                          height:30,
                          width:150,
                          child:Center(child: Text('Length',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400)))
                        )
                      ],
                    )
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => speedConversion())
                      );
                    },
                    child:Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            image:DecorationImage(image: AssetImage('Images/speed.png')),
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Container(
                          height:30,
                          width:150,
                          child:Center(child: Text('Speed',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400)))
                        )
                      ],
                    )
                  ),
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}

// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------

class tempConversion extends StatefulWidget {
  const tempConversion({Key? key}) : super(key: key);

  @override
  State<tempConversion> createState() => Tempstate();
}

class Tempstate extends State<tempConversion> {

  String? temp1,temp2;
  double input=0.0,check1=0.0,check2=0.0;
  String result="";
  final List<String> temp = ['Kelvin','Celsius','Farenheit'];

  void Convert(double value, String from, String to){

    var Result;
    
    if (from == 'Farenheit'){
      if(to=='Celsius'){
        Result = (value-32)/1.8;
      }
      else{
        Result = (value-32)/1.8 + 273.15;
      }
    }

    else if(from=='Celsius'){
      if (to=='Farenheit'){
        Result = 1.8*value + 32;
      }
      else{
        Result = value + 273.15;
      }
    }

    else{
      if(to=='Celsius'){
        Result = value - 273.15;
      }
      else{
        Result = 1.8*value - 241.15;
      }
    }

    Result=Result.toString();
    result=double.parse(Result).toStringAsFixed(2);

    setState(() {
      result=result;
    });
  }


  Color? bg = Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_rounded)),
        elevation: 0,
        title: Text("Temperature", style: TextStyle(fontFamily: 'Montserrat', color: Colors.white)),
      ),
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0 , vertical: 18.0),
            child:SingleChildScrollView(
              reverse: true,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text){
                    var inputtext= double.tryParse(text);

                    if (inputtext != null){
                      input=inputtext;
                    }

                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                    filled:true,
                    fillColor: Colors.grey[900],
                    labelText: "Input value to convert",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.white,
                    )
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color:Colors.grey[900],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: DropdownButton<String>(
                        hint: Text('Unit 1',style: TextStyle(color: Colors.white)),
                        dropdownColor: Colors.grey[900],
                        value: temp1,
                        onChanged: (String? selected){
                          temp1=selected;
                          setState(() {});
                        },
                        items:temp.map((String value){
                          return DropdownMenuItem<String>(child: Text('$value',style: TextStyle(color: Colors.white)), value: value);
                        }).toList(),
                      )
                    ),

                    FloatingActionButton(
                      onPressed: (){
                        String? swap=temp1;
                        setState(() {
                          temp1=temp2;
                          temp2=swap;
                        });
                        
                      },
                      child:Icon(Icons.swap_horiz),
                      elevation: 5.0, 
                      backgroundColor: Color.fromARGB(255, 48, 125, 164)
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color:Colors.grey[900],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: DropdownButton<String>(
                        hint: Text('Unit 2',style: TextStyle(color: Colors.white)),
                        dropdownColor: Colors.grey[900],
                        value: temp2,
                        onChanged: (String? selected){
                          temp2=selected;
                          setState(() {});
                        },
                        items:temp.map((String value){
                          return DropdownMenuItem<String>(child: Text('$value',style: TextStyle(color: Colors.white)), value: value);
                        }).toList(),
                      )
                    )
                  ],
                ),

                SizedBox(height:20),

                GestureDetector(
                  onTap: () async {
                    Convert(input, temp1!, temp2!);
                    final scaffold = ScaffoldMessenger.of(context);
                    scaffold.showSnackBar(
                      SnackBar(
                        content: Text('$input $temp1 = $result $temp2')
                      ),
                    );
                    setState(() {
                      bg=Colors.grey[800];
                    });

                    await sharedpref.setdata('\n=> $input $temp1 = $result $temp2');
                  },
                  child:Container(
                    height:50,
                    width:100,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(
                      child:Text('Submit',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold))
                    ),
                  ),
                ),

                SizedBox(height:20),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    children: [
                      Text("Result", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('$result',textAlign: TextAlign.center,style: TextStyle(fontSize: 36,color: Colors.white))
                    ],
                  ),
                ),

                SizedBox(height:20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      child: TextField(
                        onChanged: (text){
                          var inputtext= double.tryParse(text);

                          if (inputtext != null){
                            check1=inputtext;
                          }

                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                          filled:true,
                          fillColor: Colors.grey[900],
                          labelText: "Value 1",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.white,
                          )
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      )
                    ),

                    Container(
                      width: 150,
                      child: TextField(
                        onChanged: (text){
                          var inputtext= double.tryParse(text);

                          if (inputtext != null){
                            check2=inputtext;
                          }

                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                          filled:true,
                          fillColor: Colors.grey[900],
                          labelText: "Value 2",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.white,
                          )
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      )
                    )
                  ],
                ),

                SizedBox(height:20),

                GestureDetector(
                  onTap: () async {
                    Convert(check1, temp1!, temp2!);
                    if(result!=check2.toStringAsFixed(2)){
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text('The Correct Conversion is = $result $temp2')
                        ),
                      );

                      HapticFeedback.vibrate();

                      setState(() {
                        bg=Color.fromARGB(255, 97, 15, 9);
                      });

                    }
                    else{
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text('Correct Conversion')
                        ),
                      );
                      setState(() {
                        bg=Color.fromARGB(255, 37, 130, 91);
                      });
                      await sharedpref.setdata('\n=> $check1 $temp1 = $check2 $temp2');
                    }
                    setState(() {
                      result="";
                    });
                  },
                  child:Container(
                    height:50,
                    width:100,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(
                      child:Text('Check',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold))
                    ),
                  ),
                )
              ]
            ),
          )
        ),
      )
    );
  }
}

// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------

class weightConversion extends StatefulWidget {
  const weightConversion({Key? key}) : super(key: key);

  @override
  State<weightConversion> createState() => WeightState();
}

class WeightState extends State<weightConversion> {

  String? weight1,weight2;
  double input=0.0,check1=0.0,check2=0.0;
  String result="";
  final List<String> weight = ['Kilograms','Grams','Milligrams','Pounds','Ounces'];

  final Map<String,int> wmap=
  {
    'Kilograms':0,
    'Grams':1,
    'Milligrams':2,
    'Pounds':3,
    'Ounces':4
  };

  dynamic Conversions = 
  {
    '0':[1.0,1000.0,1000000.0,2.205,35.274],
    '1':[0.001,1.0,1000.0,1/453.6,1/28.35],
    '2':[0.00001,0.001,1.0,1/453600,1/28350],
    '3':[1/2.205,453.6,453600.0,1.0,16.0],
    '4':[1/35.274,28.35,28350.0,1/16.0,1.0]
  };

  void Convert(double value, String from, String to){
    int? nfrom=wmap[from];
    int? nto=wmap[to];
    var mult=Conversions[nfrom.toString()][nto];
    var Result = mult * value;

    Result=Result.toString();
    result=double.parse(Result).toStringAsFixed(2);

    setState(() {
      result=result;
    });
  }

  Color? bg = Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_rounded)),
        elevation: 0,
        title: Text("Weight", style: TextStyle(fontFamily: 'Montserrat',color: Colors.white)),
      ),
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0 , vertical: 18.0),
            child:SingleChildScrollView(
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text){
                    var inputtext= double.tryParse(text);

                    if (inputtext != null){
                      input=inputtext;
                    }

                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                    filled:true,
                    fillColor: Colors.grey[900],
                    labelText: "Input value to convert",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.white,
                    )
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color:Colors.grey[900],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: DropdownButton<String>(
                        hint: Text('Unit 1',style: TextStyle(color: Colors.white)),
                        dropdownColor: Colors.grey[900],
                        value: weight1,
                        onChanged: (String? selected){
                          weight1=selected;
                          setState(() {});
                        },
                        items:weight.map((String value){
                          return DropdownMenuItem<String>(child: Text('$value',style: TextStyle(color: Colors.white)), value: value);
                        }).toList(),
                      )
                    ),

                    FloatingActionButton(
                      onPressed: (){
                        String? swap=weight1;
                        setState(() {
                          weight1=weight2;
                          weight2=swap;
                        });
                        
                      },
                      child:Icon(Icons.swap_horiz),
                      elevation: 5.0, 
                      backgroundColor: Color.fromARGB(255, 48, 125, 164)
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color:Colors.grey[900],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: DropdownButton<String>(
                        hint: Text('Unit 2',style: TextStyle(color: Colors.white)),
                        dropdownColor: Colors.grey[900],
                        value: weight2,
                        onChanged: (String? selected){
                          weight2=selected;
                          setState(() {});
                        },
                        items:weight.map((String value){
                          return DropdownMenuItem<String>(child: Text('$value',style: TextStyle(color: Colors.white)), value: value);
                        }).toList(),
                      )
                    )
                  ],
                ),

                SizedBox(height:20),

                GestureDetector(
                  onTap: ()async {

                    if(input<=0 ) {
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: const Text('invalid input'),
                        ),
                      );
                    }
                    else{
                      Convert(input, weight1!, weight2!);
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text('$input $weight1 = $result $weight2')
                        ),
                      );
                      await sharedpref.setdata('\n=> $input $weight1 = $result $weight2');
                    }
                    setState(() {
                      bg=Colors.grey[800];
                    });

                  },
                  child:Container(
                    height:50,
                    width:100,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(
                      child:Text('Submit',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold))
                    ),
                  ),
                ),

                SizedBox(height:20),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    children: [
                      Text("Result", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('$result',textAlign: TextAlign.center,style: TextStyle(fontSize: 36,color: Colors.white))
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      child: TextField(
                        onChanged: (text){
                          var inputtext= double.tryParse(text);

                          if (inputtext != null){
                            check1=inputtext;
                          }

                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                          filled:true,
                          fillColor: Colors.grey[900],
                          labelText: "Value 1",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.white,
                          )
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      )
                    ),

                    Container(
                      width: 150,
                      child: TextField(
                        onChanged: (text){
                          var inputtext= double.tryParse(text);

                          if (inputtext != null){
                            check2=inputtext;
                          }

                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                          filled:true,
                          fillColor: Colors.grey[900],
                          labelText: "Value 2",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.white,
                          )
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      )
                    )
                  ],
                ),

                SizedBox(height:20),

                GestureDetector(
                  onTap: () async {
                    Convert(check1, weight1!, weight2!);
                    if(result!=check2.toStringAsFixed(2)){
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text('The Correct Conversion is = $result $weight2')
                        ),
                      );
                      setState(() {
                        bg=Color.fromARGB(255, 97, 15, 9);
                      });
                    }
                    else{
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text('Correct Conversion')
                        ),
                      );
                      setState(() {
                        bg=Color.fromARGB(255, 37, 130, 91);
                      });
                       await sharedpref.setdata('\n=> $check1 $weight1 = $check2 $weight2');
                    }
                    setState(() {
                      result="";
                    });
                  },
                  child:Container(
                    height:50,
                    width:100,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(
                      child:Text('Check',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold))
                    ),
                  ),
                )
              ]
            )
          ),
        ),
      )
    );
  }
}

// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------

class lengthConversion extends StatefulWidget {
  const lengthConversion({Key? key}) : super(key: key);

  @override
  State<lengthConversion> createState() => LengthState();
}

class LengthState extends State<lengthConversion> {

  String? length1,length2;
  double input=0.0,check1=0.0,check2=0.0;
  String result="";
  final List<String> length = ['Kilometres','Metres','Millimetres','Inch','Foot'];

  final Map<String,int> wmap=
  {
    'Kilometres':0,
    'Metres':1,
    'MilliMetres':2,
    'Inch':3,
    'Foot':4
  };

  dynamic Conversions = 
  {
    '0':[1.0,1000.0,1000000.0,39370.1,3280.84],
    '1':[0.001,1.0,1000.0,39.37,3.28],
    '2':[0.000001,0.001,1.0,1/25.4,1/304.8],
    '3':[1/39370,1/39.37,25.4,1/12],
    '4':[1/3280.84,1/3.28,304.8,12.0,1.0]
  };

  void Convert(double value, String from, String to){
    int? nfrom=wmap[from];
    int? nto=wmap[to];
    var mult=Conversions[nfrom.toString()][nto];
    var Result = mult * value;

    Result=Result.toString();
    result=double.parse(Result).toStringAsFixed(2);

    setState(() {
      result=result;
    });
  }

  Color? bg = Colors.grey[800];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_rounded)),
        elevation: 0,
        title: Text("Length", style: TextStyle(fontFamily: 'Montserrat',color: Colors.white)),
      ),
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0 , vertical: 18.0),
            child:SingleChildScrollView(
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text){
                    var inputtext= double.tryParse(text);

                    if (inputtext != null){
                      input=inputtext;
                    }

                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                    filled:true,
                    fillColor: Colors.grey[900],
                    labelText: "Input value to convert",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.white,
                    )
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color:Colors.grey[900],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: DropdownButton<String>(
                        hint: Text('Unit 1',style: TextStyle(color: Colors.white)),
                        dropdownColor: Colors.grey[900],
                        value: length1,
                        onChanged: (String? selected){
                          length1=selected;
                          setState(() {});
                        },
                        items:length.map((String value){
                          return DropdownMenuItem<String>(child: Text('$value',style: TextStyle(color: Colors.white)), value: value);
                        }).toList(),
                      )
                    ),

                    FloatingActionButton(
                      onPressed: (){
                        String? swap=length1;
                        setState(() {
                          length1=length2;
                          length2=swap;
                        });
                        
                      },
                      child:Icon(Icons.swap_horiz),
                      elevation: 5.0, 
                      backgroundColor: Color.fromARGB(255, 48, 125, 164)
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color:Colors.grey[900],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: DropdownButton<String>(
                        hint: Text('Unit 2',style: TextStyle(color: Colors.white)),
                        dropdownColor: Colors.grey[900],
                        value: length2,
                        onChanged: (String? selected){
                          length2=selected;
                          setState(() {});
                        },
                        items:length.map((String value){
                          return DropdownMenuItem<String>(child: Text('$value',style: TextStyle(color: Colors.white)), value: value);
                        }).toList(),
                      )
                    )
                  ],
                ),

                SizedBox(height:20),

                GestureDetector(
                  onTap: ()async {

                    if(input<=0 ){
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: const Text('invalid input'),
                        ),
                      );
                    }
                    else{
                      Convert(input, length1!, length2!);
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text('$input $length1 = $result $length2')
                        ),
                      );
                      await sharedpref.setdata('\n=> $input $length1 = $result $length2');
                    }
                    setState(() {
                      bg=Colors.grey[800];
                    });

                  },
                  child:Container(
                    height:50,
                    width:100,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(
                      child:Text('Submit',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold))
                    ),
                  ),
                ),

                SizedBox(height:20),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    children: [
                      Text("Result", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('$result',textAlign: TextAlign.center,style: TextStyle(fontSize: 36,color: Colors.white))
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      child: TextField(
                        onChanged: (text){
                          var inputtext= double.tryParse(text);

                          if (inputtext != null){
                            check1=inputtext;
                          }

                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                          filled:true,
                          fillColor: Colors.grey[900],
                          labelText: "Value 1",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.white,
                          )
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      )
                    ),

                    Container(
                      width: 150,
                      child: TextField(
                        onChanged: (text){
                          var inputtext= double.tryParse(text);

                          if (inputtext != null){
                            check2=inputtext;
                          }

                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                          filled:true,
                          fillColor: Colors.grey[900],
                          labelText: "Value 2",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.white,
                          )
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      )
                    )
                  ],
                ),

                SizedBox(height:20),

                GestureDetector(
                  onTap: () async{
                    Convert(check1, length1!, length2!);
                    if(result!=check2.toStringAsFixed(2)){
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text('The Correct Conversion is = $result $length2')
                        ),
                      );
                      setState(() {
                        bg=Color.fromARGB(255, 97, 15, 9);
                      });
                    }
                    else{
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text('Correct Conversion')
                        ),
                      );
                      setState(() {
                        bg=Color.fromARGB(255, 37, 130, 91);
                      });
                    }
                    setState(() {
                      result="";
                    });
                    await sharedpref.setdata('\n=> $check1 $length1 = $check2 $length2');
                  },
                  child:Container(
                    height:50,
                    width:100,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(
                      child:Text('Check',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold))
                    ),
                  ),
                )
              ]
            )
          ),
        ),
      )
    );
  }
}

// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------

class speedConversion extends StatefulWidget {
  const speedConversion({Key? key}) : super(key: key);

  @override
  State<speedConversion> createState() => SpeedState();
}

class SpeedState extends State<speedConversion> {

  String? speed1,speed2;
  double input=0.0,check1=0.0,check2=0.0;
  String result="";
  final List<String> speed = ['metre/s','km/h','miles/h','foot/s'];

  final Map<String,int> wmap=
  {
    'metre/s':0,
    'km/h':1,
    'miles/h':2,
    'foot/s':3,
  };

  dynamic Conversions = 
  {
    '0':[1.0,3.6,2.237,3.281],
    '1':[1/3.6,1.0,1/1.609,1/1.097],
    '2':[1/2.237,1.609,1.0,1.467],
    '3':[1/3.281,1.097,1/1.467/1.0],
  };

  void Convert(double value, String from, String to){
    int? nfrom=wmap[from];
    int? nto=wmap[to];
    var mult=Conversions[nfrom.toString()][nto];
    var Result = mult * value;

    Result=Result.toString();
    result=double.parse(Result).toStringAsFixed(2);

    setState(() {
      result=result;
    });
  }

  Color? bg = Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.arrow_back_rounded)),
        elevation: 0,
        title: Text("Speed", style: TextStyle(fontFamily: 'Montserrat',color: Colors.white)),
      ),
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0 , vertical: 18.0),
            child:SingleChildScrollView(
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text){
                    var inputtext= double.tryParse(text);

                    if (inputtext != null){
                      input=inputtext;
                    }

                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                    filled:true,
                    fillColor: Colors.grey[900],
                    labelText: "Input value to convert",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.white,
                    )
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color:Colors.grey[900],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: DropdownButton<String>(
                        hint: Text('Unit 1',style: TextStyle(color: Colors.white)),
                        dropdownColor: Colors.grey[900],
                        value: speed1,
                        onChanged: (String? selected){
                          speed1=selected;
                          setState(() {});
                        },
                        items:speed.map((String value){
                          return DropdownMenuItem<String>(child: Text('$value',style: TextStyle(color: Colors.white)), value: value);
                        }).toList(),
                      )
                    ),

                    FloatingActionButton(
                      onPressed: (){
                        String? swap=speed1;
                        setState(() {
                          speed1=speed2;
                          speed2=swap;
                        });
                        
                      },
                      child:Icon(Icons.swap_horiz),
                      elevation: 5.0, 
                      backgroundColor: Color.fromARGB(255, 48, 125, 164)
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color:Colors.grey[900],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: DropdownButton<String>(
                        hint: Text('Unit 2',style: TextStyle(color: Colors.white)),
                        dropdownColor: Colors.grey[900],
                        value: speed2,
                        onChanged: (String? selected){
                          speed2=selected;
                          setState(() {});
                        },
                        items:speed.map((String value){
                          return DropdownMenuItem<String>(child: Text('$value',style: TextStyle(color: Colors.white)), value: value);
                        }).toList(),
                      )
                    )
                  ],
                ),

                SizedBox(height:20),

                GestureDetector(
                  onTap: () async{

                    if(input<=0 ){
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: const Text('invalid input'),
                        ),
                      );
                    }
                    else{
                      Convert(input, speed1!, speed2!);
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text('$input $speed1 = $result $speed2')
                        ),
                      );
                      await sharedpref.setdata('\n=> $input $speed1 = $result $speed2');
                    }

                    setState(() {
                      bg=Colors.grey[800];
                    });

                  },
                  child:Container(
                    height:50,
                    width:100,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(
                      child:Text('Submit',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold))
                    ),
                  ),
                ),

                SizedBox(height:20),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    children: [
                      Text("Result", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('$result',textAlign: TextAlign.center,style: TextStyle(fontSize: 36,color: Colors.white))
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      child: TextField(
                        onChanged: (text){
                          var inputtext= double.tryParse(text);

                          if (inputtext != null){
                            check1=inputtext;
                          }

                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                          filled:true,
                          fillColor: Colors.grey[900],
                          labelText: "Value 1",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.white,
                          )
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      )
                    ),

                    Container(
                      width: 150,
                      child: TextField(
                        onChanged: (text){
                          var inputtext= double.tryParse(text);

                          if (inputtext != null){
                            check2=inputtext;
                          }

                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                          filled:true,
                          fillColor: Colors.grey[900],
                          labelText: "Value 2",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.white,
                          )
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      )
                    )
                  ],
                ),

                SizedBox(height:20),
GestureDetector(
                  onTap: ()  async{
                    Convert(check1, speed1!, speed2!);
                    if(result!=check2.toStringAsFixed(2)){
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text('The Correct Conversion is = $result $speed2')
                        ),
                      );

                      setState(() {
                        bg=Color.fromARGB(255, 97, 15, 9);
                      });
                    }
                    else{
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text('Correct Conversion')
                        ),
                      );
                      setState(() {
                        bg=Color.fromARGB(255, 37, 130, 91);
                      });
                    }
                    setState(() {
                      result="";
                    });
                    await sharedpref.setdata('\n=> $check1 $speed1 = $check2 $speed2');
                  },
                  child:Container(
                    height:50,
                    width:100,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(
                      child:Text('Check',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold))
                    ),
                  ),
                )
              ]
            )
          ),
        ),
      )
    );
  }
}

// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  List<String> history=[];
  String historytext="";

  @override
  void initState() {
    super.initState();

    history.add(sharedpref.getdata() ?? '');
    for (int i=0;i<history.length;i++){
      historytext = historytext + history[i];
    }
    setState(() {
      historytext=historytext;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.arrow_back_rounded)),
        elevation: 0,
        title: Text("History", style: TextStyle(fontFamily: 'Montserrat',color: Colors.white)),
      ),
      body:SafeArea(
        child:Padding(
          padding:EdgeInsets.symmetric(horizontal:12.0,vertical: 18.0 ),
          child:Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16)
            ),
            child:Center(child:Text(historytext, style: TextStyle(color: Colors.white)))
          )
        )
      )
    );
  }
}
