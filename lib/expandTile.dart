import 'package:expensewhat/dbmanager.dart';
import 'package:expensewhat/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'calculationPage.dart';
import 'dbmanager.dart';

final DbTripsManager dbmanager = new DbTripsManager();


// ignore: must_be_immutable
class ExpandTile extends StatefulWidget {
  ExpandTile({
    Key key,
    
    this.userNumber,
    
    this.userName,
    this.userSpent,
    this.expense,  
    
    this.expenseNameDialog,
    this.expensePriceDialog,
    this.expenseName,
    this.expensePrice,
    this.dbmanager,
    this.id,
    this.members,
    this.tripName,
  }) : super(key: key);

  int userNumber;

  String userName;
  double userSpent;
  String expense;

  TextEditingController expenseNameDialog;
  TextEditingController expensePriceDialog;
  String expenseName;
  double expensePrice;
  DbTripsManager dbmanager;
  int id;
  int members;
  String tripName;
  

  @override
  _ExpandTileState createState() => _ExpandTileState();
}

class _ExpandTileState extends State<ExpandTile> {
  
  String currency = '';
  getCurrency() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currency = prefs.getString('currency');
    });
  }

  @override
  void initState() { 
    super.initState();
    getCurrency();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
          decoration: BoxDecoration(
            color: Colors.white,
           // gradient: LinearGradient(
                //begin: Alignment.centerLeft,
                //end: Alignment.centerRight,

                //colors: [
                  //Colors.white,
                  //Color(0xFF0F2027),
                  //Color(0xFF203A43),
                  //Color(0xFF2C5364),
               // ]),
            borderRadius:
                BorderRadius.all(Radius.circular(25)),
          ),
          child: ExpansionTile(
          title: Text(
          '${widget.userName}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
            ),
          children: <Widget>[
            Container(
              
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                
                child: Column(
                  
                  children: <Widget>[
                    Divider(  
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,top: 10,right: 15),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                                                                        child: Text(
                                'Spent total:',
                                
                                style: TextStyle(
                                  
                                  fontSize: 20,

                                ),
                              ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:25.0,top: 10,right: 15),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.payment,
                            size: 50,
                            color: Colors.black,
                            
                            ),

                            SizedBox(width: 20,),

                          
                          Flexible(
                            child: Text(  
                              '$currency${widget.userSpent}',
                              style: TextStyle(  
                                fontFamily: 'DIN-LIGHT',
                                fontSize: 35,                                               
                                fontWeight: FontWeight.bold,
                               
                              ),
                            ),
                          ),
                      ],),
                    ),

                    SizedBox(height: 10,),

                    Divider(  
                      color: Colors.black,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:15.0,top: 10),
                      child: Row(
                        children: <Widget>[
                         
                          Flexible(
                                                                        child: Text(
                              'Paid for:',
                              style: TextStyle(  
                                fontSize: 20,
                                

                              ),
                            ),

                            
                          ),

                          
                        ],
                      ),

                      
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:25.0,top: 10,right: 15),
                      child: Row(  
                          children: <Widget>[

                            Icon(  
                              Icons.done_outline,
                              size: 50,
                              color: Colors.black,
                            ),

                            SizedBox(width: 20,),
                            Flexible(  
                              child: (widget.expense == 'null')? Text(
                                'Nothing yet...',
                                 style: TextStyle(  
                                  fontFamily: 'DIN-LIGHT',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  
                                ),

                                ):
                                Text(  
                                '${widget.expense.replaceAll(',', ', ')}',
                                style: TextStyle(  
                                  fontFamily: 'DIN-LIGHT',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  
                                ),
                              ),
                            ),
                          ],
                        ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: 200,
                              child: RaisedButton(
                                
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.red)
                                  ), 

                                  child: Text(
                                    'ADD NEW EXPENSE',
                                    style: TextStyle(  
                                      color: Colors.white,
                                    ),
                                    ),

                                onPressed: () {
                                  
                                  
                                  return showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder:
                                          (BuildContext context) {
                                        return AlertDialog(
                                          content:
                                              SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Container(
                                                  padding:
                                                      EdgeInsets
                                                          .all(
                      30.0),
                                                  decoration:
                                                      BoxDecoration(
                                                    color: Colors
                                                        .white,
                                                    borderRadius:
                                                        BorderRadius
                                                            .only(
                                                      topLeft: Radius
                                                          .circular(
                      20),
                                                      topRight: Radius
                                                          .circular(
                      20),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: <
                                                        Widget>[
                                                      Text(
                                                        'Add Expense',
                                                        textAlign:
                                                            TextAlign
                        .center,
                                                        style:
                                                            TextStyle(
                                                          fontSize:
                      30,
                                                          color: Colors
                      .blueAccent,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            20,
                                                      ),
                                                      TextField(
                                                        controller: widget.expenseNameDialog,
                                                        
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                      'Expended On',
                                                          
                                                        ),
                                                        textAlign:
                                                            TextAlign
                        .center,
                                                      ),
                                                      SizedBox(height: 8,),
                                                      Center(
                                                        child: Text(  
                                                              'Spent on',
                                                              style: TextStyle(  
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                      ),


                                                      SizedBox(
                                                          height:40,                                                      
                                                      ),

                                                      

                                                      TextField(
                                                        inputFormatters: <TextInputFormatter>[
                                                          WhitelistingTextInputFormatter(RegExp("[0-9.]")),
                  ],
                                                        controller: widget.expensePriceDialog,                                                      
                                                        
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                      'Amount spent',
                                                        ),
                                                        textAlign:
                                                            TextAlign
                        .center,
                                                      ),
                                                      SizedBox(height: 8,),
                                                      Center(
                                                        child: Text(  
                                                              'Enter the amount (in digits)',
                                                              style: TextStyle(  
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                      ),
                                                      SizedBox(
                                                          height:
                      20),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[


                                            FlatButton(
                                              child: Text('Back'),
                                              onPressed: () {
                                                Navigator.of(
                                                        context)
                                                    .pop(false);
                                              },
                                            ),
                                            
                                            
                                            
                                            FlatButton(
                                              child: Text('ADD'),
                                             
                                              onPressed: () async{
                                                
                                                if(widget.expenseNameDialog.text == '' || widget.expensePriceDialog.text == ''){
                                                 
                                                }
                                                else{
                                                widget.expenseName = widget.expenseNameDialog.text;
                                                widget.expensePrice = double.parse(widget.expensePriceDialog.text.replaceAll(',', ''));
                                                

                                                if(widget.userNumber == 0){
                                                  widget.dbmanager.insert0Data(widget.id, widget.members, widget.tripName, widget.expenseName, widget.userName, widget.expensePrice);
                                                  
                                                }                                             
                                                
                                                else if(widget.userNumber == 1){
                                                  widget.dbmanager.insert1Data(widget.id, widget.members, widget.tripName, widget.expenseName, widget.userName, widget.expensePrice);
                                                  
                                                } 

                                                else if(widget.userNumber == 2){
                                                  widget.dbmanager.insert2Data(widget.id, widget.members, widget.tripName, widget.expenseName, widget.userName, widget.expensePrice);
                                                } 

                                                else if(widget.userNumber == 3){
                                                  widget.dbmanager.insert3Data(widget.id, widget.members, widget.tripName, widget.expenseName, widget.userName, widget.expensePrice);
                                                }

                                                else if(widget.userNumber == 4){
                                                  widget.dbmanager.insert4Data(widget.id, widget.members, widget.tripName, widget.expenseName, widget.userName, widget.expensePrice);
                                                }  

                                                else if(widget.userNumber == 5){
                                                  widget.dbmanager.insert5Data(widget.id, widget.members, widget.tripName, widget.expenseName, widget.userName, widget.expensePrice);
                                                }  

                                                else if(widget.userNumber == 6){
                                                  widget.dbmanager.insert6Data(widget.id, widget.members, widget.tripName, widget.expenseName, widget.userName, widget.expensePrice);
                                                }

                                                else if(widget.userNumber == 7){
                                                  widget.dbmanager.insert7Data(widget.id, widget.members, widget.tripName, widget.expenseName, widget.userName, widget.expensePrice);
                                                }

                                                else if(widget.userNumber == 8){
                                                  widget.dbmanager.insert8Data(widget.id, widget.members, widget.tripName, widget.expenseName, widget.userName, widget.expensePrice);
                                                }

                                                else if(widget.userNumber == 9){
                                                  widget.dbmanager.insert9Data(widget.id, widget.members, widget.tripName, widget.expenseName, widget.userName, widget.expensePrice);
                                                }                                              






                                                if(widget.members==2){
                                                String user0Name = await dbmanager.getUser0Name(widget.id);
                                                String user0Expenses = await dbmanager.getExpense0List(widget.id);
                                                double total0 = await dbmanager.getTotal0(widget.id);

                                                
                                                String user1Name = await dbmanager.getUser1Name(widget.id);
                                                String user1Expenses = await dbmanager.getExpense1List(widget.id);
                                                double total1 = await dbmanager.getTotal1(widget.id);

                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalculationPage2(id: widget.id,members: widget.members,expense1: user1Expenses,expense0: user0Expenses,tripName: widget.tripName,user0Name: user0Name,user0Spent: total0,user1Name: user1Name,user1Spent: total1)),);
                                                }

                                                else if(widget.members==3){

                                                String user0Name = await dbmanager.getUser0Name(widget.id);
                                                String user0Expenses = await dbmanager.getExpense0List(widget.id);
                                                double total0 = await dbmanager.getTotal0(widget.id);

                                                
                                                String user1Name = await dbmanager.getUser1Name(widget.id);
                                                String user1Expenses = await dbmanager.getExpense1List(widget.id);
                                                double total1 = await dbmanager.getTotal1(widget.id);
                                                
                                                

                                                String user2Name = await dbmanager.getUser2Name(widget.id);
                                                String user2Expenses = await dbmanager.getExpense2List(widget.id);
                                                double total2 = await dbmanager.getTotal2(widget.id);


                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalculationPage3(id: widget.id,members: widget.members,tripName: widget.tripName,user0Name: user0Name,expense0: user0Expenses,expense1: user1Expenses,expense2: user2Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,user2Name: user2Name,user2Spent: total2,)),);
                                                }  

                                                else if(widget.members==4){

                                                  String user0Name = await dbmanager.getUser0Name(widget.id);
                                                String user0Expenses = await dbmanager.getExpense0List(widget.id);
                                                double total0 = await dbmanager.getTotal0(widget.id);

                                                
                                                String user1Name = await dbmanager.getUser1Name(widget.id);
                                                String user1Expenses = await dbmanager.getExpense1List(widget.id);
                                                double total1 = await dbmanager.getTotal1(widget.id);
                                                
                                                

                                                String user2Name = await dbmanager.getUser2Name(widget.id);
                                                String user2Expenses = await dbmanager.getExpense2List(widget.id);
                                                double total2 = await dbmanager.getTotal2(widget.id);


                                                String user3Name = await dbmanager.getUser3Name(widget.id);
                                                String user3Expenses = await dbmanager.getExpense3List(widget.id);
                                                double total3 = await dbmanager.getTotal3(widget.id);

                                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalculationPage4(id: widget.id,members: widget.members,tripName: widget.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses)),);
                                                }

                                                else if(widget.members==5){

                                                  String user0Name = await dbmanager.getUser0Name(widget.id);
                                                String user0Expenses = await dbmanager.getExpense0List(widget.id);
                                                double total0 = await dbmanager.getTotal0(widget.id);

                                                
                                                String user1Name = await dbmanager.getUser1Name(widget.id);
                                                String user1Expenses = await dbmanager.getExpense1List(widget.id);
                                                double total1 = await dbmanager.getTotal1(widget.id);
                                                
                                                

                                                String user2Name = await dbmanager.getUser2Name(widget.id);
                                                String user2Expenses = await dbmanager.getExpense2List(widget.id);
                                                double total2 = await dbmanager.getTotal2(widget.id);


                                                String user3Name = await dbmanager.getUser3Name(widget.id);
                                                String user3Expenses = await dbmanager.getExpense3List(widget.id);
                                                double total3 = await dbmanager.getTotal3(widget.id);

                                                String user4Name = await dbmanager.getUser4Name(widget.id);
                                                String user4Expenses = await dbmanager.getExpense4List(widget.id);
                                                double total4 = await dbmanager.getTotal4(widget.id);

                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalculationPage5(id: widget.id,members: widget.members,tripName: widget.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses,user4Name: user4Name,user4Spent: total4,expense4: user4Expenses,)),);
                                                }

                                                else if(widget.members==6){

                                                String user0Name = await dbmanager.getUser0Name(widget.id);
                                                String user0Expenses = await dbmanager.getExpense0List(widget.id);
                                                double total0 = await dbmanager.getTotal0(widget.id);

                                                
                                                String user1Name = await dbmanager.getUser1Name(widget.id);
                                                String user1Expenses = await dbmanager.getExpense1List(widget.id);
                                                double total1 = await dbmanager.getTotal1(widget.id);
                                                
                                                

                                                String user2Name = await dbmanager.getUser2Name(widget.id);
                                                String user2Expenses = await dbmanager.getExpense2List(widget.id);
                                                double total2 = await dbmanager.getTotal2(widget.id);


                                                String user3Name = await dbmanager.getUser3Name(widget.id);
                                                String user3Expenses = await dbmanager.getExpense3List(widget.id);
                                                double total3 = await dbmanager.getTotal3(widget.id);

                                                String user4Name = await dbmanager.getUser4Name(widget.id);
                                                String user4Expenses = await dbmanager.getExpense4List(widget.id);
                                                double total4 = await dbmanager.getTotal4(widget.id);

                                                String user5Name = await dbmanager.getUser5Name(widget.id);
                                                String user5Expenses = await dbmanager.getExpense5List(widget.id);
                                                double total5 = await dbmanager.getTotal5(widget.id);


                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalculationPage6(id: widget.id,members: widget.members,tripName: widget.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses,user4Name: user4Name,user4Spent: total4,expense4: user4Expenses, user5Name:user5Name,user5Spent: total5,expense5: user5Expenses,)),);
                                                }

                                                else if(widget.members==7){

                                                  String user0Name = await dbmanager.getUser0Name(widget.id);
                                                String user0Expenses = await dbmanager.getExpense0List(widget.id);
                                                double total0 = await dbmanager.getTotal0(widget.id);

                                                
                                                String user1Name = await dbmanager.getUser1Name(widget.id);
                                                String user1Expenses = await dbmanager.getExpense1List(widget.id);
                                                double total1 = await dbmanager.getTotal1(widget.id);
                                                
                                                

                                                String user2Name = await dbmanager.getUser2Name(widget.id);
                                                String user2Expenses = await dbmanager.getExpense2List(widget.id);
                                                double total2 = await dbmanager.getTotal2(widget.id);


                                                String user3Name = await dbmanager.getUser3Name(widget.id);
                                                String user3Expenses = await dbmanager.getExpense3List(widget.id);
                                                double total3 = await dbmanager.getTotal3(widget.id);

                                                String user4Name = await dbmanager.getUser4Name(widget.id);
                                                String user4Expenses = await dbmanager.getExpense4List(widget.id);
                                                double total4 = await dbmanager.getTotal4(widget.id);

                                                String user5Name = await dbmanager.getUser5Name(widget.id);
                                                String user5Expenses = await dbmanager.getExpense5List(widget.id);
                                                double total5 = await dbmanager.getTotal5(widget.id);

                                                String user6Name = await dbmanager.getUser6Name(widget.id);
                                                String user6Expenses = await dbmanager.getExpense6List(widget.id);
                                                double total6 = await dbmanager.getTotal6(widget.id);

                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalculationPage7(id: widget.id,members: widget.members,tripName: widget.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses,user4Name: user4Name,user4Spent: total4,expense4: user4Expenses, user5Name:user5Name,user5Spent: total5,expense5: user5Expenses,user6Name: user6Name,user6Spent: total6,expense6: user6Expenses,)),);
                                                }

                                                else if(widget.members==8){

                                                   String user0Name = await dbmanager.getUser0Name(widget.id);
                                                String user0Expenses = await dbmanager.getExpense0List(widget.id);
                                                double total0 = await dbmanager.getTotal0(widget.id);

                                                
                                                String user1Name = await dbmanager.getUser1Name(widget.id);
                                                String user1Expenses = await dbmanager.getExpense1List(widget.id);
                                                double total1 = await dbmanager.getTotal1(widget.id);
                                                
                                                

                                                String user2Name = await dbmanager.getUser2Name(widget.id);
                                                String user2Expenses = await dbmanager.getExpense2List(widget.id);
                                                double total2 = await dbmanager.getTotal2(widget.id);


                                                String user3Name = await dbmanager.getUser3Name(widget.id);
                                                String user3Expenses = await dbmanager.getExpense3List(widget.id);
                                                double total3 = await dbmanager.getTotal3(widget.id);

                                                String user4Name = await dbmanager.getUser4Name(widget.id);
                                                String user4Expenses = await dbmanager.getExpense4List(widget.id);
                                                double total4 = await dbmanager.getTotal4(widget.id);

                                                String user5Name = await dbmanager.getUser5Name(widget.id);
                                                String user5Expenses = await dbmanager.getExpense5List(widget.id);
                                                double total5 = await dbmanager.getTotal5(widget.id);

                                                String user6Name = await dbmanager.getUser6Name(widget.id);
                                                String user6Expenses = await dbmanager.getExpense6List(widget.id);
                                                double total6 = await dbmanager.getTotal6(widget.id);

                                                String user7Name = await dbmanager.getUser7Name(widget.id);
                                                String user7Expenses = await dbmanager.getExpense7List(widget.id);
                                                double total7 = await dbmanager.getTotal7(widget.id);

                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalculationPage8(id: widget.id,members: widget.members,tripName: widget.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses,user4Name: user4Name,user4Spent: total4,expense4: user4Expenses, user5Name:user5Name,user5Spent: total5,expense5: user5Expenses,user6Name: user6Name,user6Spent: total6,expense6: user6Expenses,user7Name: user7Name,user7Spent: total7, expense7: user7Expenses)),);
                                                }

                                                else if(widget.members==9){

                                                  String user0Name = await dbmanager.getUser0Name(widget.id);
                                                String user0Expenses = await dbmanager.getExpense0List(widget.id);
                                                double total0 = await dbmanager.getTotal0(widget.id);

                                                
                                                String user1Name = await dbmanager.getUser1Name(widget.id);
                                                String user1Expenses = await dbmanager.getExpense1List(widget.id);
                                                double total1 = await dbmanager.getTotal1(widget.id);
                                                
                                                

                                                String user2Name = await dbmanager.getUser2Name(widget.id);
                                                String user2Expenses = await dbmanager.getExpense2List(widget.id);
                                                double total2 = await dbmanager.getTotal2(widget.id);


                                                String user3Name = await dbmanager.getUser3Name(widget.id);
                                                String user3Expenses = await dbmanager.getExpense3List(widget.id);
                                                double total3 = await dbmanager.getTotal3(widget.id);

                                                String user4Name = await dbmanager.getUser4Name(widget.id);
                                                String user4Expenses = await dbmanager.getExpense4List(widget.id);
                                                double total4 = await dbmanager.getTotal4(widget.id);

                                                String user5Name = await dbmanager.getUser5Name(widget.id);
                                                String user5Expenses = await dbmanager.getExpense5List(widget.id);
                                                double total5 = await dbmanager.getTotal5(widget.id);

                                                String user6Name = await dbmanager.getUser6Name(widget.id);
                                                String user6Expenses = await dbmanager.getExpense6List(widget.id);
                                                double total6 = await dbmanager.getTotal6(widget.id);

                                                String user7Name = await dbmanager.getUser7Name(widget.id);
                                                String user7Expenses = await dbmanager.getExpense7List(widget.id);
                                                double total7 = await dbmanager.getTotal7(widget.id);

                                                String user8Name = await dbmanager.getUser8Name(widget.id);
                                                String user8Expenses = await dbmanager.getExpense8List(widget.id);
                                                double total8 = await dbmanager.getTotal8(widget.id);

                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalculationPage9(id: widget.id,members: widget.members,tripName: widget.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses,user4Name: user4Name,user4Spent: total4,expense4: user4Expenses, user5Name:user5Name,user5Spent: total5,expense5: user5Expenses,user6Name: user6Name,user6Spent: total6,expense6: user6Expenses,user7Name: user7Name,user7Spent: total7, expense7: user7Expenses,user8Name: user8Name,user8Spent: total8,expense8: user8Expenses,)),);
                                                }

                                                else if(widget.members==10){

                                                  String user0Name = await dbmanager.getUser0Name(widget.id);
                                                String user0Expenses = await dbmanager.getExpense0List(widget.id);
                                                double total0 = await dbmanager.getTotal0(widget.id);

                                                
                                                String user1Name = await dbmanager.getUser1Name(widget.id);
                                                String user1Expenses = await dbmanager.getExpense1List(widget.id);
                                                double total1 = await dbmanager.getTotal1(widget.id);
                                                
                                                

                                                String user2Name = await dbmanager.getUser2Name(widget.id);
                                                String user2Expenses = await dbmanager.getExpense2List(widget.id);
                                                double total2 = await dbmanager.getTotal2(widget.id);


                                                String user3Name = await dbmanager.getUser3Name(widget.id);
                                                String user3Expenses = await dbmanager.getExpense3List(widget.id);
                                                double total3 = await dbmanager.getTotal3(widget.id);

                                                String user4Name = await dbmanager.getUser4Name(widget.id);
                                                String user4Expenses = await dbmanager.getExpense4List(widget.id);
                                                double total4 = await dbmanager.getTotal4(widget.id);

                                                String user5Name = await dbmanager.getUser5Name(widget.id);
                                                String user5Expenses = await dbmanager.getExpense5List(widget.id);
                                                double total5 = await dbmanager.getTotal5(widget.id);

                                                String user6Name = await dbmanager.getUser6Name(widget.id);
                                                String user6Expenses = await dbmanager.getExpense6List(widget.id);
                                                double total6 = await dbmanager.getTotal6(widget.id);

                                                String user7Name = await dbmanager.getUser7Name(widget.id);
                                                String user7Expenses = await dbmanager.getExpense7List(widget.id);
                                                double total7 = await dbmanager.getTotal7(widget.id);

                                                String user8Name = await dbmanager.getUser8Name(widget.id);
                                                String user8Expenses = await dbmanager.getExpense8List(widget.id);
                                                double total8 = await dbmanager.getTotal8(widget.id);

                                                String user9Name = await dbmanager.getUser9Name(widget.id);
                                                String user9Expenses = await dbmanager.getExpense9List(widget.id);
                                                double total9 = await dbmanager.getTotal9(widget.id);

                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalculationPage10(id: widget.id,members: widget.members,tripName: widget.tripName,user0Name: user0Name,expense0: user0Expenses,user0Spent: total0,user1Name: user1Name,user1Spent: total1,expense1: user1Expenses,user2Name: user2Name,user2Spent: total2,expense2: user2Expenses,user3Name: user3Name,user3Spent: total3,expense3: user3Expenses,user4Name: user4Name,user4Spent: total4,expense4: user4Expenses, user5Name:user5Name,user5Spent: total5,expense5: user5Expenses,user6Name: user6Name,user6Spent: total6,expense6: user6Expenses,user7Name: user7Name,user7Spent: total7, expense7: user7Expenses,user8Name: user8Name,user8Spent: total8,expense8: user8Expenses,user9Name: user9Name,user9Spent: total9,expense9: user9Expenses,)),);
                                                }
                                                else{
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Page0()),);
                                                }                                                                                                     

                                                
                                                }
                                               
                                              },
                                            ),
                                            
                                          ],
                                        );
                                      });
                                },
                                
                              ),
                            ),
                          ],
                        ),
                    )
                  ],
                ))
          ],
            )
            );
    
  }
}

