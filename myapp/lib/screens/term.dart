import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Term extends StatefulWidget {
  const Term({Key? key}) : super(key: key);

  @override
  State<Term> createState() => _TermState();
}

class _TermState extends State<Term> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      appBar: AppBar(
        
        elevation: 0,
        title: Text("Term et contrat",style:TextStyle(color: Colors.black)),
        leading: IconButton(icon: Icon(Icons.arrow_back,), onPressed: () {  },color: Colors.black,),
        backgroundColor: Colors.white,
      ),
      body :Center(
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children:[
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child:Text("Coucou")),
          RaisedButton(
              onPressed: () => print("Accepté"),
              color: Colors.grey,
              
              padding: EdgeInsets.symmetric(vertical: 10,),
              child:Center(child:Text("Accept",
              style: TextStyle(
                color: Colors.white,
              ))))
              ,]),
          
        ),
        backgroundColor: Colors.white,
      )
      );
  }
}