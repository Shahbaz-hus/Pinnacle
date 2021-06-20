import 'package:flutter/material.dart';
import 'package:expensewhat/authorization2.dart';
import 'package:percent_indicator/percent_indicator.dart';



class NewTrip extends StatefulWidget {
  @override
  _NewTripState createState() => _NewTripState();
}

class _NewTripState extends State<NewTrip> {

  int current = 2;



  void decCurrent() {
    if(current>2){
      setState(() {     

        current = current - 1;
      
    });
    }

  }

  void incCurrent() {
    if(current<10){
      setState(() {    

        current = current + 1;       

      

    });
    }

  } 


  @override 



  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pinnacle",
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
          shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10.0),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20.0,right: 20),
                  child: Row(
                    children: <Widget>[
                      
                      IconButton(  
                        icon: Icon(Icons.arrow_back,color: Colors.black,size: 40,),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                      
                      
                      Spacer(),
                      
                      
                      Text(
                        'Pinnacle',
                        style: TextStyle(
                            fontFamily: 'Kaushan',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0),
                      ),
                      
                      
                    ],
                  ),
                 
                ),

              SizedBox(
                height: 60.0,
              ),

              //User INFO

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15.0),
                child: Container(
                  margin: EdgeInsets.only(
                    top: 30.0,
                  ),
                  height: MediaQuery.of(context).size.height*1.75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:  Border(  
                top: BorderSide(  
                  color: Colors.black,
                )
            ),
                  ),
                  child: ListView(
                    primary: false,
                    padding: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 20.0,
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            //greeting text
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'New Trip',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20.0,
                            ),

                            //select number of members

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text('Select number of trip members'),
                                )
                              ],
                            ),


                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [



                                SizedBox(
                                  height: 30,
                                ),

                                Row(  
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: CircularPercentIndicator(  
                                      radius: 130,
                                      animation: false,
                                      animationDuration: 200,
                                      lineWidth: 4,
                                      percent: current/10,
                                      center: Text(  
                                        current.toString(),
                                        style: TextStyle(  
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,                                          
                                        ),
                                        
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: Colors.grey,
                                      progressColor: Colors.black,
                                    ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 20,),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RaisedButton(
                                      color: Colors.black,
                                      onPressed: decCurrent,
                                      child: Icon(Icons.remove,color: Colors.white,),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RaisedButton(
                                      color: Colors.black,
                                      onPressed: incCurrent,
                                      child: Icon(Icons.add,color: Colors.white,),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 20,),

                                 Row(children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                      height: 40,                                      
                                      child: FlatButton( 
                                        shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Colors.black,),
                                      ),

                                      color: Colors.black,
                                      child: new Text('Continue',
                                          style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                                      onPressed: () {
                                            if(current == 2){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Auth2(members: 2,)),);
                                            } 
                                            else if(current == 3){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Auth2(members: 3,)),);
                                            }
                                            else if(current == 4){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Auth2(members: 4,)),);
                                            }
                                            else if(current == 5){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Auth2(members: 5,)),);
                                            }
                                            else if(current == 6){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Auth2(members: 6,)),);
                                            }
                                            else if(current == 7){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Auth2(members: 7,)),);
                                            }
                                            else if(current == 8){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Auth2(members: 8,)),);
                                            }
                                            else if(current == 9){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Auth2(members: 9,)),);
                                            }
                                            else if(current == 10){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Auth2(members: 10,)),);
                                            }
                                      }

                                    ),
                              ),
                              ),
                              ]
                              ),

                              SizedBox(height: 20,),

                              Row(children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                      height: 40,                                      
                                      child: FlatButton( 
                                        shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Colors.black,),
                                      ),

                                      color: Colors.white,
                                      child: new Text('Back',
                                          style: new TextStyle(fontSize: 16.0, color: Colors.black)),
                                      onPressed: () { 
                                        Navigator.pop(context);
                                      }

                                           ),
                              ),
                              ),
                              ]
                              ),

                              ],
                            )


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),
       ),
    );
  }
}