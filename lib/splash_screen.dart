import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  

  /*@override
  void initState() {
   
    super.initState();
    token();
  }
  
  token() async{
    
    Timer(Duration(seconds: 4),(){
      
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
      
      
    });
  }*/
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(  
        fit: StackFit.expand,
        children: <Widget>[
          Container(  
            decoration: BoxDecoration(  
              color: Colors.white,
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(  
                    child: Column(  
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        
                       
                         
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(  
                                'Pinnacle',
                                style: TextStyle(  
                                  color: Colors.black,
                                  fontFamily: 'Kaushan',
                                  fontSize:80,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                Expanded(  
                  flex: 1,
                  child: Column(  
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        backgroundColor: Colors.black,

                      ),
                      Padding(padding: EdgeInsets.only(top:20,),
                      ),
                      Text("Split expenses \n  with friends",
                        style: TextStyle(  
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      )

                    ],
                  ),
                )
              ],         

            ),
        ],
      ),
    );
    
  }
}