import 'package:expensewhat/calculationPage.dart';
import 'package:expensewhat/updatePage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'new_trip_member_count.dart';
import 'custom_paint.dart';
import 'splash_screen.dart';
import 'login_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'dbmanager.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/async.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'D4797B9122D1BA1F0BA7C8F3EFE59831';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool check = prefs.containsKey('name');


  Hive.init(appDocumentDir.path);
  runApp(MyHomePage(CheckValue: check,));


  
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  
  // ignore: non_constant_identifier_names
  bool CheckValue;
  
  MyHomePage({
    // ignore: non_constant_identifier_names
    this.CheckValue,
  });
  @override
  _MyHomePageState createState() => _MyHomePageState(
    CheckValue,
  );
}

class _MyHomePageState extends State<MyHomePage> {

  // ignore: non_constant_identifier_names
  bool CheckValue;

  _MyHomePageState(
    this.CheckValue,
  );
  
  final DbTripsManager dbmanager = new DbTripsManager();
  
  @override
  Widget build(BuildContext context) {
    

 
    return MaterialApp(
        title: "Pinnacle",
        debugShowCheckedModeBanner: false,
        home:FutureBuilder(
      future: Hive.openBox('localNameBox'),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else { 

            
            if(CheckValue){
              return Page0();
            }
            else{
              return LoginPage();
            }
            
          }
        } else {
          return SplashScreen();
        }
      }),
      );
    
  }
}

class Page0 extends StatefulWidget {
  @override
  _Page0State createState() => _Page0State();
}

class _Page0State extends State<Page0> {
  
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


  final DbTripsManager dbmanager = new DbTripsManager();
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  Trips trips;
  List<Trips> tripslist;
  double _totalAll;
  List<Color> colorList =[          
   
        Color(0xFF249782),  
        Color(0xFF13151B),         
                 
      ];
  
  String name = '';
  int avatar = 0;
  String currency = '';
  
  

  getPrefData(){
    return this._memoizer.runOnce(() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double tot = await dbmanager.getTotalAll();

    setState(() {
      name = prefs.getString('name');
      avatar = prefs.getInt('avatar');
      _totalAll = tot;
      currency = prefs.getString('currency');

    });

    return 'REMOTE DATA';
  });
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


  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
          title: "Pinnacle",
          home: SafeArea(
            child: Scaffold(
              

                
                  drawer: Drawer(
                           
                            child: Container(
                              color: Color(0xFF101D33).withOpacity(0.96),                             
                                                          
                              child: 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  
                                  children: <Widget>[
                                    Container(
                                      color: Color(0xFF101D33),
                                      child: DrawerHeader(
                                          child: Column(  
                                      children: <Widget>[
                                        
                                        CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          radius: 40,
                                          backgroundImage:
                                        AssetImage('assets/images/$avatar.png'),
                                          ),

                                          SizedBox(height: 20),

                                        Flexible(
                                                                              child: Text(
                                      '$name',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(  
                                        
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),

                                      ),
                                        ),


                                      ],
                                          ),

                                          
                                        ),
                                    ),

                                    SizedBox(height: 20),
                                    

                                    Padding(
                                           padding: const EdgeInsets.all(5.0),
                                           child: ListTile(
                                                leading: Icon(Icons.add_circle_outline,color:Colors.white),
                                                title: Text("Edit profile",style: TextStyle(color: Colors.white,fontSize: 20)),
                                                
                                                onTap: () {                                            
                                                  Navigator.push(context,MaterialPageRoute(builder: (context) => UpdatePage()),);
                                                },
                                              ),
                                         ),  

                                  


                                    
                                                                                                          
                                  ],
                                ),
                                
                              
                            ),
                          ),

                  body: FutureBuilder(
                      future: getPrefData(),
                      builder: (context, snapshot){
                        if(snapshot.data != null){
                          return Container(
                            color: Colors.white,
           
            child: SingleChildScrollView(
                      child: Column(
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
                      
                      Builder(
              builder: (BuildContext context) {
                return IconButton(
                      icon: const Icon(Icons.menu,color: Colors.black,size: 35,),
                      onPressed: () {
            Scaffold.of(context).openDrawer();
                      },
                      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
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
              height: 30.0,
              ),

              //User INFO
              ConstrainedBox(
                constraints: BoxConstraints(  
                        minHeight: 230,
                  ),
            child: CustomPaint(
              painter: InfoCard(),
                        child: Container(
              
              width: 325,            
              decoration: BoxDecoration(
              color: Color(0xFF249782),
                  
                  borderRadius: BorderRadius.all(
                       Radius.circular(15.0),
                  ),

           
              ),
              
              
              //Custom paint was causing some issue
              child: CustomPaint(
                painter: InfoCard(),
                            child: Column(
                
                children: <Widget>[
                    Padding(            
                      padding: const EdgeInsets.only(top:10.0),
                      child: Column(
                    children: <Widget>[

                    
                    
                    Padding(
                        padding: const EdgeInsets.only(right:15.0,left: 15),
                        child: Row(
                          
                          children: <Widget>[
                            
                            Text(
                            'Total expenses',
                            style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            ),
                            ),

                           

                            
                          ],
                        ),
                    ),

                    Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Row(  
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                      padding: const EdgeInsets.only(left:25.0,top: 12),
                      child: _totalAll==null ? Text('Loading...',style: TextStyle(color: Colors.white,fontFamily: 'DIN-LIGHT',fontWeight: FontWeight.bold,fontSize: 40,),) : Text('$currency$_totalAll',style: TextStyle(color: Colors.white,fontFamily: 'DIN-LIGHT',fontWeight: FontWeight.bold,fontSize: 40,),),
                            ),

                             Spacer(),

                CircleAvatar(  
                    radius: 20,
                    backgroundColor: Color(0xFF249782),
                    backgroundImage: AssetImage('assets/images/$avatar.png'),
                ),
                            
                          ],
                        ),
                    ),

                    Container(
                        width: 250,
                        child: Divider(  
                          color: Colors.white,
                        ),
                    ),

                    Padding(
                        padding: const EdgeInsets.only(left:25,right: 15,top: 20,bottom: 15),
                        child: Row(  
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                
                Text(  
                '$name',
                     
                style: TextStyle(  
                      fontFamily: 'SOURCE-CODE',
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      
                      color: Colors.white,
                ),
                ),

                
                             
                          ],
                            ),
                    ),

                     
                    
                     
                    ],
                        ),
                    ),
                 
                    
                ],
                ),
              ),
                  ),
            ),
            ),

                SizedBox(height: 40,),

              

              SingleChildScrollView(
                      child: Stack(
            children: <Widget>[               
                      
                      
                      
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:15.0),
                        child: Container(

            margin: EdgeInsets.only(
              top: 75.0,
            ),
            
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(  
                top: BorderSide(  
                  color: Colors.black,
                )
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
              Padding(
                padding: const EdgeInsets.only(
                        top: 30.0,
                ),
                child: Column(
                        children: <Widget>[
                //greeting text
               

                SizedBox(
                        height: 60.0,
                ),
                //app work
                
                Container(
                        child: Row(
              children: <Widget>[
              Flexible(
               child: Text(
              'Split your expenses with your friends. Click on New trip to start.',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
            ),
              ),
              ],
                        ),
                ),

                SizedBox(
                        height: 30.0,
                ),

                //add button
                Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                        

                        Container(
              height: 80,
              width: 250,
              decoration: BoxDecoration(  
              color: Color(0xFF13151B),
            borderRadius: BorderRadius.all(
              Radius.circular(10)),
            
                     
              ),
              child: FlatButton(
            shape: RoundedRectangleBorder(
              
            ),
            
            child: new Text('New Trip',
                style: new TextStyle(
              fontSize: 25.0, color: Colors.white)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
              builder: (context) => NewTrip()),
              );
            },
              ),
              ),
                 
                        
                ]),

                SizedBox(
                        height: 50,
                ),

                Row(
                        children: <Widget>[
              Text(
            'RECENT TRIPS',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 30,
            ),
              ),
                        ],
                ),

                SizedBox(
                        height: 20,
                ),

                FutureBuilder(
              future: dbmanager.getTripsList(),                    
              builder: (context, snapshot) {
            
            if (snapshot.hasData){
            
            tripslist = snapshot.data;                               
            dbmanager.getTripsNumber();
            
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount:
                        tripslist == null ? 0 : tripslist.length,
              itemBuilder:
                // ignore: missing_return
                (BuildContext context, int index) {
                Trips tp = tripslist[index];
                
               
                //getting number of members
                int members = tp.members; 
                if(tp.id != 0){
                return Column(
                children: <Widget>[
                 
                 //swipe to delete
                        Dismissible(
            
            key: Key(tp.toString()),

            confirmDismiss: (DismissDirection direction) {
                return  showDialog(
                        context: context,
                        barrierDismissible:
            true, // user must tap button!
                        builder: (BuildContext context) {
              return AlertDialog(
            title:
                Text('Delete this trip'),
            content:
                SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                        Text(
                        'Are you sure you want to delete this trip?'),
                ],
              ),
            ),
            actions: <Widget>[
              
              FlatButton(
                child: Text('No'),
                onPressed: () {
                        Navigator.of(context)
                        .pop(false);
                },
              ),

              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                        setState(() {
            dbmanager.deleteTrips(tp.id);
            tripslist.removeAt(index);
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page0()),
  );
                         });
                },
              ),
            ],
              );
                        },
                );

            },

            background: Container(
                
                color: Colors.redAccent,
                child: Icon(Icons.delete,color: Colors.white,size: 50,),
            ),


            
            child: GestureDetector(

                        

                        onTap: ()async{


              if(members == 2){
            String user0Name = await dbmanager.getUser0Name(tp.id);
            String user1Name = await dbmanager.getUser1Name(tp.id);
            
            String user0Expenses = await dbmanager.getExpense0List(tp.id);
            String user1Expenses = await dbmanager.getExpense1List(tp.id);
            

                         
            double total0 = await dbmanager.getTotal0(tp.id);
            double total1 = await dbmanager.getTotal1(tp.id);
            

              

              Navigator.push(context, MaterialPageRoute(builder: (context) => CalculationPage2(id: tp.id,members: members,expense1: user1Expenses,expense0: user0Expenses,tripName: tp.tripName,user0Name: user0Name,user0Spent: total0,user1Name: user1Name,user1Spent: total1)),);

              }

              else if(members == 3){
            String user0Name = await dbmanager.getUser0Name(tp.id);
            String user1Name = await dbmanager.getUser1Name(tp.id);
            String user2Name = await dbmanager.getUser2Name(tp.id);

            String user0Expenses = await dbmanager.getExpense0List(tp.id);
            String user1Expenses = await dbmanager.getExpense1List(tp.id);
            String user2Expenses = await dbmanager.getExpense2List(tp.id);


                         
            double total0 = await dbmanager.getTotal0(tp.id);
            double total1 = await dbmanager.getTotal1(tp.id);
            double total2 = await dbmanager.getTotal2(tp.id);

              

              Navigator.push(context, MaterialPageRoute(builder: (context) => CalculationPage3(id: tp.id,members: members,tripName: tp.tripName,user0Name: user0Name,expense0: user0Expenses,expense1: user1Expenses,expense2: user2Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,user2Name: user2Name,user2Spent: total2,)),);


              
              }

              else if(members ==4){
            String user0Name = await dbmanager.getUser0Name(tp.id);
            String user1Name = await dbmanager.getUser1Name(tp.id);
            String user2Name = await dbmanager.getUser2Name(tp.id);
            String user3Name = await dbmanager.getUser3Name(tp.id);

            String user0Expenses = await dbmanager.getExpense0List(tp.id);
            String user1Expenses = await dbmanager.getExpense1List(tp.id);
            String user2Expenses = await dbmanager.getExpense2List(tp.id);
            String user3Expenses = await dbmanager.getExpense3List(tp.id);



            double total0 = await dbmanager.getTotal0(tp.id);
            double total1 = await dbmanager.getTotal1(tp.id);
            double total2 = await dbmanager.getTotal2(tp.id);
            double total3 = await dbmanager.getTotal3(tp.id);

            

            Navigator.push(context, MaterialPageRoute(builder: (context) => CalculationPage4(id: tp.id,members: members,tripName: tp.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses)),);

            

              }

              else if(members ==5){
            String user0Name = await dbmanager.getUser0Name(tp.id);
            String user1Name = await dbmanager.getUser1Name(tp.id);
            String user2Name = await dbmanager.getUser2Name(tp.id);
            String user3Name = await dbmanager.getUser3Name(tp.id);
            String user4Name = await dbmanager.getUser4Name(tp.id);

            String user0Expenses = await dbmanager.getExpense0List(tp.id);
            String user1Expenses = await dbmanager.getExpense1List(tp.id);
            String user2Expenses = await dbmanager.getExpense2List(tp.id);
            String user3Expenses = await dbmanager.getExpense3List(tp.id);
            String user4Expenses = await dbmanager.getExpense4List(tp.id);



            double total0 = await dbmanager.getTotal0(tp.id);
            double total1 = await dbmanager.getTotal1(tp.id);
            double total2 = await dbmanager.getTotal2(tp.id);
            double total3 = await dbmanager.getTotal3(tp.id);
            double total4 = await dbmanager.getTotal4(tp.id);

            

            Navigator.push(context, MaterialPageRoute(builder: (context) => CalculationPage5(id: tp.id,members: members,tripName: tp.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses,user4Name: user4Name,user4Spent: total4,expense4: user4Expenses,)),);

            

              }

              else if(members ==6){
            String user0Name = await dbmanager.getUser0Name(tp.id);
            String user1Name = await dbmanager.getUser1Name(tp.id);
            String user2Name = await dbmanager.getUser2Name(tp.id);
            String user3Name = await dbmanager.getUser3Name(tp.id);
            String user4Name = await dbmanager.getUser4Name(tp.id);
            String user5Name = await dbmanager.getUser5Name(tp.id);

            String user0Expenses = await dbmanager.getExpense0List(tp.id);
            String user1Expenses = await dbmanager.getExpense1List(tp.id);
            String user2Expenses = await dbmanager.getExpense2List(tp.id);
            String user3Expenses = await dbmanager.getExpense3List(tp.id);
            String user4Expenses = await dbmanager.getExpense4List(tp.id);
            String user5Expenses = await dbmanager.getExpense5List(tp.id);



            double total0 = await dbmanager.getTotal0(tp.id);
            double total1 = await dbmanager.getTotal1(tp.id);
            double total2 = await dbmanager.getTotal2(tp.id);
            double total3 = await dbmanager.getTotal3(tp.id);
            double total4 = await dbmanager.getTotal4(tp.id);
            double total5 = await dbmanager.getTotal5(tp.id);

            

            Navigator.push(context, MaterialPageRoute(builder: (context) => CalculationPage6(id: tp.id,members: members,tripName: tp.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses,user4Name: user4Name,user4Spent: total4,expense4: user4Expenses, user5Name:user5Name,user5Spent: total5,expense5: user5Expenses,)),);

            

              }

              else if(members ==7){
            String user0Name = await dbmanager.getUser0Name(tp.id);
            String user1Name = await dbmanager.getUser1Name(tp.id);
            String user2Name = await dbmanager.getUser2Name(tp.id);
            String user3Name = await dbmanager.getUser3Name(tp.id);
            String user4Name = await dbmanager.getUser4Name(tp.id);
            String user5Name = await dbmanager.getUser5Name(tp.id);
            String user6Name = await dbmanager.getUser6Name(tp.id);

            String user0Expenses = await dbmanager.getExpense0List(tp.id);
            String user1Expenses = await dbmanager.getExpense1List(tp.id);
            String user2Expenses = await dbmanager.getExpense2List(tp.id);
            String user3Expenses = await dbmanager.getExpense3List(tp.id);
            String user4Expenses = await dbmanager.getExpense4List(tp.id);
            String user5Expenses = await dbmanager.getExpense5List(tp.id);
            String user6Expenses = await dbmanager.getExpense6List(tp.id);



            double total0 = await dbmanager.getTotal0(tp.id);
            double total1 = await dbmanager.getTotal1(tp.id);
            double total2 = await dbmanager.getTotal2(tp.id);
            double total3 = await dbmanager.getTotal3(tp.id);
            double total4 = await dbmanager.getTotal4(tp.id);
            double total5 = await dbmanager.getTotal5(tp.id);
            double total6 = await dbmanager.getTotal6(tp.id);

            

            Navigator.push(context, MaterialPageRoute(builder: (context) => CalculationPage7(id: tp.id,members: members,tripName: tp.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses,user4Name: user4Name,user4Spent: total4,expense4: user4Expenses, user5Name:user5Name,user5Spent: total5,expense5: user5Expenses,user6Name: user6Name,user6Spent: total6,expense6: user6Expenses,)),);

            

              }

              else if(members ==8){
            String user0Name = await dbmanager.getUser0Name(tp.id);
            String user1Name = await dbmanager.getUser1Name(tp.id);
            String user2Name = await dbmanager.getUser2Name(tp.id);
            String user3Name = await dbmanager.getUser3Name(tp.id);
            String user4Name = await dbmanager.getUser4Name(tp.id);
            String user5Name = await dbmanager.getUser5Name(tp.id);
            String user6Name = await dbmanager.getUser6Name(tp.id);
            String user7Name = await dbmanager.getUser7Name(tp.id);

            String user0Expenses = await dbmanager.getExpense0List(tp.id);
            String user1Expenses = await dbmanager.getExpense1List(tp.id);
            String user2Expenses = await dbmanager.getExpense2List(tp.id);
            String user3Expenses = await dbmanager.getExpense3List(tp.id);
            String user4Expenses = await dbmanager.getExpense4List(tp.id);
            String user5Expenses = await dbmanager.getExpense5List(tp.id);
            String user6Expenses = await dbmanager.getExpense6List(tp.id);
            String user7Expenses = await dbmanager.getExpense7List(tp.id);



            double total0 = await dbmanager.getTotal0(tp.id);
            double total1 = await dbmanager.getTotal1(tp.id);
            double total2 = await dbmanager.getTotal2(tp.id);
            double total3 = await dbmanager.getTotal3(tp.id);
            double total4 = await dbmanager.getTotal4(tp.id);
            double total5 = await dbmanager.getTotal5(tp.id);
            double total6 = await dbmanager.getTotal6(tp.id);
            double total7 = await dbmanager.getTotal7(tp.id);

            

            Navigator.push(context, MaterialPageRoute(builder: (context) => CalculationPage8(id: tp.id,members: members,tripName: tp.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses,user4Name: user4Name,user4Spent: total4,expense4: user4Expenses, user5Name:user5Name,user5Spent: total5,expense5: user5Expenses,user6Name: user6Name,user6Spent: total6,expense6: user6Expenses,user7Name: user7Name,user7Spent: total7, expense7: user7Expenses)),);

            

              }

              else if(members ==9){
            String user0Name = await dbmanager.getUser0Name(tp.id);
            String user1Name = await dbmanager.getUser1Name(tp.id);
            String user2Name = await dbmanager.getUser2Name(tp.id);
            String user3Name = await dbmanager.getUser3Name(tp.id);
            String user4Name = await dbmanager.getUser4Name(tp.id);
            String user5Name = await dbmanager.getUser5Name(tp.id);
            String user6Name = await dbmanager.getUser6Name(tp.id);
            String user7Name = await dbmanager.getUser7Name(tp.id);
            String user8Name = await dbmanager.getUser8Name(tp.id);

            String user0Expenses = await dbmanager.getExpense0List(tp.id);
            String user1Expenses = await dbmanager.getExpense1List(tp.id);
            String user2Expenses = await dbmanager.getExpense2List(tp.id);
            String user3Expenses = await dbmanager.getExpense3List(tp.id);
            String user4Expenses = await dbmanager.getExpense4List(tp.id);
            String user5Expenses = await dbmanager.getExpense5List(tp.id);
            String user6Expenses = await dbmanager.getExpense6List(tp.id);
            String user7Expenses = await dbmanager.getExpense7List(tp.id);
            String user8Expenses = await dbmanager.getExpense8List(tp.id);



            double total0 = await dbmanager.getTotal0(tp.id);
            double total1 = await dbmanager.getTotal1(tp.id);
            double total2 = await dbmanager.getTotal2(tp.id);
            double total3 = await dbmanager.getTotal3(tp.id);
            double total4 = await dbmanager.getTotal4(tp.id);
            double total5 = await dbmanager.getTotal5(tp.id);
            double total6 = await dbmanager.getTotal6(tp.id);
            double total7 = await dbmanager.getTotal7(tp.id);
            double total8 = await dbmanager.getTotal8(tp.id);

            

            Navigator.push(context, MaterialPageRoute(builder: (context) => CalculationPage9(id: tp.id,members: members,tripName: tp.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses,user4Name: user4Name,user4Spent: total4,expense4: user4Expenses, user5Name:user5Name,user5Spent: total5,expense5: user5Expenses,user6Name: user6Name,user6Spent: total6,expense6: user6Expenses,user7Name: user7Name,user7Spent: total7, expense7: user7Expenses,user8Name: user8Name,user8Spent: total8,expense8: user8Expenses,)),);

            

              }

              else if(members ==10){
            String user0Name = await dbmanager.getUser0Name(tp.id);
            String user1Name = await dbmanager.getUser1Name(tp.id);
            String user2Name = await dbmanager.getUser2Name(tp.id);
            String user3Name = await dbmanager.getUser3Name(tp.id);
            String user4Name = await dbmanager.getUser4Name(tp.id);
            String user5Name = await dbmanager.getUser5Name(tp.id);
            String user6Name = await dbmanager.getUser6Name(tp.id);
            String user7Name = await dbmanager.getUser7Name(tp.id);
            String user8Name = await dbmanager.getUser8Name(tp.id);
            String user9Name = await dbmanager.getUser9Name(tp.id);

            String user0Expenses = await dbmanager.getExpense0List(tp.id);
            String user1Expenses = await dbmanager.getExpense1List(tp.id);
            String user2Expenses = await dbmanager.getExpense2List(tp.id);
            String user3Expenses = await dbmanager.getExpense3List(tp.id);
            String user4Expenses = await dbmanager.getExpense4List(tp.id);
            String user5Expenses = await dbmanager.getExpense5List(tp.id);
            String user6Expenses = await dbmanager.getExpense6List(tp.id);
            String user7Expenses = await dbmanager.getExpense7List(tp.id);
            String user8Expenses = await dbmanager.getExpense8List(tp.id);
            String user9Expenses = await dbmanager.getExpense9List(tp.id);



            double total0 = await dbmanager.getTotal0(tp.id);
            double total1 = await dbmanager.getTotal1(tp.id);
            double total2 = await dbmanager.getTotal2(tp.id);
            double total3 = await dbmanager.getTotal3(tp.id);
            double total4 = await dbmanager.getTotal4(tp.id);
            double total5 = await dbmanager.getTotal5(tp.id);
            double total6 = await dbmanager.getTotal6(tp.id);
            double total7 = await dbmanager.getTotal7(tp.id);
            double total8 = await dbmanager.getTotal8(tp.id);
            double total9 = await dbmanager.getTotal9(tp.id);

            

            Navigator.push(context, MaterialPageRoute(builder: (context) => CalculationPage10(id: tp.id,members: members,tripName: tp.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses,user4Name: user4Name,user4Spent: total4,expense4: user4Expenses, user5Name:user5Name,user5Spent: total5,expense5: user5Expenses,user6Name: user6Name,user6Spent: total6,expense6: user6Expenses,user7Name: user7Name,user7Spent: total7, expense7: user7Expenses,user8Name: user8Name,user8Spent: total8,expense8: user8Expenses,user9Name: user9Name,user9Spent: total9,expense9: user9Expenses,)),);

            

              }

               
              

              
                         
                        },
                        
                        child: ConstrainedBox(
            constraints: BoxConstraints(  
              minHeight: 90,
            ),
              child: Container(
              
              decoration: BoxDecoration(
            color: colorList[index%2],
            borderRadius: BorderRadius.all(
                        Radius.circular(10)),

             boxShadow:  [
            BoxShadow(
              color: Color(0xFFF7F5FE),
              offset: Offset(10, 10), //(x,y)
              blurRadius: 6,
              
            ),
                        ],

            
              ),
              child: Column(
                        children: <Widget>[
                        Container(
                        
                        width:
            MediaQuery.of(context)
            .size
            .width,
                        child: SingleChildScrollView(
                        child: Column(
            children: <Widget>[
              SizedBox(
            height: 10,
              ),
              Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Flexible(
                                        child: Text(
                '${tp.tripName}',
                style: TextStyle(
              fontFamily: 'Museo',
              fontSize: 27.5,
              color: Colors.white,
              fontWeight:
                FontWeight
                        .bold,
                ),
                        ),
              ),
            ],
              ),


              

             

              SizedBox(height: 20,),

             

              Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:20,bottom: 20),
                child: Text(
              'Trip members: $members',
              style: TextStyle(
            fontFamily: 'DIN-LIGHT',
            color:Colors.white,
                        
            fontSize: 13,
            fontWeight: FontWeight.bold,
              ),
            ),
              ),
            ],
              ),
            ],
                        ),
                        ),
                        ),
                        ],
            ),
            ),
                        ),
            ),
                        ),

                        
                        SizedBox(
            height: 20,
                        ),
                ],
                        );
                }


                        
              },
            );
            }
            return CircularProgressIndicator();
              },
                        ),

                SizedBox(
                        height: 20,
                ),

                
                        ],
                ),
              ),
            ],
              ),
            ),
                        ),
                      ),

                      Align(  
            alignment: Alignment.center,
            child: ClipOval(
              child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 80,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 77.5,  
              backgroundImage: AssetImage('assets/images/$avatar.png'),
            ),
                ),
              ), 
                      ),
                 
                      
                      ]
            ),
              ),
                      ],
                ),
              ),
                      );
                        }
                        else{
                          return SplashScreen();
                        }
                      },
                                   
                  ),
                ),
      ),
    );
  }
}



