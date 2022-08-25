
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child :Scaffold(
        appBar: AppBar(
          title: Center(
            child:Text("Titre application")
            ),
        ),
        body:Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              RichText(
                text: TextSpan(
                  text:"Bienvenue \n".toUpperCase(),
                  style: TextStyle(
                    color:Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text:"sur ma première application".toLowerCase(),
                      style: TextStyle(
                        fontSize: 15,
                        color:Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      )
                  )],
                ),
              ),
            SizedBox(
              height: 10,
            ),
            Text("Alors ça a de la gueule",style: TextStyle(
                fontStyle: FontStyle.italic, 
              ),
              ),
            SizedBox(
              height: 50,
            ),
            Form(child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Entrez votre email"),
                SizedBox(height:10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: Colors.grey,)
                    ),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: Colors.grey,)),
                  ),
                ),
                SizedBox(height: 10,)
                ]),
            ),
            Center(child: RaisedButton(
              onPressed: () => print("Appuyé"),
              color: Theme.of(context).primaryColor,
              
              padding: EdgeInsets.symmetric(vertical: 10,),
              child:Center(child:Text("Continue".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
              ),
              ),),
              ),),
          ],
          ),
          )
        ),
        backgroundColor: Colors.white,
      )
    );
  }
}