import 'package:flutter/material.dart';
import 'dbmanager.dart';
import 'main.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'D4797B9122D1BA1F0BA7C8F3EFE59831';




final DbTripsManager dbmanager = new DbTripsManager();

// ignore: must_be_immutable
class MemberFields extends StatelessWidget {
  MemberFields({
    Key key,
     this.members,
     this.member0nameController,
     this.member0name,
     this.member1nameController,
     this.member1name,
    this.member2nameController,
     this.member2name,
     this.member3nameController,
     this.member3name,
     this.member4nameController,
     this.member4name,
     this.member5nameController,
     this.member5name,
     this.member6nameController,
     this.member6name,
     this.member7nameController,
     this.member7name,
     this.member8nameController,
     this.member8name,
     this.member9nameController,
     this.member9name,

  }) : super(key: key);

  int members;

  final TextEditingController member0nameController;
   String member0name;
  final TextEditingController member1nameController;
   String member1name;
  final TextEditingController member2nameController;
   String member2name;
  final TextEditingController member3nameController;
   String member3name;
  final TextEditingController member4nameController;
   String member4name;
  final TextEditingController member5nameController;
   String member5name;
  final TextEditingController member6nameController;
   String member6name;
  final TextEditingController member7nameController;
   String member7name;
  final TextEditingController member8nameController;
   String member8name;
  final TextEditingController member9nameController;
   String member9name;

   setMember0Name(){
    member0name = member0nameController.text;
  }

   setMember1Name(){
    member1name = member1nameController.text;
  }

  setMember2Name(){
    member2name = member2nameController.text;
  }

  setMember3Name(){
    member3name = member3nameController.text;
  }

  setMember4Name(){
    member4name = member4nameController.text;
  }

  setMember5Name(){
    member5name = member5nameController.text;
  }

  setMember6Name(){
    member6name = member6nameController.text;
  }

  setMember7Name(){
    member7name = member7nameController.text;
  }

  setMember8Name(){
    member8name = member8nameController.text;
  }

  setMember9Name(){
    member9name = member9nameController.text;
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if(members == 2){
      return Column(
      children: <Widget>[
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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member0nameController,
              onSubmitted: setMember0Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member1nameController,
              onSubmitted: setMember1Name(),
            ),
            ),
          ],
        ),
      ],
    );
    }

    else if(members == 3){
      return Column(
      children: <Widget>[
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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member0nameController,
              onSubmitted: setMember0Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member1nameController,
              onSubmitted: setMember1Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member2nameController,
              onSubmitted: setMember2Name(),
            ),
            ),
          ],
        ),
      ],
    );
    }

    else if(members == 4){

      return Column(
      children: <Widget>[
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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member0nameController,
              onSubmitted: setMember0Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member1nameController,
              onSubmitted: setMember1Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member2nameController,
              onSubmitted: setMember2Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member3nameController,
              onSubmitted: setMember3Name(),
            ),
            ),
          ],
        ),


      ],
    );

    

    }


    else if(members == 5){

      return Column(
      children: <Widget>[
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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member0nameController,
              onSubmitted: setMember0Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member1nameController,
              onSubmitted: setMember1Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member2nameController,
              onSubmitted: setMember2Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member3nameController,
              onSubmitted: setMember3Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member4nameController,
              onSubmitted: setMember4Name(),
            ),
            ),
          ],
        ),


      ],
    );

    

    }


    else if(members == 6){

      return Column(
      children: <Widget>[
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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member0nameController,
              onSubmitted: setMember0Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member1nameController,
              onSubmitted: setMember1Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member2nameController,
              onSubmitted: setMember2Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member3nameController,
              onSubmitted: setMember3Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member4nameController,
              onSubmitted: setMember4Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member5nameController,
              onSubmitted: setMember5Name(),
            ),
            ),
          ],
        ),


      ],
    );

    

    }

    else if(members == 7){

      return Column(
      children: <Widget>[
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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member0nameController,
              onSubmitted: setMember0Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member1nameController,
              onSubmitted: setMember1Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member2nameController,
              onSubmitted: setMember2Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member3nameController,
              onSubmitted: setMember3Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member4nameController,
              onSubmitted: setMember4Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member5nameController,
              onSubmitted: setMember5Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member6nameController,
              onSubmitted: setMember6Name(),
            ),
            ),
          ],
        ),


      ],
    );

    

    }

    else if(members == 8){

      return Column(
      children: <Widget>[
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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member0nameController,
              onSubmitted: setMember0Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member1nameController,
              onSubmitted: setMember1Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member2nameController,
              onSubmitted: setMember2Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member3nameController,
              onSubmitted: setMember3Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member4nameController,
              onSubmitted: setMember4Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member5nameController,
              onSubmitted: setMember5Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member6nameController,
              onSubmitted: setMember6Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member7nameController,
              onSubmitted: setMember7Name(),
            ),
            ),
          ],
        ),


      ],
    );

    

    }


    else if(members == 9){

      return Column(
      children: <Widget>[
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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member0nameController,
              onSubmitted: setMember0Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member1nameController,
              onSubmitted: setMember1Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member2nameController,
              onSubmitted: setMember2Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member3nameController,
              onSubmitted: setMember3Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member4nameController,
              onSubmitted: setMember4Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member5nameController,
              onSubmitted: setMember5Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member6nameController,
              onSubmitted: setMember6Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member7nameController,
              onSubmitted: setMember7Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member8nameController,
              onSubmitted: setMember8Name(),
            ),
            ),
          ],
        ),


      ],
    );

    

    }

    else if(members == 10){

      return Column(
      children: <Widget>[
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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member0nameController,
              onSubmitted: setMember0Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member1nameController,
              onSubmitted: setMember1Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member2nameController,
              onSubmitted: setMember2Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member3nameController,
              onSubmitted: setMember3Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member4nameController,
              onSubmitted: setMember4Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member5nameController,
              onSubmitted: setMember5Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member6nameController,
              onSubmitted: setMember6Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member7nameController,
              onSubmitted: setMember7Name(),
            ),
            ),
          ],
        ),

        SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member8nameController,
              onSubmitted: setMember8Name(),
            ),
            ),
          ],
        ),

         SizedBox(height: 30,),

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
                hintText: 'Enter member name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              controller: member9nameController,
              onSubmitted: setMember9Name(),
            ),
            ),
          ],
        ),


      ],
    );

    

    }
    
  }
}


// ignore: must_be_immutable
class Authorization extends StatefulWidget {
   Authorization({
    Key key,
     this.members,
     this.tripnameController,
     this.member0nameController,
     this.member0name,
     this.member1nameController,
     this.member1name,
     this.member2nameController,
     this.member2name,
     this.member3nameController,
     this.member3name,
     this.member4nameController,
     this.member4name,
     this.member5nameController,
     this.member5name,
     this.member6nameController,
     this.member6name,
     this.member7nameController,
     this.member7name,
     this.member8nameController,
     this.member8name,
     this.member9nameController,
     this.member9name,
     
  }) : super(key: key);

  final TextEditingController tripnameController;
  final TextEditingController member0nameController;
  final String member0name;
  final TextEditingController member1nameController;
  final String member1name;
  final TextEditingController member2nameController;
  final String member2name;
  final TextEditingController member3nameController;
  final String member3name;
  final TextEditingController member4nameController;
  final String member4name;
  final TextEditingController member5nameController;
  final String member5name;
  final TextEditingController member6nameController;
  final String member6name;
  final TextEditingController member7nameController;
  final String member7name;
  final TextEditingController member8nameController;
  final String member8name;
  final TextEditingController member9nameController;
  final String member9name;

  int members;

  @override
  _AuthorizationState createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {

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



  final DbTripsManager dbmanager = new DbTripsManager();

  String tripName;

  Trips trips;

  int x;

  setTripName(){
    tripName = widget.tripnameController.text;
   
  }

  @override
  void dispose() { 
    _interstitialAd.dispose();
    super.dispose();
  }

  void _submitTrips(BuildContext context) async{
     if(trips == null){       
       x = await dbmanager.getTripsNumber();
       
       if(widget.members==2){
         Trips tp = Trips(tripName: widget.tripnameController.text, members: 2,id: x,user0Name: widget.member0nameController.text,user0Spent: 0,user1Name: widget.member1nameController.text,user1Spent: 0);
       // ignore: sdk_version_set_literal
       dbmanager.insertTrips(tp).then((id)=>{
         widget.tripnameController.clear(),
         widget.member0nameController.clear(),
         widget.member1nameController.clear(),
        
         createInterstitialAd()..load()..show(),
         Navigator.push(context,MaterialPageRoute(builder: (context) => Page0()),),
       });
       }

       else if(widget.members==3){
         Trips tp = Trips(tripName: widget.tripnameController.text, members: 3,id: x,user0Name: widget.member0nameController.text,user0Spent: 0,user1Name: widget.member1nameController.text,user1Spent: 0,user2Name: widget.member2nameController.text,user2Spent: 0);
       // ignore: sdk_version_set_literal
       dbmanager.insertTrips(tp).then((id)=>{
         widget.tripnameController.clear(),
         widget.member0nameController.clear(),
         widget.member1nameController.clear(),
         widget.member2nameController.clear(),
        
        createInterstitialAd()..load()..show(),
         Navigator.push(context,MaterialPageRoute(builder: (context) => Page0()),),
       });
       }

       else if(widget.members==4){
         Trips tp = Trips(tripName: widget.tripnameController.text, members: 4,id: x,user0Name: widget.member0nameController.text,user0Spent: 0,user1Name: widget.member1nameController.text,user1Spent: 0,user2Name: widget.member2nameController.text,user2Spent: 0,user3Name: widget.member3nameController.text,user3Spent: 0);
       // ignore: sdk_version_set_literal
       dbmanager.insertTrips(tp).then((id)=>{
         widget.tripnameController.clear(),
         widget.member0nameController.clear(),
         widget.member1nameController.clear(),
         widget.member2nameController.clear(),
         widget.member3nameController.clear(),
        
        createInterstitialAd()..load()..show(),
         Navigator.push(context,MaterialPageRoute(builder: (context) => Page0()),),
       });
       }

       else if(widget.members==5){
         Trips tp = Trips(tripName: widget.tripnameController.text, members: 5,id: x,user0Name: widget.member0nameController.text,user0Spent: 0,user1Name: widget.member1nameController.text,user1Spent: 0,user2Name: widget.member2nameController.text,user2Spent: 0,user3Name: widget.member3nameController.text,user3Spent: 0,user4Name: widget.member4nameController.text,user4Spent: 0);
       // ignore: sdk_version_set_literal
       dbmanager.insertTrips(tp).then((id)=>{
         widget.tripnameController.clear(),
         widget.member0nameController.clear(),
         widget.member1nameController.clear(),
         widget.member2nameController.clear(),
         widget.member3nameController.clear(),
         widget.member4nameController.clear(),
        
        createInterstitialAd()..load()..show(),
         Navigator.push(context,MaterialPageRoute(builder: (context) => Page0()),),
       });
       }

       else if(widget.members==6){
         Trips tp = Trips(tripName: widget.tripnameController.text, members: 6,id: x,user0Name: widget.member0nameController.text,user0Spent: 0,user1Name: widget.member1nameController.text,user1Spent: 0,user2Name: widget.member2nameController.text,user2Spent: 0,user3Name: widget.member3nameController.text,user3Spent: 0,user4Name: widget.member4nameController.text,user4Spent: 0,user5Name: widget.member5nameController.text,user5Spent: 0);
       // ignore: sdk_version_set_literal
       dbmanager.insertTrips(tp).then((id)=>{
         widget.tripnameController.clear(),
         widget.member0nameController.clear(),
         widget.member1nameController.clear(),
         widget.member2nameController.clear(),
         widget.member3nameController.clear(),
         widget.member4nameController.clear(),
         widget.member5nameController.clear(),
        
        createInterstitialAd()..load()..show(),
         Navigator.push(context,MaterialPageRoute(builder: (context) => Page0()),),
       });
       }

       else if(widget.members==7){
         Trips tp = Trips(tripName: widget.tripnameController.text, members: 7,id: x,user0Name: widget.member0nameController.text,user0Spent: 0,user1Name: widget.member1nameController.text,user1Spent: 0,user2Name: widget.member2nameController.text,user2Spent: 0,user3Name: widget.member3nameController.text,user3Spent: 0,user4Name: widget.member4nameController.text,user4Spent: 0,user5Name: widget.member5nameController.text,user5Spent: 0,user6Name: widget.member6nameController.text,user6Spent: 0);
       // ignore: sdk_version_set_literal
       dbmanager.insertTrips(tp).then((id)=>{
         widget.tripnameController.clear(),
         widget.member0nameController.clear(),
         widget.member1nameController.clear(),
         widget.member2nameController.clear(),
         widget.member3nameController.clear(),
         widget.member4nameController.clear(),
         widget.member5nameController.clear(),
         widget.member6nameController.clear(),
        
        createInterstitialAd()..load()..show(),
         Navigator.push(context,MaterialPageRoute(builder: (context) => Page0()),),
       });
       }

       else if(widget.members==8){
         Trips tp = Trips(tripName: widget.tripnameController.text, members: 8,id: x,user0Name: widget.member0nameController.text,user0Spent: 0,user1Name: widget.member1nameController.text,user1Spent: 0,user2Name: widget.member2nameController.text,user2Spent: 0,user3Name: widget.member3nameController.text,user3Spent: 0,user4Name: widget.member4nameController.text,user4Spent: 0,user5Name: widget.member5nameController.text,user5Spent: 0,user6Name: widget.member6nameController.text,user6Spent: 0,user7Name: widget.member7nameController.text,user7Spent: 0);
       // ignore: sdk_version_set_literal
       dbmanager.insertTrips(tp).then((id)=>{
         widget.tripnameController.clear(),
         widget.member0nameController.clear(),
         widget.member1nameController.clear(),
         widget.member2nameController.clear(),
         widget.member3nameController.clear(),
         widget.member4nameController.clear(),
         widget.member5nameController.clear(),
         widget.member6nameController.clear(),
         widget.member7nameController.clear(),
        
          createInterstitialAd()..load()..show(),
         Navigator.push(context,MaterialPageRoute(builder: (context) => Page0()),),
       });
       }

       else if(widget.members==9){
         Trips tp = Trips(tripName: widget.tripnameController.text, members: 9,id: x,user0Name: widget.member0nameController.text,user0Spent: 0,user1Name: widget.member1nameController.text,user1Spent: 0,user2Name: widget.member2nameController.text,user2Spent: 0,user3Name: widget.member3nameController.text,user3Spent: 0,user4Name: widget.member4nameController.text,user4Spent: 0,user5Name: widget.member5nameController.text,user5Spent: 0,user6Name: widget.member6nameController.text,user6Spent: 0,user7Name: widget.member7nameController.text,user7Spent: 0,user8Name: widget.member8nameController.text,user8Spent: 0);
       // ignore: sdk_version_set_literal
       dbmanager.insertTrips(tp).then((id)=>{
         widget.tripnameController.clear(),
         widget.member0nameController.clear(),
         widget.member1nameController.clear(),
         widget.member2nameController.clear(),
         widget.member3nameController.clear(),
         widget.member4nameController.clear(),
         widget.member5nameController.clear(),
         widget.member6nameController.clear(),
         widget.member7nameController.clear(),
         widget.member8nameController.clear(),
        
          createInterstitialAd()..load()..show(),
         Navigator.push(context,MaterialPageRoute(builder: (context) => Page0()),),
       });
       }

       else if(widget.members==10){
         Trips tp = Trips(tripName: widget.tripnameController.text, members: 10,id: x,user0Name: widget.member0nameController.text,user0Spent: 0,user1Name: widget.member1nameController.text,user1Spent: 0,user2Name: widget.member2nameController.text,user2Spent: 0,user3Name: widget.member3nameController.text,user3Spent: 0,user4Name: widget.member4nameController.text,user4Spent: 0,user5Name: widget.member5nameController.text,user5Spent: 0,user6Name: widget.member6nameController.text,user6Spent: 0,user7Name: widget.member7nameController.text,user7Spent: 0,user8Name: widget.member8nameController.text,user8Spent: 0,user9Name: widget.member9nameController.text,user9Spent: 0);
       // ignore: sdk_version_set_literal
       dbmanager.insertTrips(tp).then((id)=>{
         widget.tripnameController.clear(),
         widget.member0nameController.clear(),
         widget.member1nameController.clear(),
         widget.member2nameController.clear(),
         widget.member3nameController.clear(),
         widget.member4nameController.clear(),
         widget.member5nameController.clear(),
         widget.member6nameController.clear(),
         widget.member7nameController.clear(),
         widget.member8nameController.clear(),
         widget.member9nameController.clear(),
        
        createInterstitialAd()..load()..show(),
         Navigator.push(context,MaterialPageRoute(builder: (context) => Page0()),),
       });
       }
       
     }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  height: 10.0,
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

                SizedBox(height: 60.0,),

                //User INFO
                


                
                SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:15.0),
                                  child: Container(
                     margin: EdgeInsets.only(top:30.0,),                    
                      decoration: BoxDecoration(
                        color: Colors.white,
                         border:Border(  
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
                                  
                                  SizedBox(height: 20.0,),
                                  
                                  
                                  //trip name get

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
                                      hintText: 'Enter trip name',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    controller: widget.tripnameController,
                                    onChanged: setTripName(),
                                  ),
                                  ),
                              ],
                            ),

                            SizedBox(height: 40,),

                            Text('Enter member names: '),

                            SizedBox(height: 30,),

                            //MEMBER0
                           
                           (widget.members==2)?
                           MemberFields(members: 2,member0nameController: widget.member0nameController,member0name: widget.member0name, member1nameController: widget.member1nameController, member1name: widget.member1name,):
                           (widget.members==3)?
                           MemberFields(members: 3,member0nameController: widget.member0nameController,member0name: widget.member0name, member1nameController: widget.member1nameController, member1name: widget.member1name, member2nameController: widget.member2nameController, member2name: widget.member2name,):
                           (widget.members==4)?
                           MemberFields(members: 4,member0nameController: widget.member0nameController,member0name: widget.member0name, member1nameController: widget.member1nameController, member1name: widget.member1name, member2nameController: widget.member2nameController, member2name: widget.member2name, member3nameController: widget.member3nameController, member3name: widget.member3name, ):
                           (widget.members==5)?
                           MemberFields(members: 5,member0nameController: widget.member0nameController,member0name: widget.member0name, member1nameController: widget.member1nameController, member1name: widget.member1name, member2nameController: widget.member2nameController, member2name: widget.member2name, member3nameController: widget.member3nameController, member3name: widget.member3name, member4nameController: widget.member4nameController, member4name: widget.member4name,):
                           (widget.members==6)?
                           MemberFields(members: 6,member0nameController: widget.member0nameController,member0name: widget.member0name, member1nameController: widget.member1nameController, member1name: widget.member1name, member2nameController: widget.member2nameController, member2name: widget.member2name, member3nameController: widget.member3nameController, member3name: widget.member3name, member4nameController: widget.member4nameController, member4name: widget.member4name,member5nameController: widget.member5nameController, member5name: widget.member5name,):
                           (widget.members==7)?
                           MemberFields(members: 7,member0nameController: widget.member0nameController,member0name: widget.member0name, member1nameController: widget.member1nameController, member1name: widget.member1name, member2nameController: widget.member2nameController, member2name: widget.member2name, member3nameController: widget.member3nameController, member3name: widget.member3name, member4nameController: widget.member4nameController, member4name: widget.member4name,member5nameController: widget.member5nameController, member5name: widget.member5name,member6nameController: widget.member6nameController, member6name: widget.member6name,):
                           (widget.members==8)?
                           MemberFields(members: 8,member0nameController: widget.member0nameController,member0name: widget.member0name, member1nameController: widget.member1nameController, member1name: widget.member1name, member2nameController: widget.member2nameController, member2name: widget.member2name, member3nameController: widget.member3nameController, member3name: widget.member3name, member4nameController: widget.member4nameController, member4name: widget.member4name,member5nameController: widget.member5nameController, member5name: widget.member5name,member6nameController: widget.member6nameController, member6name: widget.member6name,member7nameController: widget.member7nameController, member7name: widget.member7name,):
                           (widget.members==9)?
                           MemberFields(members: 9,member0nameController: widget.member0nameController,member0name: widget.member0name, member1nameController: widget.member1nameController, member1name: widget.member1name, member2nameController: widget.member2nameController, member2name: widget.member2name, member3nameController: widget.member3nameController, member3name: widget.member3name, member4nameController: widget.member4nameController, member4name: widget.member4name,member5nameController: widget.member5nameController, member5name: widget.member5name,member6nameController: widget.member6nameController, member6name: widget.member6name,member7nameController: widget.member7nameController, member7name: widget.member7name,member8nameController: widget.member8nameController, member8name: widget.member8name,):
                           (widget.members==10)?
                           MemberFields(members: 10,member0nameController: widget.member0nameController,member0name: widget.member0name, member1nameController: widget.member1nameController, member1name: widget.member1name, member2nameController: widget.member2nameController, member2name: widget.member2name, member3nameController: widget.member3nameController, member3name: widget.member3name, member4nameController: widget.member4nameController, member4name: widget.member4name,member5nameController: widget.member5nameController, member5name: widget.member5name,member6nameController: widget.member6nameController, member6name: widget.member6name,member7nameController: widget.member7nameController, member7name: widget.member7name,member8nameController: widget.member8nameController, member8name: widget.member8name,member9nameController: widget.member9nameController, member9name: widget.member9name,):Text('Error'),
                            
                             

                            
                            
                            

                            
                            SizedBox(height:40,),
                            //Continue or Back buttons
                                    Row(children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                              height: 80,                                      
                                              child: FlatButton( 
                                                shape: RoundedRectangleBorder(
                                                side: BorderSide(color: Colors.black,),
                                              ),

                                              color: Colors.black,
                                              child: new Text('Continue',
                                                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                                              onPressed: () async{
                                                   if(widget.member0nameController.text=="" || widget.member1nameController.text=="" || widget.tripnameController.text==""){
                                                  return showDialog(
                                                    context: context,
                                                    builder: (BuildContext context){
                                                      return AlertDialog(  
                                                        title: Text('Invalid input'),
                                                        content: SingleChildScrollView(  
                                                          child: ListBody(  
                                                            children: <Widget>[
                                                              Text('One or more parameters are invalid'),
                                                            ],
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          FlatButton( 
                                                            child: Text('OK'),
                                                            onPressed: (){
                                                              Navigator.pop(context);
                                                            },
                                                          )
                                                        ],
                                                      );
                                                    }
                                                    
                                                  );
                                                }

                                                else{
                                                  _submitTrips(context);
                                                }
                                                  
                                              },
                                            ),
                                      ),
                                      ),
                                    

                                    SizedBox( 
                                      width:12,
                                    ),

                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          height: 80,
                                          child: FlatButton(                                  
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(color: Colors.black,),
                                              ),
                                              color: Color(0xFFEEEEEE),
                                              child: new Text('Back',
                                                  style: new TextStyle(fontSize: 16.0, color: Colors.black),),
                                              onPressed: () {                                          
                                                Navigator.push(context,MaterialPageRoute(builder: (context) => Page0()),);
                                              },
                                            ),
                                      ),
                                      
                                    ),

                                    
                                  ]),


                                  SizedBox(height: 60,),

                                   
                                            
                                   
                                  ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                                ),
                ),
            ],
          ),
              ),
      ),
    ),
    );
  }
}








