import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
   Register({super.key, required this.title});
  String title;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),

      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            
               Text('Registration Form', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              
              SizedBox(
                width:  300,
                height: 80,
               child: TextField(
                
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(labelText: 'Enter Username',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                
                )
              ),
              SizedBox(
                width:  300,
                height: 80,
               child: TextField(
                
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(labelText: 'E-mail Address',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                
                )
              ),
              SizedBox(
                width:  300,
                height: 80,
               child: TextField(
                
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(labelText: 'Create Password',
                
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                obscureText: true,
                )
              ),
              SizedBox(
                width:  300,
                height: 80,
               child: TextField(
                
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(labelText: 'Confirm password',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                obscureText: true,
                )
              ),
              SizedBox(
                width:  300,
                height: 80,
               child: TextField(
                
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(labelText: 'Enter Phone Number',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                
                )
              ),
              TextButton(onPressed: , child: child)
              
        
        
        
        
          ]
        )

      )


    );
  }
}