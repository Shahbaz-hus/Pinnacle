import 'package:expensewhat/calculationButton.dart';
import 'package:expensewhat/expandTile.dart';
import 'package:expensewhat/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dbmanager.dart';
import 'dart:math';
import 'package:firebase_admob/firebase_admob.dart';


const String testDevice = 'D4797B9122D1BA1F0BA7C8F3EFE59831';


double roundDouble(double value, int places){ 
   double mod = pow(10.0, places); 
   return ((value * mod).round().toDouble() / mod); 
}

class TripNameHeading extends StatelessWidget {
  const TripNameHeading({
    Key key,
    @required this.tripName,
  }) : super(key: key);

  final String tripName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
            children: <Widget>[
              Expanded(
                child: Center(
                child: Text(
                  '$tripName',
                  style: TextStyle(                              
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w300,
                    
                  ),
                ),
                ),
              ),
            ],
        ),
        SizedBox(
        height: 60.0,
    ),
      ],
    );
  }
}

// ignore: must_be_immutable
class HeaderData extends StatefulWidget {
   HeaderData({
    Key key,
    this.user0Spent,
    this.user1Spent,
    this.user2Spent,
    this.user3Spent,
    this.user4Spent,
    this.user5Spent,
    this.user6Spent,
    this.user7Spent,
    this.user8Spent,
    this.user9Spent, 
    this.tripName,   
  }
  
  ) : super(key: key);

 double user0Spent;
 double user1Spent;
 double user2Spent;
 double user3Spent;
 double user4Spent;
 double user5Spent;
 double user6Spent;
 double user7Spent;
 double user8Spent;
 double user9Spent;
 String tripName;

  @override
  _HeaderDataState createState() => _HeaderDataState();
}

class _HeaderDataState extends State<HeaderData> {

static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Travel','Money','Shopping'],    
  );


  InterstitialAd _interstitialAd;

  InterstitialAd createInterstitialAd(){
    return InterstitialAd(
      adUnitId: 'ca-app-pub-1272009777215327/2746587922',
      
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print('Interstitial ad $event');
      }
    );
  }


String currency = '';

getPrefData() async{  
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    currency = prefs.getString('currency');
  });
  
}

@override
void initState() { 
  super.initState();
  getPrefData();
}

@override
  void dispose() {    
    _interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: <Widget>[
        Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      
                      Flexible(
                                              child: IconButton(  
                          icon: Icon(Icons.arrow_back,color: Colors.black,size: 40,),
                          onPressed: (){
                            createInterstitialAd()..load()..show();
                            Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                    builder: (context) => Page0()));
                          },
                        ),
                      ),
                      
                      
                      
                      
                     
                      
                      Flexible(
                        flex: 2,
                                              child: Text(
                            'Your Trip',
                            style: TextStyle(                              
                                color: Colors.black,
                                
                                fontSize: 35.0),
                          ),
                      ),

                      

                       

                        Flexible(
                          child: Icon(
                            Icons.star_border,
                            color: Colors.white,
                            )
                          ),
                      
                      
                    ],
                  ),
                 
                ),
        SizedBox(height: 50,),

        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ConstrainedBox(
           constraints: BoxConstraints(  
                   minHeight: 230,
             ),
            child: Container(
                     
                     width: 325,
                     margin: const EdgeInsets.all(6.0),
                     decoration: BoxDecoration(
                     color: Color(0xFF249782),

              
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),

           
                     ),
                     
                     
                     //Custom paint was causing some issue
                     child: Column(
                     
                     children: <Widget>[
                       SizedBox(height: 40,),
                
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 
                 Text(
                 'Total spent',
                 style: TextStyle(
                 color: Color(0xFFD0D0D8),
                 fontWeight: FontWeight.w400,
                 fontSize: 25,
                 ),
                 ),            
                 
               ],
              ),

              SizedBox(height: 10,),

              Container(
                width: 250,
                child: Divider(  
                  color: Colors.white,
                  
                ),
              ),

              SizedBox(height: 10,),

              Row(  
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               Center(                    
                     child: Text('$currency${widget.user0Spent+widget.user1Spent+widget.user2Spent+widget.user3Spent+widget.user4Spent+widget.user5Spent+widget.user6Spent+widget.user7Spent+widget.user8Spent+widget.user9Spent}',style: TextStyle(color: Colors.white,fontFamily: 'DIN-LIGHT',fontWeight: FontWeight.bold,fontSize: 40,),),
               ),
               
              ],
              ),
                      
              
                     ],
                     ),
              ),
            ),
        ),


      
        ],
    );
  }
}




// ignore: must_be_immutable
class CalculationPage2 extends StatefulWidget {
  int members;
  int id;  
  String tripName;
  String user0Name;
  String expense0;
  String user1Name;  
  double user0Spent;
  double user1Spent;
  String expense1;
  
  CalculationPage2({
    this.id,
    this.members,    
    this.tripName,
    this.user0Name,
    this.user0Spent,
    this.user1Name,
    this.user1Spent,
    this.expense0,
    this.expense1,
    
  });

  @override
  _CalculationPage2State createState() => _CalculationPage2State(
        id,
        members,
        tripName,        
        user0Name,
        user0Spent,
        user1Name,
        user1Spent,
        expense0,
        expense1,
        

  );
}
class _CalculationPage2State extends State<CalculationPage2> {

   static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Travel','Money','Shopping'],    
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd(){
    return BannerAd(
      adUnitId: 'ca-app-pub-1272009777215327/6505584120',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print('BannerAD $event');
      }
    );
  }

   @override
  void initState() {    
    super.initState();
    FirebaseAdMob.instance.initialize(
      appId: 'ca-app-pub-9964647684084048~8914317121',
    );
    _bannerAd = createBannerAd()..load()..show();
  }

  @override
  void dispose() { 
    _bannerAd.dispose();
    super.dispose();
  }

final DbTripsManager dbmanager = new DbTripsManager();


  int members;
  int id;
  String tripName;
  String user0Name;
  String user1Name;  
  double user0Spent;
  double user1Spent;
  
  String expense0;
  String expense1;
  

  String expenseName;
  double expensePrice;
  TextEditingController expenseNameDialog = new TextEditingController();
  TextEditingController expensePriceDialog = new TextEditingController();

  

  

  _CalculationPage2State(
    this.id,
    this.members,
    this.tripName,
    this.user0Name,
    this.user0Spent,
    this.user1Name,
    this.user1Spent,  
    this.expense0,
    this.expense1,  
  );

 

  @override
 Widget build(BuildContext context) {

   

    return MaterialApp(
    title: "Pinnacle",
    home: SafeArea(
        child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
                  child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: HeaderData(user0Spent: user0Spent, user1Spent: user1Spent,user2Spent: 0,user3Spent: 0,user4Spent: 0,user5Spent: 0,user6Spent: 0,user7Spent: 0,user8Spent: 0,user9Spent: 0,),
              
            ),
            
//User INFO
            SingleChildScrollView(
                              child: Container(
                    margin: EdgeInsets.only(
                      top: 30.0,
                    ),
                    
                    decoration: BoxDecoration(
                      color: Colors.white,
                      
                    ),
                    child: Padding(
                      padding:EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 20.0,
                        ),
                      child: Column(
                        
                        children: <Widget>[
                          Column(
                children: <Widget>[
//greeting text
                  TripNameHeading(tripName: tripName),
                  
//app work
                  Column(children: <Widget>[
                      
                      
                ExpandTile(userNumber: 0, userName: user0Name, userSpent: user0Spent, expense: expense0, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                SizedBox(height: 20),

                ExpandTile(userNumber: 1, userName: user1Name, userSpent: user1Spent, expense: expense1, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                SizedBox(height: 60,),

                        Padding(
                          padding: const EdgeInsets.only(bottom:120.0),
                          child: Container(
                          width: 200,
                          height: 75,
                          
                          child: CalculationButton(tripName: tripName,user0Name: user0Name, user1Name: user1Name, user0Spent: user0Spent, user1Spent: user1Spent,members: 2,),
                           
                          ),
                        ),
                        

                        


                          
                  ]),
                ],
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          ]),
        ),
      )));
  }
}




// ignore: must_be_immutable
class CalculationPage3 extends StatefulWidget {
  int members;
  int id;
  String tripName;
  String user0Name;
  String user1Name;
  String user2Name;
  double user0Spent;
  double user1Spent;
  double user2Spent;
  String expense0;
  String expense1;
  String expense2;

  CalculationPage3({
    this.id,
    this.members,
    this.tripName,
    this.user0Name,
    this.user0Spent,
    this.user1Name,
    this.user1Spent,
    this.user2Name,
    this.user2Spent,
    this.expense0,
    this.expense1,
    this.expense2,
  });
  @override
  _CalculationPage3State createState() => _CalculationPage3State(
        id,
        members,
        tripName,
        user0Name,
        user0Spent,
        user1Name,
        user1Spent,
        user2Name,
        user2Spent,
        expense0,
        expense1,
        expense2,
      );
}
class _CalculationPage3State extends State<CalculationPage3> {

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Travel','Money','Shopping'],    
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd(){
    return BannerAd(
      adUnitId: 'ca-app-pub-1272009777215327/6505584120',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print('BannerAD $event');
      }
    );
  }

   @override
  void initState() {    
    super.initState();
    FirebaseAdMob.instance.initialize(
      appId: 'ca-app-pub-9964647684084048~8914317121',
    );
    _bannerAd = createBannerAd()..load()..show();
  }

  @override
  void dispose() { 
    _bannerAd.dispose();
    super.dispose();
  }
  
  final DbTripsManager dbmanager = new DbTripsManager();


  int members;
  int id;
  String tripName;
  String user0Name;
  String user1Name;
  String user2Name;
  double user0Spent;
  double user1Spent;
  double user2Spent;
  String expense0;
  String expense1;
  String expense2;



  String expenseName;
  double expensePrice;
  TextEditingController expenseNameDialog = new TextEditingController();
  TextEditingController expensePriceDialog = new TextEditingController();

  

  


  _CalculationPage3State(
    this.id,
    this.members,
    this.tripName,
    this.user0Name,
    this.user0Spent,
    this.user1Name,
    this.user1Spent,
    this.user2Name,
    this.user2Spent,
    this.expense0,
    this.expense1,
    this.expense2
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Pinnacle",
        home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
      body: SingleChildScrollView(
                child: Column(
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: HeaderData(tripName: tripName,user0Spent: user0Spent, user1Spent: user1Spent,user2Spent: user2Spent,user3Spent: 0,user4Spent: 0,user5Spent: 0,user6Spent: 0,user7Spent: 0,user8Spent: 0,user9Spent: 0,),
          ),
          SizedBox(
            height: 60.0,
          ),
//User INFO
          SingleChildScrollView(
                        child: Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                ),
                
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 20.0,
                        ),
                  child: Column(
                    
                    children: <Widget>[
                      Column(
                        children: <Widget>[
//greeting text
                       TripNameHeading(tripName: tripName),

                        
//app work
                        Column(children: <Widget>[

                    
              ExpandTile(userNumber: 0, userName: user0Name, userSpent: user0Spent, expense: expense0, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20),


              ExpandTile(userNumber: 1, userName: user1Name, userSpent: user1Spent, expense: expense1, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 2, userName: user2Name, userSpent: user2Spent, expense: expense2, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 60,),

                          Container(
                            width: 200,
                            height: 75,
                            
                            child: CalculationButton(tripName: tripName,user0Name: user0Name, user0Spent: user0Spent, user1Name: user1Name, user1Spent: user1Spent, user2Name: user2Name, user2Spent: user2Spent, members: 3,),
                          ),

                          SizedBox(height: 80,),

                          
                          
                        ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ]),
      ),
    )));
  }
}


// ignore: must_be_immutable
class CalculationPage4 extends StatefulWidget {
  int members;
  int id;
  String tripName;
  
  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  
  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  
  String expense0;
  String expense1;
  String expense2;
  String expense3;

  CalculationPage4({
    this.id,
    this.members,
    this.tripName,
    
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,


    this.user0Spent,    
    this.user1Spent,    
    this.user2Spent,    
    this.user3Spent,

    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    
  });

  @override
  _CalculationPage4State createState() => _CalculationPage4State(
        id,
        members,
        tripName,

        user0Name,
        user1Name,
        user2Name,
        user3Name,

        user0Spent,        
        user1Spent,        
        user2Spent,
        user3Spent,

        expense0,
        expense1,
        expense2,        
        expense3,

        

  );
}
class _CalculationPage4State extends State<CalculationPage4> {

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Travel','Money','Shopping'],    
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd(){
    return BannerAd(
      adUnitId: 'ca-app-pub-1272009777215327/6505584120',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print('BannerAD $event');
      }
    );
  }

   @override
  void initState() {    
    super.initState();
    FirebaseAdMob.instance.initialize(
      appId: 'ca-app-pub-9964647684084048~8914317121',
    );
    _bannerAd = createBannerAd()..load()..show();
  }

  @override
  void dispose() { 
    _bannerAd.dispose();
    super.dispose();
  }

  final DbTripsManager dbmanager = new DbTripsManager();

  

  int members;
  int id;
  String tripName;
  
  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  
  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  
  String expense0;
  String expense1;
  String expense2;
  String expense3;

  String expenseName;
  double expensePrice;
  TextEditingController expenseNameDialog = new TextEditingController();
  TextEditingController expensePriceDialog = new TextEditingController();

   

  _CalculationPage4State(
    this.id,
    this.members,
    this.tripName,
    
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,


    this.user0Spent,    
    this.user1Spent,    
    this.user2Spent,    
    this.user3Spent,

    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
  );





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "Pinnacle",
        home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
      body: SingleChildScrollView(
                child: Column(
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: HeaderData(user0Spent: user0Spent, user1Spent: user1Spent,user2Spent: user2Spent,user3Spent: user3Spent,user4Spent: 0,user5Spent: 0,user6Spent: 0,user7Spent: 0,user8Spent: 0,user9Spent: 0,),
          ),
          
//User INFO
          SingleChildScrollView(
                        child: Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                ),
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                    topRight: Radius.circular(75.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 20.0,
                        ),
                  child: Column(
                    
                    children: <Widget>[
                      Column(
                        children: <Widget>[
//greeting text
                         TripNameHeading(tripName: tripName,),

                        Column(children: <Widget>[
                    
              ExpandTile(userNumber: 0, userName: user0Name, userSpent: user0Spent, expense: expense0, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20),


              ExpandTile(userNumber: 1, userName: user1Name, userSpent: user1Spent, expense: expense1, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),


              ExpandTile(userNumber: 2, userName: user2Name, userSpent: user2Spent, expense: expense2, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 3, userName: user3Name, userSpent: user3Spent, expense: expense3, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 60,),

                          Container(
                            width: 200,
                            height: 75,
                            
                            child: CalculationButton(tripName: tripName,user0Name: user0Name, user0Spent: user0Spent, user1Name: user1Name, user1Spent: user1Spent, user2Name: user2Name, user2Spent: user2Spent, user3Name: user3Name, user3Spent: user3Spent, members: 4,),
                          ),

                          SizedBox(height: 80,),
                            
                          
                          
                        ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ]),
      ),
    )));
  }
}


// ignore: must_be_immutable
class CalculationPage5 extends StatefulWidget {
  int members;
  int id;
  String tripName;
  
  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  String user4Name;
  
  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  double user4Spent;
  
  String expense0;
  String expense1;
  String expense2;
  String expense3;
  String expense4;

  CalculationPage5({
    this.id,
    this.members,
    this.tripName,
    
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,
    this.user4Name,


    this.user0Spent,    
    this.user1Spent,    
    this.user2Spent,    
    this.user3Spent,
    this.user4Spent,

    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
    
  });

  @override
  _CalculationPage5State createState() => _CalculationPage5State(
        id,
        members,
        tripName,

        user0Name,
        user1Name,
        user2Name,
        user3Name,
        user4Name,

        user0Spent,        
        user1Spent,        
        user2Spent,
        user3Spent,
        user4Spent,

        expense0,
        expense1,
        expense2,        
        expense3,
        expense4,

  );
}
class _CalculationPage5State extends State<CalculationPage5> {

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Travel','Money','Shopping'],    
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd(){
    return BannerAd(
      adUnitId: 'ca-app-pub-1272009777215327/6505584120',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print('BannerAD $event');
      }
    );
  }

   @override
  void initState() {    
    super.initState();
    FirebaseAdMob.instance.initialize(
      appId: 'ca-app-pub-9964647684084048~8914317121',
    );
    _bannerAd = createBannerAd()..load()..show();
  }

  @override
  void dispose() { 
    _bannerAd.dispose();
    super.dispose();
  }

  final DbTripsManager dbmanager = new DbTripsManager();

  int members;
  int id;
  String tripName;
  
  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  String user4Name;
  
  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  double user4Spent;
  
  String expense0;
  String expense1;
  String expense2;
  String expense3;
  String expense4;

  String expenseName;
  double expensePrice;
  TextEditingController expenseNameDialog = new TextEditingController();
  TextEditingController expensePriceDialog = new TextEditingController();

   

  _CalculationPage5State(
    this.id,
    this.members,
    this.tripName,
    
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,
    this.user4Name,


    this.user0Spent,    
    this.user1Spent,    
    this.user2Spent,    
    this.user3Spent,
    this.user4Spent,

    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
  );





  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
     title: "Pinnacle",
        home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
      body: SingleChildScrollView(
                child: Column(
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: HeaderData(user0Spent: user0Spent, user1Spent: user1Spent,user2Spent: user2Spent,user3Spent: user3Spent,user4Spent: user4Spent,user5Spent: 0,user6Spent: 0,user7Spent: 0,user8Spent: 0,user9Spent: 0,),
          ),
          
//User INFO
          SingleChildScrollView(
                        child: Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                ),                  
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                    topRight: Radius.circular(75.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 20.0,
                        ),
                  child: Column(
                   
                    children: <Widget>[
                      Column(
                        children: <Widget>[
//greeting text
                         TripNameHeading(tripName: tripName,),

                        Column(children: <Widget>[                              

                    
              ExpandTile(userNumber: 0, userName: user0Name, userSpent: user0Spent, expense: expense0, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20),

              ExpandTile(userNumber: 1, userName: user1Name, userSpent: user1Spent, expense: expense1, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 2, userName: user2Name, userSpent: user2Spent, expense: expense2, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 3, userName: user3Name, userSpent: user3Spent, expense: expense3, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 4, userName: user4Name, userSpent: user4Spent, expense: expense4, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 60,),

                          Container(
                            width: 200,
                            height: 75,
                            
                            child: CalculationButton(tripName: tripName,user0Name: user0Name, user0Spent: user0Spent, user1Name: user1Name, user1Spent: user1Spent, user2Name: user2Name, user2Spent: user2Spent, user3Name: user3Name, user3Spent: user3Spent, user4Name: user4Name, user4Spent: user4Spent,members: 5,),
                          ),

                          SizedBox(height: 80,),
                          
                        ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ]),
      ),
    )));
  }
}


// ignore: must_be_immutable
class CalculationPage6 extends StatefulWidget {
  int members;
  int id;
  String tripName;
  
  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  String user4Name;
  String user5Name;
  
  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  double user4Spent;
  double user5Spent;
  
  String expense0;
  String expense1;
  String expense2;
  String expense3;
  String expense4;
  String expense5;

  CalculationPage6({
    this.id,
    this.members,
    this.tripName,
    
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,
    this.user4Name,
    this.user5Name,


    this.user0Spent,    
    this.user1Spent,    
    this.user2Spent,    
    this.user3Spent,
    this.user4Spent,
    this.user5Spent,

    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
    this.expense5,
    
  });

  @override
  _CalculationPage6State createState() => _CalculationPage6State(
        id,
        members,
        tripName,

        user0Name,
        user1Name,
        user2Name,
        user3Name,
        user4Name,
        user5Name,

        user0Spent,        
        user1Spent,        
        user2Spent,
        user3Spent,
        user4Spent,
        user5Spent,

        expense0,
        expense1,
        expense2,        
        expense3,
        expense4,
        expense5,

  );
}
class _CalculationPage6State extends State<CalculationPage6> {

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Travel','Money','Shopping'],    
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd(){
    return BannerAd(
      adUnitId: 'ca-app-pub-1272009777215327/6505584120',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print('BannerAD $event');
      }
    );
  }

   @override
  void initState() {    
    super.initState();
    FirebaseAdMob.instance.initialize(
      appId: 'ca-app-pub-9964647684084048~8914317121',
    );
    _bannerAd = createBannerAd()..load()..show();
  }

  @override
  void dispose() { 
    _bannerAd.dispose();
    super.dispose();
  }

  final DbTripsManager dbmanager = new DbTripsManager();

  int members;
  int id;
  String tripName;
  
  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  String user4Name;
  String user5Name;
  
  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  double user4Spent;
  double user5Spent;
  
  String expense0;
  String expense1;
  String expense2;
  String expense3;
  String expense4;
  String expense5;

  String expenseName;
  double expensePrice;
  TextEditingController expenseNameDialog = new TextEditingController();
  TextEditingController expensePriceDialog = new TextEditingController();

   

  _CalculationPage6State(
    this.id,
    this.members,
    this.tripName,
    
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,
    this.user4Name,
    this.user5Name,


    this.user0Spent,    
    this.user1Spent,    
    this.user2Spent,    
    this.user3Spent,
    this.user4Spent,
    this.user5Spent,

    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
    this.expense5,
  );





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "Pinnacle",
        home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
      body: SingleChildScrollView(
                child: Column(
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: HeaderData(user0Spent: user0Spent, user1Spent: user1Spent,user2Spent: user2Spent,user3Spent: user3Spent,user4Spent: user4Spent,user5Spent: user5Spent,user6Spent: 0,user7Spent: 0,user8Spent: 0,user9Spent: 0,),
          ),
          
//User INFO
          SingleChildScrollView(
                        child: Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                ),                  
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                    topRight: Radius.circular(75.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 20.0,
                        ),
                  child: Column(
                    
                    children: <Widget>[
                      Column(
                        children: <Widget>[
//greeting text
                        TripNameHeading(tripName: tripName,),

                        Column(children: <Widget>[                             
                    
                                            ExpandTile(userNumber: 0, userName: user0Name, userSpent: user0Spent, expense: expense0, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                                            SizedBox(height: 20),

                                            ExpandTile(userNumber: 1, userName: user1Name, userSpent: user1Spent, expense: expense1, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                                            SizedBox(height: 20,),

                                            ExpandTile(userNumber: 2, userName: user2Name, userSpent: user2Spent, expense: expense2, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                                            SizedBox(height: 20,),

                                            ExpandTile(userNumber: 3, userName: user3Name, userSpent: user3Spent, expense: expense3, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                                            SizedBox(height: 20,),

                                            ExpandTile(userNumber: 4, userName: user4Name, userSpent: user4Spent, expense: expense4, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                                            SizedBox(height: 20,),

                                            ExpandTile(userNumber: 5, userName: user5Name, userSpent: user5Spent, expense: expense5, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                                            SizedBox(height: 60,),

                          Container(
                            width: 200,
                            height: 75,
                            
                            child: CalculationButton(tripName: tripName,user0Name: user0Name, user0Spent: user0Spent, user1Name: user1Name, user1Spent: user1Spent, user2Name: user2Name, user2Spent: user2Spent, user3Name: user3Name, user3Spent: user3Spent, user4Name: user4Name, user4Spent: user4Spent,user5Name: user5Name,user5Spent: user5Spent,members: 6),
                          ),

                          SizedBox(height: 80,),
                          
                        ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ]),
      ),
    )));
  }
}


// ignore: must_be_immutable
class CalculationPage7 extends StatefulWidget {
  int members;
  int id;
  String tripName;
  
  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  String user4Name;
  String user5Name;
  String user6Name;
  
  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  double user4Spent;
  double user5Spent;
  double user6Spent;
  
  String expense0;
  String expense1;
  String expense2;
  String expense3;
  String expense4;
  String expense5;
  String expense6;

  CalculationPage7({
    this.id,
    this.members,
    this.tripName,
    
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,
    this.user4Name,
    this.user5Name,
    this.user6Name,


    this.user0Spent,    
    this.user1Spent,    
    this.user2Spent,    
    this.user3Spent,
    this.user4Spent,
    this.user5Spent,
    this.user6Spent,

    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
    this.expense5,
    this.expense6,
    
  });

  @override
  _CalculationPage7State createState() => _CalculationPage7State(
        id,
        members,
        tripName,

        user0Name,
        user1Name,
        user2Name,
        user3Name,
        user4Name,
        user5Name,
        user6Name,

        user0Spent,        
        user1Spent,        
        user2Spent,
        user3Spent,
        user4Spent,
        user5Spent,
        user6Spent,

        expense0,
        expense1,
        expense2,        
        expense3,
        expense4,
        expense5,
        expense6,

  );
}
class _CalculationPage7State extends State<CalculationPage7> {

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Travel','Money','Shopping'],    
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd(){
    return BannerAd(
      adUnitId: 'ca-app-pub-1272009777215327/6505584120',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print('BannerAD $event');
      }
    );
  }

   @override
  void initState() {    
    super.initState();
    FirebaseAdMob.instance.initialize(
      appId: 'ca-app-pub-9964647684084048~8914317121',
    );
    _bannerAd = createBannerAd()..load()..show();
  }

  @override
  void dispose() { 
    _bannerAd.dispose();
    super.dispose();
  }

  final DbTripsManager dbmanager = new DbTripsManager();

  int members;
  int id;
  String tripName;
  
  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  String user4Name;
  String user5Name;
  String user6Name;
  
  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  double user4Spent;
  double user5Spent;
  double user6Spent;
  
  String expense0;
  String expense1;
  String expense2;
  String expense3;
  String expense4;
  String expense5;
  String expense6;

  String expenseName;
  double expensePrice;
  TextEditingController expenseNameDialog = new TextEditingController();
  TextEditingController expensePriceDialog = new TextEditingController();

   

  _CalculationPage7State(
    this.id,
    this.members,
    this.tripName,
    
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,
    this.user4Name,
    this.user5Name,
    this.user6Name,


    this.user0Spent,    
    this.user1Spent,    
    this.user2Spent,    
    this.user3Spent,
    this.user4Spent,
    this.user5Spent,
    this.user6Spent,

    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
    this.expense5,
    this.expense6,
  );





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "Pinnacle",
        home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
      body: SingleChildScrollView(
                child: Column(
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: HeaderData(user0Spent: user0Spent, user1Spent: user1Spent,user2Spent: user2Spent,user3Spent: user3Spent,user4Spent: user4Spent,user5Spent: user5Spent,user6Spent: user6Spent,user7Spent: 0,user8Spent: 0,user9Spent: 0,),
          ),
          
//User INFO
          SingleChildScrollView(
                        child: Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                ),                  
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                    topRight: Radius.circular(75.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 20.0,
                        ),
                  child: Column(
                    
                    children: <Widget>[
                      Column(
                        children: <Widget>[
//greeting text
                        TripNameHeading(tripName: tripName,),

                        Column(children: <Widget>[

                  ExpandTile(userNumber: 0, userName: user0Name, userSpent: user0Spent, expense: expense0, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                  SizedBox(height: 20),

                  ExpandTile(userNumber: 1, userName: user1Name, userSpent: user1Spent, expense: expense1, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                  SizedBox(height: 20,),

                  ExpandTile(userNumber: 2, userName: user2Name, userSpent: user2Spent, expense: expense2, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                  SizedBox(height: 20,),

                  ExpandTile(userNumber: 3, userName: user3Name, userSpent: user3Spent, expense: expense3, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                  SizedBox(height: 20,),

                  ExpandTile(userNumber: 4, userName: user4Name, userSpent: user4Spent, expense: expense4, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                  SizedBox(height: 20,),

                  ExpandTile(userNumber: 5, userName: user5Name, userSpent: user5Spent, expense: expense5, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                  SizedBox(height: 20,),

                  ExpandTile(userNumber: 6, userName: user6Name, userSpent: user6Spent, expense: expense6, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                  SizedBox(height: 60,),

                          Container(
                            width: 200,
                            height: 75,
                            
                            child: CalculationButton(tripName: tripName,members: 7,user0Name: user0Name, user0Spent: user0Spent, user1Name: user1Name, user1Spent: user1Spent, user2Name: user2Name, user2Spent: user2Spent, user3Name: user3Name, user3Spent: user3Spent, user4Name: user4Name, user4Spent: user4Spent,user5Name: user5Name,user5Spent: user5Spent,user6Name: user6Name,user6Spent: user6Spent ),
                          ),

                          SizedBox(height: 80,),
                        ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ]),
      ),
    )));
  }
}


// ignore: must_be_immutable
class CalculationPage8 extends StatefulWidget {
  int members;
  int id;
  String tripName;
  
  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  String user4Name;
  String user5Name;
  String user6Name;
  String user7Name;
  
  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  double user4Spent;
  double user5Spent;
  double user6Spent;
  double user7Spent;
  
  String expense0;
  String expense1;
  String expense2;
  String expense3;
  String expense4;
  String expense5;
  String expense6;
  String expense7;

  CalculationPage8({
    this.id,
    this.members,
    this.tripName,
    
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,
    this.user4Name,
    this.user5Name,
    this.user6Name,
    this.user7Name,

    this.user0Spent,    
    this.user1Spent,    
    this.user2Spent,    
    this.user3Spent,
    this.user4Spent,
    this.user5Spent,
    this.user6Spent,
    this.user7Spent,

    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
    this.expense5,
    this.expense6,
    this.expense7,
    
  });

  @override
  _CalculationPage8State createState() => _CalculationPage8State(
        id,
        members,
        tripName,

        user0Name,
        user1Name,
        user2Name,
        user3Name,
        user4Name,
        user5Name,
        user6Name,
        user7Name,

        user0Spent,        
        user1Spent,        
        user2Spent,
        user3Spent,
        user4Spent,
        user5Spent,
        user6Spent,
        user7Spent,

        expense0,
        expense1,
        expense2,        
        expense3,
        expense4,
        expense5,
        expense6,
        expense7,

  );
}
class _CalculationPage8State extends State<CalculationPage8> {

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Travel','Money','Shopping'],    
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd(){
    return BannerAd(
      adUnitId: 'ca-app-pub-1272009777215327/6505584120',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print('BannerAD $event');
      }
    );
  }

   @override
  void initState() {    
    super.initState();
    FirebaseAdMob.instance.initialize(
      appId: 'ca-app-pub-9964647684084048~8914317121',
    );
    _bannerAd = createBannerAd()..load()..show();
  }

  @override
  void dispose() { 
    _bannerAd.dispose();
    super.dispose();
  }

  final DbTripsManager dbmanager = new DbTripsManager();

  int members;
  int id;
  String tripName;
  
  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  String user4Name;
  String user5Name;
  String user6Name;
  String user7Name;
  
  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  double user4Spent;
  double user5Spent;
  double user6Spent;
  double user7Spent;
  
  String expense0;
  String expense1;
  String expense2;
  String expense3;
  String expense4;
  String expense5;
  String expense6;
  String expense7;

  String expenseName;
  double expensePrice;
  TextEditingController expenseNameDialog = new TextEditingController();
  TextEditingController expensePriceDialog = new TextEditingController();

  

  _CalculationPage8State(
    this.id,
    this.members,
    this.tripName,
    
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,
    this.user4Name,
    this.user5Name,
    this.user6Name,
    this.user7Name,


    this.user0Spent,    
    this.user1Spent,    
    this.user2Spent,    
    this.user3Spent,
    this.user4Spent,
    this.user5Spent,
    this.user6Spent,
    this.user7Spent,

    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
    this.expense5,
    this.expense6,
    this.expense7,
  );





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "Pinnacle",
        home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
      body: SingleChildScrollView(
                child: Column(
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: HeaderData(user0Spent: user0Spent, user1Spent: user1Spent,user2Spent: user2Spent,user3Spent: user3Spent,user4Spent: user4Spent,user5Spent: user5Spent,user6Spent: user6Spent,user7Spent: user7Spent,user8Spent: 0,user9Spent: 0,),
          ),
          
//User INFO
          SingleChildScrollView(
                        child: Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                ),
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                    topRight: Radius.circular(75.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 20.0,
                        ),
                  child: Column(
                    
                    children: <Widget>[
                      Column(
                        children: <Widget>[
//greeting text
                        TripNameHeading(tripName: tripName,),

                        Column(children: <Widget>[
                   
                ExpandTile(userNumber: 0, userName: user0Name, userSpent: user0Spent, expense: expense0, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                SizedBox(height: 20),

                ExpandTile(userNumber: 1, userName: user1Name, userSpent: user1Spent, expense: expense1, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                SizedBox(height: 20,),

                ExpandTile(userNumber: 2, userName: user2Name, userSpent: user2Spent, expense: expense2, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                SizedBox(height: 20,),

                ExpandTile(userNumber: 3, userName: user3Name, userSpent: user3Spent, expense: expense3, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                SizedBox(height: 20,),

                ExpandTile(userNumber: 4, userName: user4Name, userSpent: user4Spent, expense: expense4, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                SizedBox(height: 20,),

                ExpandTile(userNumber: 5, userName: user5Name, userSpent: user5Spent, expense: expense5, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                SizedBox(height: 20,),

                ExpandTile(userNumber: 6, userName: user6Name, userSpent: user6Spent, expense: expense6, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                SizedBox(height: 20,),    

                ExpandTile(userNumber: 7, userName: user7Name, userSpent: user7Spent, expense: expense7, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
                SizedBox(height: 60,),

                          Container(
                            width: 200,
                            height: 75,
                            
                            child: CalculationButton(tripName: tripName,members: 8,user0Name: user0Name, user0Spent: user0Spent, user1Name: user1Name, user1Spent: user1Spent, user2Name: user2Name, user2Spent: user2Spent, user3Name: user3Name, user3Spent: user3Spent, user4Name: user4Name, user4Spent: user4Spent,user5Name: user5Name,user5Spent: user5Spent,user6Name: user6Name,user6Spent: user6Spent,user7Name: user7Name,user7Spent: user7Spent,),
                          ),

                          SizedBox(height: 80,),
                        ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ]),
      ),
    )));
  }
}

// ignore: must_be_immutable
class CalculationPage9 extends StatefulWidget {
  int members;
  int id;
  String tripName;
  
  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  String user4Name;
  String user5Name;
  String user6Name;
  String user7Name;
  String user8Name;
  
  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  double user4Spent;
  double user5Spent;
  double user6Spent;
  double user7Spent;
  double user8Spent;
  
  String expense0;
  String expense1;
  String expense2;
  String expense3;
  String expense4;
  String expense5;
  String expense6;
  String expense7;
  String expense8;

  CalculationPage9({
    this.id,
    this.members,
    this.tripName,
    
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,
    this.user4Name,
    this.user5Name,
    this.user6Name,
    this.user7Name,
    this.user8Name,

    this.user0Spent,    
    this.user1Spent,    
    this.user2Spent,    
    this.user3Spent,
    this.user4Spent,
    this.user5Spent,
    this.user6Spent,
    this.user7Spent,
    this.user8Spent,

    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
    this.expense5,
    this.expense6,
    this.expense7,
    this.expense8,
    
  });

  @override
  _CalculationPage9State createState() => _CalculationPage9State(
        id,
        members,
        tripName,

        user0Name,
        user1Name,
        user2Name,
        user3Name,
        user4Name,
        user5Name,
        user6Name,
        user7Name,
        user8Name,

        user0Spent,        
        user1Spent,        
        user2Spent,
        user3Spent,
        user4Spent,
        user5Spent,
        user6Spent,
        user7Spent,
        user8Spent,

        expense0,
        expense1,
        expense2,        
        expense3,
        expense4,
        expense5,
        expense6,
        expense7,
        expense8,

  );
}
class _CalculationPage9State extends State<CalculationPage9> {

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Travel','Money','Shopping'],    
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd(){
    return BannerAd(
      adUnitId: 'ca-app-pub-1272009777215327/6505584120',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print('BannerAD $event');
      }
    );
  }

   @override
  void initState() {    
    super.initState();
    FirebaseAdMob.instance.initialize(
      appId: 'ca-app-pub-9964647684084048~8914317121',
    );
    _bannerAd = createBannerAd()..load()..show();
  }

  @override
  void dispose() { 
    _bannerAd.dispose();
    super.dispose();
  }

  final DbTripsManager dbmanager = new DbTripsManager();

  int members;
  int id;
  String tripName;
  
  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  String user4Name;
  String user5Name;
  String user6Name;
  String user7Name;
  String user8Name;
  
  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  double user4Spent;
  double user5Spent;
  double user6Spent;
  double user7Spent;
  double user8Spent;
  
  String expense0;
  String expense1;
  String expense2;
  String expense3;
  String expense4;
  String expense5;
  String expense6;
  String expense7;
  String expense8;

  String expenseName;
  double expensePrice;
  TextEditingController expenseNameDialog = new TextEditingController();
  TextEditingController expensePriceDialog = new TextEditingController();


  _CalculationPage9State(
    this.id,
    this.members,
    this.tripName,
    
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,
    this.user4Name,
    this.user5Name,
    this.user6Name,
    this.user7Name,
    this.user8Name,


    this.user0Spent,    
    this.user1Spent,    
    this.user2Spent,    
    this.user3Spent,
    this.user4Spent,
    this.user5Spent,
    this.user6Spent,
    this.user7Spent,
    this.user8Spent,

    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
    this.expense5,
    this.expense6,
    this.expense7,
    this.expense8,
  );





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "Pinnacle",
        home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
      body: SingleChildScrollView(
                child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: HeaderData(user0Spent: user0Spent, user1Spent: user1Spent,user2Spent: user2Spent,user3Spent: user3Spent,user4Spent: user4Spent,user5Spent: user5Spent,user6Spent: user6Spent,user7Spent: user7Spent,user8Spent: user8Spent,user9Spent: 0,),
          ),
          
//User INFO
          SingleChildScrollView(
                        child: Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                ),
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 20.0,
                        ),
                  child: Column(
                   
                    children: <Widget>[
                      Column(
                        children: <Widget>[
//greeting text
                         TripNameHeading(tripName: tripName,),

                        Column(children: <Widget>[
                          
                   
              ExpandTile(userNumber: 0, userName: user0Name, userSpent: user0Spent, expense: expense0, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20),

              ExpandTile(userNumber: 1, userName: user1Name, userSpent: user1Spent, expense: expense1, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 2, userName: user2Name, userSpent: user2Spent, expense: expense2, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 3, userName: user3Name, userSpent: user3Spent, expense: expense3, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 4, userName: user4Name, userSpent: user4Spent, expense: expense4, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 5, userName: user5Name, userSpent: user5Spent, expense: expense5, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 6, userName: user6Name, userSpent: user6Spent, expense: expense6, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),    

              ExpandTile(userNumber: 7, userName: user7Name, userSpent: user7Spent, expense: expense7, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,), 

              ExpandTile(userNumber: 8, userName: user8Name, userSpent: user8Spent, expense: expense8, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 60,),

                          Container(
                            width: 200,
                            height: 75,
                            
                            child: CalculationButton(tripName: tripName,members: 9,user0Name: user0Name, user0Spent: user0Spent, user1Name: user1Name, user1Spent: user1Spent, user2Name: user2Name, user2Spent: user2Spent, user3Name: user3Name, user3Spent: user3Spent, user4Name: user4Name, user4Spent: user4Spent,user5Name: user5Name,user5Spent: user5Spent,user6Name: user6Name,user6Spent: user6Spent,user7Name: user7Name,user7Spent: user7Spent,user8Name: user8Name,user8Spent: user8Spent,),
                          ),

                          SizedBox(height: 80,),
                        ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ]),
      ),
    )));
  }
}

// ignore: must_be_immutable
class CalculationPage10 extends StatefulWidget {
  int members;
  int id;
  String tripName;

  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  String user4Name;
  String user5Name;
  String user6Name;
  String user7Name;
  String user8Name;
  String user9Name;

  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  double user4Spent;
  double user5Spent;
  double user6Spent;
  double user7Spent;
  double user8Spent;
  double user9Spent;

  String expense0;
  String expense1;
  String expense2;
  String expense3;
  String expense4;
  String expense5;
  String expense6;
  String expense7;
  String expense8;
  String expense9;

  CalculationPage10({
    this.id,
    this.members,
    this.tripName,
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,
    this.user4Name,
    this.user5Name,
    this.user6Name,
    this.user7Name,
    this.user8Name,
    this.user9Name,
    this.user0Spent,
    this.user1Spent,
    this.user2Spent,
    this.user3Spent,
    this.user4Spent,
    this.user5Spent,
    this.user6Spent,
    this.user7Spent,
    this.user8Spent,
    this.user9Spent,
    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
    this.expense5,
    this.expense6,
    this.expense7,
    this.expense8,
    this.expense9,
  });

  @override
  _CalculationPage10State createState() => _CalculationPage10State(
        id,
        members,
        tripName,
        user0Name,
        user1Name,
        user2Name,
        user3Name,
        user4Name,
        user5Name,
        user6Name,
        user7Name,
        user8Name,
        user9Name,
        user0Spent,
        user1Spent,
        user2Spent,
        user3Spent,
        user4Spent,
        user5Spent,
        user6Spent,
        user7Spent,
        user8Spent,
        user9Spent,
        expense0,
        expense1,
        expense2,
        expense3,
        expense4,
        expense5,
        expense6,
        expense7,
        expense8,
        expense9,
      );
}
class _CalculationPage10State extends State<CalculationPage10> {


  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Travel','Money','Shopping'],    
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd(){
    return BannerAd(
      adUnitId: 'ca-app-pub-1272009777215327/6505584120',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print('BannerAD $event');
      }
    );
  }

   @override
  void initState() {    
    super.initState();
    FirebaseAdMob.instance.initialize(
      appId: 'ca-app-pub-9964647684084048~8914317121',
    );
    _bannerAd = createBannerAd()..load()..show();
  }

  @override
  void dispose() { 
    _bannerAd.dispose();
    super.dispose();
  }

  final DbTripsManager dbmanager = new DbTripsManager();

  int members;
  int id;
  String tripName;

  String user0Name;
  String user1Name;
  String user2Name;
  String user3Name;
  String user4Name;
  String user5Name;
  String user6Name;
  String user7Name;
  String user8Name;
  String user9Name;

  double user0Spent;
  double user1Spent;
  double user2Spent;
  double user3Spent;
  double user4Spent;
  double user5Spent;
  double user6Spent;
  double user7Spent;
  double user8Spent;
  double user9Spent;

  String expense0;
  String expense1;
  String expense2;
  String expense3;
  String expense4;
  String expense5;
  String expense6;
  String expense7;
  String expense8;
  String expense9;

  String expenseName;
  double expensePrice;
  TextEditingController expenseNameDialog = new TextEditingController();
  TextEditingController expensePriceDialog = new TextEditingController();

  
  _CalculationPage10State(
    this.id,
    this.members,
    this.tripName,
    this.user0Name,
    this.user1Name,
    this.user2Name,
    this.user3Name,
    this.user4Name,
    this.user5Name,
    this.user6Name,
    this.user7Name,
    this.user8Name,
    this.user9Name,
    this.user0Spent,
    this.user1Spent,
    this.user2Spent,
    this.user3Spent,
    this.user4Spent,
    this.user5Spent,
    this.user6Spent,
    this.user7Spent,
    this.user8Spent,
    this.user9Spent,
    this.expense0,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
    this.expense5,
    this.expense6,
    this.expense7,
    this.expense8,
    this.expense9,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "Pinnacle",
        home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
      body: SingleChildScrollView(
                child: Column(
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: HeaderData(user0Spent: user0Spent, user1Spent: user1Spent,user2Spent: user2Spent,user3Spent: user3Spent,user4Spent: user4Spent,user5Spent: user5Spent,user6Spent: user6Spent,user7Spent: user7Spent,user8Spent: user8Spent,user9Spent: user9Spent,),
          ),
         
//User INFO
          SingleChildScrollView(
                        child: Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                ),
               
                decoration: BoxDecoration(
                  color: Colors.white,
                  
                  
                ),
                child: Padding(
                  padding:EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 20.0,
                        ),
                  child: Column(
                    
                    children: <Widget>[
                      Column(
                        children: <Widget>[
//greeting text
                          TripNameHeading(tripName: tripName,),

                          Column(children: <Widget>[
                   
              ExpandTile(userNumber: 0, userName: user0Name, userSpent: user0Spent, expense: expense0, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20),

              ExpandTile(userNumber: 1, userName: user1Name, userSpent: user1Spent, expense: expense1, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 2, userName: user2Name, userSpent: user2Spent, expense: expense2, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 3, userName: user3Name, userSpent: user3Spent, expense: expense3, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 4, userName: user4Name, userSpent: user4Spent, expense: expense4, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 5, userName: user5Name, userSpent: user5Spent, expense: expense5, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),

              ExpandTile(userNumber: 6, userName: user6Name, userSpent: user6Spent, expense: expense6, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),    

              ExpandTile(userNumber: 7, userName: user7Name, userSpent: user7Spent, expense: expense7, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,), 

              ExpandTile(userNumber: 8, userName: user8Name, userSpent: user8Spent, expense: expense8, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 20,),         

              ExpandTile(userNumber: 9, userName: user9Name, userSpent: user9Spent, expense: expense9, expenseNameDialog: expenseNameDialog, expensePriceDialog: expensePriceDialog, expenseName: expenseName, expensePrice: expensePrice, dbmanager: dbmanager, id: id, members: members, tripName: tripName),
              SizedBox(height: 60,),

                          Container(
                            width: 200,
                            height: 75,
                            
                            child: CalculationButton(tripName: tripName,members:10,user0Name: user0Name, user0Spent: user0Spent, user1Name: user1Name, user1Spent: user1Spent, user2Name: user2Name, user2Spent: user2Spent, user3Name: user3Name, user3Spent: user3Spent, user4Name: user4Name, user4Spent: user4Spent,user5Name: user5Name,user5Spent: user5Spent,user6Name: user6Name,user6Spent: user6Spent,user7Name: user7Name,user7Spent: user7Spent,user8Name: user8Name,user8Spent: user8Spent,user9Name: user9Name,user9Spent: user9Spent,),
                          ),

                          SizedBox(height: 80,),
                          
                          
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ]),
      ),
    )));
  }
}





