
import 'package:fitcheck/register.dart';
import 'package:flutter/material.dart';
import 'hform.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   
   String user = '',pass='';
  final TextEditingController _usernameFieldController = TextEditingController();
  final  TextEditingController _passwordController = TextEditingController();
 
 @override
 void initState(){
  super.initState();
  _checkon();
 }

 Future<void> _checkon() async{
  final prefs = await SharedPreferences.getInstance();
  setState((){
    user = prefs.getString('user')?? '';
    pass = prefs.getString('pass')?? '';
  });
 }

void  login(){
  if(_usernameFieldController.text == user && _passwordController.text == pass){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HForm(title: 'FORM')),);
  }
  else{
    showDialog(
      context: context,
      builder:(BuildContext context){
        return AlertDialog(
          title:  Text('Error $user'),
          content:  Text('Wrong Username Or Password $pass'),
          actions: <Widget>[
             TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: const Text('OK'),
            )
          ]
          );
        
      }

    );
  }
}
  

  @override
  void dispose() {
    _usernameFieldController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body:  Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             
              
               const Text('LOGIN/SIGN IN',style: TextStyle(fontWeight: FontWeight.bold,fontSize:25),),
               SizedBox(
                width: 300.0,
                height: 100.0,
               child: TextField(
                controller: _usernameFieldController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'Enter Username',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                onChanged: (value){
                  setState((){
                    _usernameFieldController.text = value;
                  });
                },
                ),
               ),
                SizedBox(
                width: 300.0,
                height: 100.0,
               child: TextField(
                controller: _passwordController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                onChanged: (value) {
                  setState((){
                    pass= value;
                  });
                },
              ),
               ),
              ElevatedButton(onPressed: login,
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
               child: const Icon(Icons.login)),
          ],
          
        ),
        
          
      ),
      
        
      floatingActionButton:  FloatingActionButton(
        
        tooltip: 'Sign Up/Register',
        onPressed: () { 
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> Register(title: 'Register')));
        },
        child: const Icon(Icons.app_registration_rounded),
      ), 
      
    );
  }
}
