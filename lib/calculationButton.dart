import 'package:expensewhat/dialogBox.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';


double roundDouble(double value, int places){ 
   double mod = pow(10.0, places); 
   return ((value * mod).round().toDouble() / mod); 
}

// ignore: must_be_immutable
class CalculationButton extends StatefulWidget {


   CalculationButton({
    Key key,
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

    this.members,

  }) : super(key: key);

  final String tripName;
  final String user0Name;
  final String user1Name;
  final String user2Name;
  final String user3Name;
  final String user4Name;
  final String user5Name;
  final String user6Name;
  final String user7Name;
  final String user8Name;
  final String user9Name;

  
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

  final int members;

  @override
  _CalculationButtonState createState() => _CalculationButtonState();
}

class _CalculationButtonState extends State<CalculationButton> {

  

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
    
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 20,
      color: Colors.black,
      child: FlatButton(      
        child: Text('Split',style: TextStyle(color: Colors.white,fontSize: 25),),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0),
        ),
        
        
        onPressed: (){
          List users = [];
          // ignore: non_constant_identifier_names
          List dup_users = [];
          // ignore: non_constant_identifier_names
          double per_person;
          // ignore: non_constant_identifier_names
          List actually_paid = [];
          List extra = [];
          // ignore: non_constant_identifier_names
          List additional_payers = [];
          // ignore: non_constant_identifier_names
          List additional_payers_index = [];
          // ignore: non_constant_identifier_names
          List low_payers = [];
          // ignore: non_constant_identifier_names
          List low_payers_index = [];
          List remarks = [];
          // ignore: non_constant_identifier_names
          String final_remarks = "";
          // ignore: non_constant_identifier_names
          // ignore: unused_local_variable
          // ignore: non_constant_identifier_names
          List mid = [];
          String message = "";


         
        
          if(widget.user0Name != null){
            users.add(widget.user0Name);
            dup_users.add(widget.user0Name);
            mid.add("${widget.user0Name} - $currency${widget.user0Spent}");
          }

          if(widget.user1Name != null){
            users.add(widget.user1Name);    
            dup_users.add(widget.user1Name);
            mid.add("${widget.user1Name} - $currency${widget.user1Spent}");
          }

          if(widget.user2Name != null){
            users.add(widget.user2Name);    
            dup_users.add(widget.user2Name);
            mid.add("${widget.user2Name} - $currency${widget.user2Spent}");
          }

          if(widget.user3Name != null){
            users.add(widget.user3Name);    
            dup_users.add(widget.user3Name);
            mid.add("${widget.user3Name} - $currency${widget.user3Spent}");

          }

          if(widget.user4Name != null){
            users.add(widget.user4Name);    
            dup_users.add(widget.user4Name);
            mid.add("${widget.user4Name} - $currency${widget.user4Spent}");
          }

          if(widget.user5Name != null){
            users.add(widget.user5Name);    
            dup_users.add(widget.user5Name);
            mid.add("${widget.user5Name} - $currency${widget.user5Spent}");
          }

          if(widget.user6Name != null){
            users.add(widget.user6Name);    
            dup_users.add(widget.user6Name);
            mid.add("${widget.user6Name} - $currency${widget.user6Spent}");
          }

          if(widget.user7Name != null){
            users.add(widget.user7Name);    
            dup_users.add(widget.user7Name);
            mid.add("${widget.user7Name} - $currency${widget.user7Spent}");
          }

          if(widget.user8Name != null){
            users.add(widget.user8Name);    
            dup_users.add(widget.user8Name);
            mid.add("${widget.user8Name} - $currency${widget.user8Spent}");
          }

          if(widget.user9Name != null){
            users.add(widget.user9Name);    
            dup_users.add(widget.user9Name);
            mid.add("${widget.user9Name} - $currency${widget.user9Spent}");
          }



          if(widget.user0Spent == null){
            widget.user0Spent = 0;
          }
          else{
            actually_paid.add(widget.user0Spent);
          }

          if(widget.user1Spent == null){
            widget.user1Spent = 0;
          }
          else{
            actually_paid.add(widget.user1Spent);
          }

          if(widget.user2Spent == null){
            widget.user2Spent = 0;
          }
          else{
            actually_paid.add(widget.user2Spent);
          }

          if(widget.user3Spent == null){
            widget.user3Spent = 0;
          }
          else{
            actually_paid.add(widget.user3Spent);
          }

          if(widget.user4Spent == null){
            widget.user4Spent = 0;
          }
          else{
            actually_paid.add(widget.user4Spent);
          }

          if(widget.user5Spent == null){
            widget.user5Spent = 0;
          }
          else{
            actually_paid.add(widget.user5Spent);
          }

          if(widget.user6Spent == null){
            widget.user6Spent = 0;
          }
          else{
            actually_paid.add(widget.user6Spent);
          }

          if(widget.user7Spent == null){
            widget.user7Spent = 0;
          }
          else{
            actually_paid.add(widget.user7Spent);
          }

          if(widget.user8Spent == null){
            widget.user8Spent = 0;
          }
          else{
            actually_paid.add(widget.user8Spent);
          }

          if(widget.user9Spent == null){
            widget.user9Spent = 0;
          }
          else{
            actually_paid.add(widget.user9Spent);
          }

          print(mid);
          
          
          
          
          

          per_person = (widget.user0Spent+widget.user1Spent+widget.user2Spent+widget.user3Spent+widget.user4Spent+widget.user5Spent+widget.user6Spent+widget.user7Spent+widget.user8Spent+widget.user9Spent)/widget.members;        
          
            
          
         
          
          
          
          

         
          
          for(var i = 0; i<widget.members; i++){
            double t = actually_paid[i] - per_person;
            extra.add(t);
           
          }

        

          for(var j = 0; j<widget.members; j++){
            
            if(extra[j]>0){
              additional_payers.add(extra[j]);
              additional_payers_index.add(j);
            }

            else if(extra[j]<0){
              low_payers.add(extra[j]);
              low_payers_index.add(j);
            }

          }
         


          bool check(List extra){
            if(extra.toSet().toList().length <= 1){
              return true;
            }
            else{
              return false;
            }
          }

          while(check(extra) == false){
            // ignore: non_constant_identifier_names
            int min_index = 0;
            // ignore: non_constant_identifier_names
            double min_value = extra[0];
            // ignore: non_constant_identifier_names
            int max_index = 0;
            // ignore: non_constant_identifier_names
            double max_value = extra[0];


            
            

            for(var k = 0; k < extra.length;k++){
              if(extra[k] < min_value && extra[k] < 0){
                min_value = extra[k];
                min_index = k;
              }
            }

            for(var j = 0; j < extra.length;j++){
              if(extra[j] > max_value && extra[j] > 0){
                max_value = extra[j];
                max_index = j;
              }
            }

            

            if(min_value.abs() <= max_value.abs()){
              extra[max_index] = (max_value - min_value.abs());
              extra[min_index] = 0.00;

              if(extra[max_index].abs() < 0.1){
                      extra[max_index] = 0.00;
                    }

              if(min_index != max_index){
                remarks.add("${dup_users[min_index]} has to pay ${dup_users[max_index]} an amount of $currency${roundDouble(min_value.abs(),2)}");

              }
              
              
            }

            else{
              extra[max_index] = 0.00;
              extra[min_index] = (min_value + max_value.abs());

              if(extra[min_index].abs() < 0.1){
                      extra[min_index] = 0.00;
                    }
              
              if(min_index != max_index){
                remarks.add("${dup_users[min_index]} has to pay ${dup_users[max_index]} an amount of $currency${roundDouble(max_value.abs(),2)}");

              }
              
              
              
            }                         



          }

          final_remarks = "\n";
        
          for(var i = 0; i < remarks.length;i++){
           
            final_remarks = final_remarks + remarks[i].toString() + "\n \n";
            
          }

          message = "*TRIP NAME:- ${widget.tripName}* \n===================\n";

          for(var j = 0; j < mid.length;j++){
            message = message + mid[j].toString() + "\n";
          }

          message = message + "==================="+ final_remarks+"===================\nDownload pinnacle to split the bill among your friends:-\nhttps://play.google.com/store/apps/details?id=com.pinnacle.share";

          print(message);
          
          

          return showDialog(
            context: context,
            builder: (BuildContext context){
              return DetailsDialog(final_remarks: final_remarks,message: message,);
            }

            );
            
        },
      ),
    );
  }
}