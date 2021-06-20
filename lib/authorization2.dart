import 'package:expensewhat/dbmanager.dart';
import 'package:flutter/material.dart';
import 'Authorization.dart';
import 'package:firebase_admob/firebase_admob.dart';


const String testDevice = 'D4797B9122D1BA1F0BA7C8F3EFE59831';




// ignore: must_be_immutable
class Auth2 extends StatefulWidget {
  int members;
  Auth2({  
    this.members,
  });
  @override
  _Auth2State createState() => _Auth2State(
    members,
  );
}

class _Auth2State extends State<Auth2> {
//==========================================INSTANCES=====================================================================
  final DbTripsManager dbmanager = new DbTripsManager();
  int members;

  _Auth2State(  
    this.members,
  );


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

  





//==========================================INSTANCES=====================================================================

//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



//==========================================VARIABLES=====================================================================

  String tripname = "";
  String member0name = "";
  String member1name = "";
  String member2name = "";
  String member3name = "";
  String member4name = "";
  String member5name = "";
  String member6name = "";
  String member7name = "";
  String member8name = "";
  String member9name = "";
  TextEditingController tripnameController = TextEditingController();
  TextEditingController member0nameController = TextEditingController();
  TextEditingController member1nameController = TextEditingController();
  TextEditingController member2nameController = TextEditingController();
  TextEditingController member3nameController = TextEditingController();
  TextEditingController member4nameController = TextEditingController();
  TextEditingController member5nameController = TextEditingController();
  TextEditingController member6nameController = TextEditingController();
  TextEditingController member7nameController = TextEditingController();
  TextEditingController member8nameController = TextEditingController();
  TextEditingController member9nameController = TextEditingController();
  
  int x;

//==========================================VARIABLES=====================================================================

//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



//==========================================FUNCTIONS=====================================================================




//==========================================FUNCTIONS=====================================================================


//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



//==========================================CLASSES=====================================================================


Trips trips;


//==========================================CLASSES=====================================================================

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
  // ignore: missing_return
  Widget build(BuildContext context) {
    if(members == 2){
      return Authorization(members: members,tripnameController: tripnameController, member0nameController: member0nameController, member0name: member0name, member1nameController: member1nameController, member1name: member1name);
    }
    else if(members == 3){
      return Authorization(members: members,tripnameController: tripnameController, member0nameController: member0nameController, member0name: member0name, member1nameController: member1nameController, member1name: member1name,member2nameController: member2nameController, member2name: member2name);
    }
    else if(members == 4){
      return Authorization(members: members,tripnameController: tripnameController, member0nameController: member0nameController, member0name: member0name, member1nameController: member1nameController, member1name: member1name,member2nameController: member2nameController, member2name: member2name,member3nameController: member3nameController, member3name: member3name);
    }

    else if(members == 5){
      return Authorization(members: members,tripnameController: tripnameController, member0nameController: member0nameController, member0name: member0name, member1nameController: member1nameController, member1name: member1name,member2nameController: member2nameController, member2name: member2name,member3nameController: member3nameController, member3name: member3name, member4nameController: member4nameController, member4name: member4name);
    }

    else if(members == 6){
      return Authorization(members: members,tripnameController: tripnameController, member0nameController: member0nameController, member0name: member0name, member1nameController: member1nameController, member1name: member1name,member2nameController: member2nameController, member2name: member2name,member3nameController: member3nameController, member3name: member3name, member4nameController: member4nameController, member4name: member4name,member5nameController: member5nameController, member5name: member5name);
    }

    else if(members == 7){
      return Authorization(members: members,tripnameController: tripnameController, member0nameController: member0nameController, member0name: member0name, member1nameController: member1nameController, member1name: member1name,member2nameController: member2nameController, member2name: member2name,member3nameController: member3nameController, member3name: member3name, member4nameController: member4nameController, member4name: member4name,member5nameController: member5nameController, member5name: member5name,member6nameController: member6nameController, member6name: member6name);
    }

    else if(members == 8){
      return Authorization(members: members,tripnameController: tripnameController, member0nameController: member0nameController, member0name: member0name, member1nameController: member1nameController, member1name: member1name,member2nameController: member2nameController, member2name: member2name,member3nameController: member3nameController, member3name: member3name, member4nameController: member4nameController, member4name: member4name,member5nameController: member5nameController, member5name: member5name,member6nameController: member6nameController, member6name: member6name,member7nameController: member7nameController, member7name: member7name);
    }

    else if(members == 9){
      return Authorization(members: members,tripnameController: tripnameController, member0nameController: member0nameController, member0name: member0name, member1nameController: member1nameController, member1name: member1name,member2nameController: member2nameController, member2name: member2name,member3nameController: member3nameController, member3name: member3name, member4nameController: member4nameController, member4name: member4name,member5nameController: member5nameController, member5name: member5name,member6nameController: member6nameController, member6name: member6name,member7nameController: member7nameController, member7name: member7name,member8nameController: member8nameController, member8name: member8name);
    }

    else if(members == 10){
      return Authorization(members: members,tripnameController: tripnameController, member0nameController: member0nameController, member0name: member0name, member1nameController: member1nameController, member1name: member1name,member2nameController: member2nameController, member2name: member2name,member3nameController: member3nameController, member3name: member3name, member4nameController: member4nameController, member4name: member4name,member5nameController: member5nameController, member5name: member5name,member6nameController: member6nameController, member6name: member6name,member7nameController: member7nameController, member7name: member7name,member8nameController: member8nameController, member8name: member8name,member9nameController: member9nameController, member9name: member9name);
    }

    
  }

  
}

