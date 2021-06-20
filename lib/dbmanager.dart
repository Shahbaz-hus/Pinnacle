import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';



class DbTripsManager{
  Database _database;


//=========================================STORING TRIP NAME=========================================================================

  Future openDb() async{
    if(_database == null){
       _database = await openDatabase(
      join(await getDatabasesPath(), "trips.db"),
      version: 1,
      onCreate: (Database db, int version) async{
        await db.execute("CREATE TABLE trips(id INTEGER,members INTEGER,tripName TEXT,expense TEXT,user0Name TEXT,user0Spent DOUBLE,user1Name TEXT,user1Spent DOUBLE,user2Name TEXT,user2Spent DOUBLE,user3Name TEXT,user3Spent DOUBLE,user4Name TEXT,user4Spent DOUBLE,user5Name TEXT,user5Spent DOUBLE,user6Name TEXT,user6Spent DOUBLE,user7Name TEXT,user7Spent DOUBLE,user8Name TEXT,user8Spent DOUBLE,user9Name TEXT,user9Spent DOUBLE)");        
        await db.rawQuery("INSERT INTO trips(id,members,tripName) VALUES(0,0,'Your trips' )");
        
        
      }

    );
    }
   
  }

//=========================================STORING TRIP NAME=========================================================================




//=========================================INSERT INTO A TRIP=========================================================================

   Future<int> insertTrips(Trips trips) async{
    await openDb();
    return await _database.insert('trips', trips.toMap()); //trips is table name
  }

//=========================================INSERT INTO A TRIP=========================================================================








//=========================================GET NUMBER OF TRIPS=========================================================================

  Future<int> getTripsNumber() async{
    await openDb();
    String x;
    String y;
    int z;
    final response = await _database.rawQuery('''SELECT MAX(id) FROM trips''');
    x = response.toString();    
    y = x.substring(11,x.length-2);
    
    z = int.parse(y);   
    return (z+1);

  }

//=========================================GET NUMBER OF TRIPS=========================================================================


//=========================================GET USER0 DETAILS=========================================================================

  Future<String> getUser0Name(int id) async{
    await openDb(); 
    String x; 
    String result;  
    
    
    final response = await _database.rawQuery(      
        "SELECT DISTINCT user0Name FROM trips where id == ? AND user0Name IS NOT NULL ",
        [id],  

    );

    x = response.toString(); 
     
    result = x.substring(13,x.length-2); 
    
    return result;
    
    
  }

  Future<double> getTotal0(int id) async{
    await openDb();
    String x;
    String fi;
    final total0 = await _database.rawQuery("SELECT SUM(user0Spent) FROM trips WHERE id =?",[id]);
    double total0D;
    x = total0.toString();
    fi = x.substring(19,x.length-2);
    total0D = double.parse(fi);    
    return total0D;
   
  }

  Future<double> getTotalAll() async{
    await openDb();
    String x;
    String fi;
    final totalAll = await _database.rawQuery('''SELECT sum(COALESCE(user0Spent,0)+ COALESCE(user1Spent,0)+ COALESCE(user2Spent,0)+ COALESCE(user3Spent,0)+ COALESCE(user4Spent,0)+ COALESCE(user5Spent,0)+ COALESCE(user6Spent,0)+ COALESCE(user7Spent,0)+ COALESCE(user8Spent,0)+ COALESCE(user9Spent,0))AS TOTAL FROM trips ''');
    double totalAllD;
    x = totalAll.toString();    
    fi = x.substring(9,x.length-2);    
    totalAllD = double.parse(fi);        
    return totalAllD;
   
  }

  Future<void> insert0Data(int id, int members,String tripName,String expense,String user0Name,double user0Spent) async{
    await openDb();
    await _database.rawQuery("INSERT INTO trips(id,members,tripName,expense,user0Name,user0Spent) VALUES (?,?,?,?,?,?)",[id,members,tripName,expense,user0Name,user0Spent],);
    
  }

  Future<String> getExpense0List(int id) async{
    await openDb();
    String x; 
    String result;
    final response = await _database.rawQuery(      
        "SELECT GROUP_CONCAT(expense) FROM trips where id == ? AND user0Name IS NOT NULL AND expense IS NOT NULL  ",
        [id],  

    );
    x = response.toString();     
    result = x.substring(25,x.length-2);      
    return result;  

  }

//=========================================GET USER0 DETAILS=========================================================================




  

  


//=========================================GET USER1 DETAILS=========================================================================


  Future<String> getUser1Name(int id) async{
    await openDb(); 
    String x; 
    String result;  
    
    
    final response = await _database.rawQuery(      
        "SELECT DISTINCT user1Name FROM trips where id == ? AND user1Name IS NOT NULL ",
        [id],  

    );

    x = response.toString(); 
     
    result = x.substring(13,x.length-2); 
    
    return result;
    
    
  }

  Future<double> getTotal1(int id) async{
    await openDb();
    String x;
    String fi;
    final total1 = await _database.rawQuery("SELECT SUM(user1Spent) FROM trips WHERE id =?",[id]);
    double total1D;
    x = total1.toString();
    fi = x.substring(19,x.length-2);
    total1D = double.parse(fi);    
    return total1D;
   
  }

  Future<void> insert1Data(int id, int members,String tripName,String expense,String user1Name,double user1Spent) async{
    await openDb();
    await _database.rawQuery("INSERT INTO trips(id,members,tripName,expense,user1Name,user1Spent) VALUES (?,?,?,?,?,?)",[id,members,tripName,expense,user1Name,user1Spent],);
    
  }

  Future<String> getExpense1List(int id) async{
    await openDb();
    String x; 
    String result;
    final response = await _database.rawQuery(      
        "SELECT GROUP_CONCAT(expense) FROM trips where id == ? AND user1Name IS NOT NULL AND expense IS NOT NULL  ",
        [id],  

    );
    x = response.toString();     
    result = x.substring(25,x.length-2);  
    return result;  

  }

//=========================================GET USER1 DETAILS=========================================================================




//=========================================GET USER2 DETAILS=========================================================================

  Future<String> getUser2Name(int id) async{
    await openDb(); 
    String x; 
    String result;  
    
    
    final response = await _database.rawQuery(      
        "SELECT DISTINCT user2Name FROM trips where id == ? AND user2Name IS NOT NULL ",
        [id],  

    );

    x = response.toString(); 
     
    result = x.substring(13,x.length-2); 
    
    return result;
    
    
  }

  Future<double> getTotal2(int id) async{
    await openDb();
    String x;
    String fi;
    final total2 = await _database.rawQuery("SELECT SUM(user2Spent) FROM trips WHERE id =?",[id]);
    double total2D;
    x = total2.toString();
    fi = x.substring(19,x.length-2);
    total2D = double.parse(fi);    
    return total2D;
   
  }

  Future<void> insert2Data(int id, int members,String tripName,String expense,String user2Name,double user2Spent) async{
    await openDb();
    await _database.rawQuery("INSERT INTO trips(id,members,tripName,expense,user2Name,user2Spent) VALUES (?,?,?,?,?,?)",[id,members,tripName,expense,user2Name,user2Spent],);
    
  }

   Future<String> getExpense2List(int id) async{
    await openDb();
    String x; 
    String result;
    final response = await _database.rawQuery(      
        "SELECT GROUP_CONCAT(expense) FROM trips where id == ? AND user2Name IS NOT NULL AND expense IS NOT NULL  ",
        [id],  

    );
    x = response.toString();     
    result = x.substring(25,x.length-2);   
    return result;  

  }

//=========================================GET USER2 DETAILS=========================================================================


//=========================================GET USER3 DETAILS=========================================================================

  Future<String> getUser3Name(int id) async{
    await openDb(); 
    String x; 
    String result;  
    
    
    final response = await _database.rawQuery(      
        "SELECT DISTINCT user3Name FROM trips where id == ? AND user3Name IS NOT NULL ",
        [id],  

    );

    x = response.toString(); 
     
    result = x.substring(13,x.length-2); 
    
    return result;
    
    
  }

  Future<double> getTotal3(int id) async{
    await openDb();
    String x;
    String fi;
    final total3 = await _database.rawQuery("SELECT SUM(user3Spent) FROM trips WHERE id =?",[id]);
    double total3D;
    x = total3.toString();
    fi = x.substring(19,x.length-2);
    total3D = double.parse(fi);    
    return total3D;
   
  }

  Future<void> insert3Data(int id, int members,String tripName,String expense,String user3Name,double user3Spent) async{
    await openDb();
    await _database.rawQuery("INSERT INTO trips(id,members,tripName,expense,user3Name,user3Spent) VALUES (?,?,?,?,?,?)",[id,members,tripName,expense,user3Name,user3Spent],);
    
  }

   Future<String> getExpense3List(int id) async{
    await openDb();
    String x; 
    String result;
    final response = await _database.rawQuery(      
        "SELECT GROUP_CONCAT(expense) FROM trips where id == ? AND user3Name IS NOT NULL AND expense IS NOT NULL  ",
        [id],  

    );
    x = response.toString();     
    result = x.substring(25,x.length-2);   
    return result;  

  }

//=========================================GET USER3 DETAILS=========================================================================

//=========================================GET USER4 DETAILS=========================================================================

  Future<String> getUser4Name(int id) async{
    await openDb(); 
    String x; 
    String result;  
    
    
    final response = await _database.rawQuery(      
        "SELECT DISTINCT user4Name FROM trips where id == ? AND user4Name IS NOT NULL ",
        [id],  

    );

    x = response.toString(); 
     
    result = x.substring(13,x.length-2); 
    
    return result;
    
    
  }

  Future<double> getTotal4(int id) async{
    await openDb();
    String x;
    String fi;
    final total4 = await _database.rawQuery("SELECT SUM(user4Spent) FROM trips WHERE id =?",[id]);
    double total4D;
    x = total4.toString();
    fi = x.substring(19,x.length-2);
    total4D = double.parse(fi);    
    return total4D;
   
  }

  Future<void> insert4Data(int id, int members,String tripName,String expense,String user4Name,double user4Spent) async{
    await openDb();
    await _database.rawQuery("INSERT INTO trips(id,members,tripName,expense,user4Name,user4Spent) VALUES (?,?,?,?,?,?)",[id,members,tripName,expense,user4Name,user4Spent],);
   
  }

   Future<String> getExpense4List(int id) async{
    await openDb();
    String x; 
    String result;
    final response = await _database.rawQuery(      
        "SELECT GROUP_CONCAT(expense) FROM trips where id == ? AND user4Name IS NOT NULL AND expense IS NOT NULL  ",
        [id],  

    );
    x = response.toString();     
    result = x.substring(25,x.length-2);       
    return result;  

  }

//=========================================GET USER4 DETAILS=========================================================================


//=========================================GET USER5 DETAILS=========================================================================

  Future<String> getUser5Name(int id) async{
    await openDb(); 
    String x; 
    String result;  
    
    
    final response = await _database.rawQuery(      
        "SELECT DISTINCT user5Name FROM trips where id == ? AND user5Name IS NOT NULL ",
        [id],  

    );

    x = response.toString(); 
     
    result = x.substring(13,x.length-2); 
    
    return result;
    
    
  }

  Future<double> getTotal5(int id) async{
    await openDb();
    String x;
    String fi;
    final total5 = await _database.rawQuery("SELECT SUM(user5Spent) FROM trips WHERE id =?",[id]);
    double total5D;
    x = total5.toString();
    fi = x.substring(19,x.length-2);
    total5D = double.parse(fi);    
    return total5D;
   
  }

  Future<void> insert5Data(int id, int members,String tripName,String expense,String user5Name,double user5Spent) async{
    await openDb();
    await _database.rawQuery("INSERT INTO trips(id,members,tripName,expense,user5Name,user5Spent) VALUES (?,?,?,?,?,?)",[id,members,tripName,expense,user5Name,user5Spent],);
    
  }

   Future<String> getExpense5List(int id) async{
    await openDb();
    String x; 
    String result;
    final response = await _database.rawQuery(      
        "SELECT GROUP_CONCAT(expense) FROM trips where id == ? AND user5Name IS NOT NULL AND expense IS NOT NULL  ",
        [id],  

    );
    x = response.toString();     
    result = x.substring(25,x.length-2);  
    
    return result;  

  }

//=========================================GET USER5 DETAILS=========================================================================

//=========================================GET USER6 DETAILS=========================================================================

  Future<String> getUser6Name(int id) async{
    await openDb(); 
    String x; 
    String result;  
    
    
    final response = await _database.rawQuery(      
        "SELECT DISTINCT user6Name FROM trips where id == ? AND user6Name IS NOT NULL ",
        [id],  

    );

    x = response.toString(); 
     
    result = x.substring(13,x.length-2); 
    
    return result;
    
    
  }

  Future<double> getTotal6(int id) async{
    await openDb();
    String x;
    String fi;
    final total6 = await _database.rawQuery("SELECT SUM(user6Spent) FROM trips WHERE id =?",[id]);
    double total6D;
    x = total6.toString();
    fi = x.substring(19,x.length-2);
    total6D = double.parse(fi);    
    return total6D;
   
  }

  Future<void> insert6Data(int id, int members,String tripName,String expense,String user6Name,double user6Spent) async{
    await openDb();
    await _database.rawQuery("INSERT INTO trips(id,members,tripName,expense,user6Name,user6Spent) VALUES (?,?,?,?,?,?)",[id,members,tripName,expense,user6Name,user6Spent],);
   
  }

   Future<String> getExpense6List(int id) async{
    await openDb();
    String x; 
    String result;
    final response = await _database.rawQuery(      
        "SELECT GROUP_CONCAT(expense) FROM trips where id == ? AND user6Name IS NOT NULL AND expense IS NOT NULL  ",
        [id],  

    );
    x = response.toString();     
    result = x.substring(25,x.length-2);       
    return result;  

  }

//=========================================GET USER6 DETAILS=========================================================================


//=========================================GET USER7 DETAILS=========================================================================

 Future<String> getUser7Name(int id) async{
    await openDb(); 
    String x; 
    String result;  
    
    
    final response = await _database.rawQuery(      
        "SELECT DISTINCT user7Name FROM trips where id == ? AND user7Name IS NOT NULL ",
        [id],  

    );

    x = response.toString(); 
     
    result = x.substring(13,x.length-2); 
    
    return result;
    
    
  }

  Future<double> getTotal7(int id) async{
    await openDb();
    String x;
    String fi;
    final total7 = await _database.rawQuery("SELECT SUM(user7Spent) FROM trips WHERE id =?",[id]);
    double total7D;
    x = total7.toString();
    fi = x.substring(19,x.length-2);
    total7D = double.parse(fi);    
    return total7D;
   
  }

  Future<void> insert7Data(int id, int members,String tripName,String expense,String user7Name,double user7Spent) async{
    await openDb();
    await _database.rawQuery("INSERT INTO trips(id,members,tripName,expense,user7Name,user7Spent) VALUES (?,?,?,?,?,?)",[id,members,tripName,expense,user7Name,user7Spent],);
    
  }

   Future<String> getExpense7List(int id) async{
    await openDb();
    String x; 
    String result;
    final response = await _database.rawQuery(      
        "SELECT GROUP_CONCAT(expense) FROM trips where id == ? AND user7Name IS NOT NULL AND expense IS NOT NULL  ",
        [id],  

    );
    x = response.toString();     
    result = x.substring(25,x.length-2);   
   
    return result;  

  }

//=========================================GET USER7 DETAILS=========================================================================


//=========================================GET USER8 DETAILS=========================================================================

  Future<String> getUser8Name(int id) async{
    await openDb(); 
    String x; 
    String result;  
    
    
    final response = await _database.rawQuery(      
        "SELECT DISTINCT user8Name FROM trips where id == ? AND user8Name IS NOT NULL ",
        [id],  

    );

    x = response.toString(); 
     
    result = x.substring(13,x.length-2); 
    
    return result;
    
    
  }

  Future<double> getTotal8(int id) async{
    await openDb();
    String x;
    String fi;
    final total8 = await _database.rawQuery("SELECT SUM(user8Spent) FROM trips WHERE id =?",[id]);
    double total8D;
    x = total8.toString();
    fi = x.substring(19,x.length-2);
    total8D = double.parse(fi);    
    return total8D;
   
  }

  Future<void> insert8Data(int id, int members,String tripName,String expense,String user8Name,double user8Spent) async{
    await openDb();
    await _database.rawQuery("INSERT INTO trips(id,members,tripName,expense,user8Name,user8Spent) VALUES (?,?,?,?,?,?)",[id,members,tripName,expense,user8Name,user8Spent],);
   
  }

   Future<String> getExpense8List(int id) async{
    await openDb();
    String x; 
    String result;
    final response = await _database.rawQuery(      
        "SELECT GROUP_CONCAT(expense) FROM trips where id == ? AND user8Name IS NOT NULL AND expense IS NOT NULL  ",
        [id],  

    );
    x = response.toString();     
    result = x.substring(25,x.length-2);   
   
    return result;  

  }

//=========================================GET USER8 DETAILS=========================================================================


//=========================================GET USER9 DETAILS=========================================================================

  Future<String> getUser9Name(int id) async{
    await openDb(); 
    String x; 
    String result;  
    
    
    final response = await _database.rawQuery(      
        "SELECT DISTINCT user9Name FROM trips where id == ? AND user9Name IS NOT NULL ",
        [id],  

    );

    x = response.toString(); 
     
    result = x.substring(13,x.length-2); 
    
    return result;
    
    
  }

  Future<double> getTotal9(int id) async{
    await openDb();
    String x;
    String fi;
    final total9 = await _database.rawQuery("SELECT SUM(user9Spent) FROM trips WHERE id =?",[id]);
    double total9D;
    x = total9.toString();
    fi = x.substring(19,x.length-2);
    total9D = double.parse(fi);    
    return total9D;
   
  }

   Future<void> insert9Data(int id, int members,String tripName,String expense,String user9Name,double user9Spent) async{
    await openDb();
    await _database.rawQuery("INSERT INTO trips(id,members,tripName,expense,user9Name,user9Spent) VALUES (?,?,?,?,?,?)",[id,members,tripName,expense,user9Name,user9Spent],);
    
  }

   Future<String> getExpense9List(int id) async{
    await openDb();
    String x; 
    String result;
    final response = await _database.rawQuery(      
        "SELECT GROUP_CONCAT(expense) FROM trips where id == ? AND user9Name IS NOT NULL AND expense IS NOT NULL  ",
        [id],  

    );
    x = response.toString();     
    result = x.substring(25,x.length-2);   
   
    return result;  

  }

//=========================================GET USER9 DETAILS=========================================================================

  
 
//=========================================GET TABLE QUERY=========================================================================

  Future<List<Trips>> getTripsList() async{
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.rawQuery("SELECT id,members,tripName,expense FROM trips GROUP BY id ORDER BY id desc"); //trips is table name
    // final List<Map<String, dynamic>> maps = await _database.rawQuery('trips',orderBy: "id DESC",distinct: true); //trips is table name
   
    return List.generate(maps.length, (i){
      return Trips(  
        id: maps[i]['id'],
        members: maps[i]['members'],
        tripName: maps[i]['tripName'],
        expense: maps[i]['expense'],
        
        
      );
    });
  }
//=========================================GET TABLE QUERY=========================================================================



//=========================================UPDATE TRIP=========================================================================

  Future<int> updateTrips(Trips trips) async{
    await openDb();
    return await _database.update('trips', trips.toMap(), where: "id = ?", whereArgs: [trips.id]);
  }
//=========================================UPDATE TRIP=========================================================================


//=========================================DELETE TRIP=========================================================================

  Future<void> deleteTrips(int id) async{
    await openDb();
    await _database.delete(
      'trips',
      where: "id = ?", whereArgs:[id],
    );
  }


//=========================================DELETE TRIP=========================================================================



   

  



 

}








class Trips{  
  int id;
  int members;
  String tripName;
  String expense; 
  
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




  Trips({@required this.tripName, this.id,this.members,this.expense,this.user0Name,this.user1Name,this.user2Name,this.user3Name,this.user4Name,this.user5Name,this.user6Name,this.user7Name,this.user8Name,this.user9Name,this.user0Spent,this.user1Spent,this.user2Spent,this.user3Spent,this.user4Spent,this.user5Spent,this.user6Spent,this.user7Spent,this.user8Spent,this.user9Spent}); 
  Map<String, dynamic> toMap(){
    return{'id': id, 'members':members,'tripName': tripName,'expense': expense,'user0Name':user0Name, 'user0Spent':user0Spent, 'user1Name':user1Name, 'user1Spent':user1Spent,'user2Name':user2Name, 'user2Spent':user2Spent,'user3Name':user3Name, 'user3Spent':user3Spent,'user4Name':user4Name, 'user4Spent':user4Spent,'user5Name':user5Name, 'user5Spent':user5Spent,'user6Name':user6Name, 'user6Spent':user6Spent,'user7Name':user7Name, 'user7Spent':user7Spent,'user8Name':user8Name, 'user8Spent':user8Spent,'user9Name':user9Name, 'user9Spent':user9Spent,};
  }
 

}

class User{
  String name;
  int avatar;

  User({@required this.name,@required this.avatar});

  Map<String, dynamic> toMap(){
    return{'name': name, 'avatar': avatar};
  }
}








