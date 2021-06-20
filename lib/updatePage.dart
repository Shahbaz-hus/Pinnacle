import 'package:expensewhat/dbmanager.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

const active_color = Colors.white;
const inactive_color = Colors.blueAccent;


class UpdatePage extends StatefulWidget {



  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final DbTripsManager dbmanager = new DbTripsManager();  
  

 
  




  TextEditingController nameValue = TextEditingController();
  String userName="";
  Color card1 = inactive_color;
  Color card2 = inactive_color;
  Color card3 = inactive_color;
  Color card4 = inactive_color;
  Color card5 = inactive_color;
  Color card6 = inactive_color;
  Color card7 = inactive_color;
  Color card8 = inactive_color;
  Color card9 = inactive_color;
  Color card10 = inactive_color;
  Color card11 = inactive_color;
  Color card12 = inactive_color;
  double radiusA;
  // ignore: non_constant_identifier_names
  int selected_avatar = 0;


  void _showDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(  
                                              title: Text('Invalid name or avatar'),
                                              content: Text('Please try again.'),
                                              actions: <Widget>[
                                                FlatButton(  
                                                  child: Text("Close"),
                                                  onPressed: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                )
                                              ],
                                            );
      },
      );
  }
  
  

  // ignore: non_constant_identifier_names
  void avatar_selection(int index){
    if(index == 1){
      if(card1 == inactive_color){
        card1 = active_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
      else if(card1 == active_color){
        card1 = inactive_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
    }
//////////////////////////////
    else if(index == 2){
      if(card2 == inactive_color){
        card2 = active_color;
        card1 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
      else if(card2 == active_color){
        card1 = inactive_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
    }
    //////////////////////////////
    else if(index == 3){
      if(card3 == inactive_color){
        card3 = active_color;
        card1 = inactive_color;
        card2 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
      else if(card3 == active_color){
        card1 = inactive_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
    }
    //////////////////////////////
    else if(index == 4){
      if(card4 == inactive_color){
        card4 = active_color;
        card1 = inactive_color;
        card3 = inactive_color;
        card2 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
      else if(card4 == active_color){
        card1 = inactive_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
    }
    //////////////////////////////
    else if(index == 5){
      if(card5 == inactive_color){
        card5 = active_color;
        card1 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card2 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
      else if(card5 == active_color){
        card1 = inactive_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
    }
    //////////////////////////////
    else if(index == 6){
      if(card6 == inactive_color){
        card6 = active_color;
        card1 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card2 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
      else if(card6 == active_color){
        card1 = inactive_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
    }
    //////////////////////////////
    else if(index == 7){
      if(card7 == inactive_color){
        card7 = active_color;
        card1 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card2 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
      else if(card7 == active_color){
        card1 = inactive_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
    }
    //////////////////////////////
    else if(index == 8){
      if(card8 == inactive_color){
        card8 = active_color;
        card1 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card2 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
      else if(card8 == active_color){
        card1 = inactive_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
    }
    //////////////////////////////
    else if(index == 9){
      if(card9 == inactive_color){
        card9 = active_color;
        card1 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card2 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
      else if(card9 == active_color){
        card1 = inactive_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
    }

    else if(index == 10){
      if(card10 == inactive_color){
        card10 = active_color;
        card1 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card2 = inactive_color;
        card9 = inactive_color;        
        card11 = inactive_color;
        card12 = inactive_color;
      }
      else if(card10 == active_color){
        card1 = inactive_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
    }

    else if(index == 11){
      if(card11 == inactive_color){
        card11 = active_color;
        card1 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card2 = inactive_color;
        card9 = inactive_color;        
        card10 = inactive_color;
        card12 = inactive_color;
      }
      else if(card11 == active_color){
        card1 = inactive_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
    }

    else if(index == 12){
      if(card12 == inactive_color){
        card12 = active_color;
        card1 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card2 = inactive_color;
        card9 = inactive_color;        
        card10 = inactive_color;
        card11 = inactive_color;
      }
      else if(card12 == active_color){
        card1 = inactive_color;
        card2 = inactive_color;
        card3 = inactive_color;
        card4 = inactive_color;
        card5 = inactive_color;
        card6 = inactive_color;
        card7 = inactive_color;
        card8 = inactive_color;
        card9 = inactive_color;
        card10 = inactive_color;
        card11 = inactive_color;
        card12 = inactive_color;
      }
    }
  }


  _onSubmitted(String value) {
    setState(() {
      userName = value;
    });
  }

  List<String> _currencies = [
      "₹-Rupees",
      "\$-Dollars",
      "£-Pounds",
      "€-Euro",
    ];

    String currentItemSelected = "₹-Rupees";

  @override
  Widget build(BuildContext context) {
    
    if(MediaQuery.of(context).size.width<MediaQuery.of(context).size.height){
      radiusA = MediaQuery.of(context).size.width*0.135;
    }
    else{
      radiusA = MediaQuery.of(context).size.height*0.135;
    }

    


    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: ListView(
                  children:<Widget>[
                  Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                  padding: EdgeInsets.only(left: 20.0,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      
                      IconButton(  
                      icon: Icon(Icons.arrow_back,color: Colors.white,size: 40,),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                      
                      
                      
                      
                      Text(  
                        'Pinnacle',
                        style: TextStyle(  
                          fontFamily: 'Kaushan',
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),

                    Icon(  
                        Icons.dashboard,
                        color: Colors.blueAccent,
                      )
                      
                      
                      
                    ],
                  ),
                 
                ),
                    
                    SizedBox(
                      height: 20,
                    ),
                    
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            obscureText: false,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              hintText: 'Enter your name',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            controller: nameValue,
                            onChanged: _onSubmitted,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: Row(
                        children: <Widget>[

                          Text(  
                            'Select Your Currency',
                            style: TextStyle(  
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,

                            ),
                          ),

                          Spacer(),

                          Container(
                            width: 130,
                            decoration: BoxDecoration(  
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            
                            child: Center(
                              child: DropdownButton<String>(

                                dropdownColor: Colors.white,
                                focusColor: Colors.grey,

                                items: _currencies.map((String dropDownString){
                                  return DropdownMenuItem<String>(
                                      value: dropDownString,
                                      
                                      child: Text(dropDownString,style: TextStyle(fontWeight: FontWeight.bold),),

                                  );
                                  

                                }).toList(),

                                onChanged: (String newValueSelected) {
                                  setState(() {
                                   this.currentItemSelected = newValueSelected;
                                  });
                               
                                  
                                },
                                value: currentItemSelected,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    
                    
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Choose your avatar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ), 
                    
                    
                    Row(
                      children: <Widget>[
                        Expanded(
                           child: GridView.count(
                           shrinkWrap: true,
                           primary: false,
                           padding: EdgeInsets.all(20),
                           crossAxisSpacing: 10,
                           mainAxisSpacing: 10,
                           crossAxisCount: 3,
                           
                           children: <Widget>[                      
                           
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  avatar_selection(1);
                                  selected_avatar = 1;
                                });
                              },
                           child: CircleAvatar(
                             backgroundColor: card1,
                             radius:radiusA*2,                             
                              child: CircleAvatar(
                             radius: radiusA,
                             backgroundImage: AssetImage('assets/images/1.png'),
                             ),
                           ),
                            ),

                             GestureDetector(
                              onTap: (){
                                setState(() {
                                  avatar_selection(2);
                                  selected_avatar = 2;
                                });
                              },
                           child: CircleAvatar(
                             backgroundColor: card2,
                             radius:22,                             
                              child: CircleAvatar(
                             radius: radiusA,
                             backgroundImage: AssetImage('assets/images/2.png'),
                             ),
                           ),
                            ),

                             GestureDetector(
                              onTap: (){
                                setState(() {
                                  avatar_selection(3);
                                  selected_avatar = 3;
                                });
                              },
                           child: CircleAvatar(
                             backgroundColor: card3,
                             radius:22,                             
                              child: CircleAvatar(
                             radius: radiusA,
                             backgroundImage: AssetImage('assets/images/3.png'),
                             ),
                           ),
                            ),

                              GestureDetector(
                              onTap: (){
                                setState(() {
                                  avatar_selection(4);
                                  selected_avatar = 4;
                                });
                              },
                           child: CircleAvatar(
                             backgroundColor: card4,
                             radius:22,                             
                              child: CircleAvatar(
                             radius: radiusA,
                             backgroundImage: AssetImage('assets/images/4.png'),
                             ),
                           ),
                            ),

                              GestureDetector(
                              onTap: (){
                                setState(() {
                                  avatar_selection(5);
                                  selected_avatar = 5;
                                });
                              },
                           child: CircleAvatar(
                             backgroundColor: card5,
                             radius:22,                             
                              child: CircleAvatar(
                             radius: radiusA,
                             backgroundImage: AssetImage('assets/images/5.png'),
                             ),
                           ),
                            ),

                              GestureDetector(
                              onTap: (){
                                setState(() {
                                  avatar_selection(6);
                                  selected_avatar = 6;
                                });
                              },
                           child: CircleAvatar(
                             backgroundColor: card6,
                             radius:22,                             
                              child: CircleAvatar(
                             radius: radiusA,
                             backgroundImage: AssetImage('assets/images/6.png'),
                             ),
                           ),
                            ),

                              GestureDetector(
                              onTap: (){
                                setState(() {
                                  avatar_selection(7);
                                  selected_avatar = 7;
                                });
                              },
                           child: CircleAvatar(
                             backgroundColor: card7,
                             radius:22,                             
                              child: CircleAvatar(
                             radius: radiusA,
                             backgroundImage: AssetImage('assets/images/7.png'),
                             ),
                           ),
                            ),

                              GestureDetector(
                              onTap: (){
                                setState(() {
                                  avatar_selection(8);
                                  selected_avatar = 8;
                                });
                              },
                           child: CircleAvatar(
                             backgroundColor: card8,
                             radius:22,                             
                              child: CircleAvatar(
                             radius: radiusA,
                             backgroundImage: AssetImage('assets/images/8.png'),
                             ),
                           ),
                            ),

                             GestureDetector(
                              onTap: (){
                                setState(() {
                                  avatar_selection(9);
                                  selected_avatar = 9;
                                });
                              },
                           child: CircleAvatar(
                             backgroundColor: card9,
                             radius:22,                             
                              child: CircleAvatar(
                             radius: radiusA,
                             backgroundImage: AssetImage('assets/images/9.png'),
                             ),
                           ),
                            ),

                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  avatar_selection(10);
                                  selected_avatar = 10;
                                });
                              },
                           child: CircleAvatar(
                             backgroundColor: card10,
                             radius:22,                             
                              child: CircleAvatar(
                             radius: radiusA,
                             backgroundImage: AssetImage('assets/images/10.png'),
                             ),
                           ),
                            ),



                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  avatar_selection(11);
                                  selected_avatar = 11;
                                });
                              },
                           child: CircleAvatar(
                             backgroundColor: card11,
                             radius:22,                             
                              child: CircleAvatar(
                             radius: radiusA,
                             backgroundImage: AssetImage('assets/images/11.png'),
                             ),
                           ),
                            ),


                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  avatar_selection(12);
                                  selected_avatar = 12;
                                });
                              },
                           child: CircleAvatar(
                             backgroundColor: card12,
                             radius:22,                             
                              child: CircleAvatar(
                             radius: radiusA,
                             backgroundImage: AssetImage('assets/images/12.png'),
                             ),
                           ),
                            ),

                            

                             

                             


                           
                                    
                           ]
                            ),
                        )
                        ],
                      ),

                       Row(children: <Widget>[
                            
                       ],
                       ),

                  

                   
                  ],
                ),
          ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
                height: 70,                                      
                child: FlatButton( 
                  shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black,),
                ),

                color: Color(0xFF03328A),
                child: new Text('Save',
                    style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () async{
                    if(userName=="" || selected_avatar == 0){
                      _showDialog();
                    }
                    else {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.remove('name');
                    prefs.remove('avatar');
                    prefs.remove('currency');                    
                    prefs.setString('name', nameValue.text);
                    prefs.setInt('avatar', selected_avatar);
                    prefs.setString('currency', currentItemSelected[0]);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page0()),);                                         
                    }
                    nameValue.clear();
                },
              ),
        ),
        );
       


  }
}