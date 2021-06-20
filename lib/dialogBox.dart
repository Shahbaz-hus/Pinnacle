import 'package:flutter/material.dart';
import 'dart:math';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'D4797B9122D1BA1F0BA7C8F3EFE59831';


class DetailsDialog extends StatefulWidget {
  const DetailsDialog({
    Key key,
    // ignore: non_constant_identifier_names
    @required this.final_remarks,
    @required this.message,
  }) : super(key: key);

  // ignore: non_constant_identifier_names
  final String final_remarks;
  final String message;

  @override
  _DetailsDialogState createState() => _DetailsDialogState();
}

class _DetailsDialogState extends State<DetailsDialog> with SingleTickerProviderStateMixin{

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







  AnimationController controller;
  
  Animation animation;

  String currency = '';
  getCurrency() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currency = prefs.getString('currency');
    });
  }

  void share(BuildContext context) {
      final RenderBox box = context.findRenderObject();
      final String text = widget.message;
        Share.share(text,sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }

  

  

  @override
  void initState() {    
    super.initState();
    getCurrency();
    controller = AnimationController(        
      duration: Duration(milliseconds: 400 ),
      vsync: this, 
      upperBound: 2*pi,
    );
    
   

    controller.forward();
   
    controller.addListener(() {
      setState(() {
        
      });
    });

  }

  @override
  void dispose() {
    controller.dispose();
    _interstitialAd.dispose();
    super.dispose();
  }

  


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           theme: ThemeData(fontFamily: 'DIN-LIGHT'),
          home: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.28).animate(controller),
                child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: controller.value * 8,
                child: Icon(
                  Icons.check,
                  color:Colors.white,
                  size: controller.value * 8,
                  ),
                ),
          ),
          Dialog(
            backgroundColor: Color(0xFF8A80F9),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)), //this right here
  child: ConstrainedBox(
    constraints: BoxConstraints(  
      minHeight: 200,
      maxHeight: 400,
    ),
      child: Container(
   
    width: 300.0,
    decoration: BoxDecoration(  
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFF8A80F9),
    ),
    

    child: Padding(
            padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
            child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Padding(
                    padding: EdgeInsets.only(left:15.0,top:15,right: 15),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: (widget.final_remarks=='')?Text(
                            'Trying to test our app?😜 \n\nPlease add some data to split.', 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                              ):                       
                          
                          Text(
                            '${widget.final_remarks}', 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                              ),
                            ),
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(top:10,left: 15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[

                        Container(
                          height: 45,
                          child: FlatButton(
                            onPressed: (){       
                            createInterstitialAd()..load()..show();            
                            Navigator.of(context).pop();
                          },
                          color: Colors.white,
                              child: Text('Got It!', style: TextStyle(color: Color(0xFF8A80F9), fontSize: 18.0),)),
                        ),

                       SizedBox(width: 30,),
                            
                        Flexible(
                                                  child: Container(
                                                    height: 45,
                                                    child: FlatButton(  

                            color: Colors.white,
                            child: Text('Tell your friends', style: TextStyle(color: Color(0xFF8A80F9), fontSize: 14.0),),
                            onPressed: () => share(context),
                            

                          ),
                                                  ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    ),
            ),
  ),
),
        ],
      ),
    );

    
  }
}