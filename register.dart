
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
   Register({super.key, required this.title});
  String title;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _user = '',pass='',pass2='',email='';
  int age=0,phone=0;
  String? _gender;
  final List<String> _genderOptions = ['Male', 'Female', 'Other'];
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mailTextFieldController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();


  @override
  void dispose() {
    _usernameController.dispose();
    _mailTextFieldController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    _password2Controller.dispose();
    super.dispose();
  }

  void _savedata() async {
    if(pass == pass2 && _user.isNotEmpty && pass.isNotEmpty && email.isNotEmpty && phone.isNaN && _gender!.isNotEmpty && age>0){
      final prefs = await SharedPreferences.getInstance();
      setState((){
        prefs.setString('user', _user);
        prefs.setString('pass',pass);
        prefs.setString('email',email);
        prefs.setInt('phone',phone);
        prefs.setString('gender',_gender!);
        prefs.setInt('age',age);
        Navigator.pop(context);
      });
    }
    else{
      if(pass != pass2){
      showDialog(
      context: context,
      builder:(BuildContext context){
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Passwords Dosent Match'),
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
    
    else{
    showDialog(
      context: context,
      builder:(BuildContext context){
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Please Fill All Fields'),
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
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Registration Form', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(
              width:  300,
              height: 80,
              child: TextField(
                controller: _usernameController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'Enter Username',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                onChanged: (value){
                  setState((){
                    _user = value;
                  });
                },
              ),
            ),
             SizedBox(
              width:  300,
              height: 80,
              child: TextField(
                controller: _mailTextFieldController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'E-mail Address',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                onChanged: (value){
                  setState((){
                    email = value;
                  });
                },
              ),
            ),
             SizedBox(
              width:  300,
              height: 80,
              child: TextField(
                controller: _passwordController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'Create Password',
                
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                obscureText: true,
                onChanged: (value){
                  setState((){
                    pass = value;
                  });
                }
              ),
            ),
             SizedBox(
              width:  300,
              height: 80,
              child: TextField(
                controller: _password2Controller,
                onChanged: (value){
                  setState((){
                    pass2 = value;
                  });
                },
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'Confirm password',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                obscureText: true,

              ),
            ),
             SizedBox(
              width:  300,
              height: 80,
              child: TextField(
                controller: _phoneController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'Enter Phone Number',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                onChanged: (value){
                  setState((){
                    phone = value as int;
                  });
                }
              ),
            ),
            SizedBox(
              width: 300,
              height: 80,
              child: TextField(
                controller: _ageController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: "Enter Age",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                onChanged: (value){
                  setState((){
                    age = int.parse(value);
                  });
                }
              ),

            ),
            SizedBox(
              width: 300,
              height: 80,
            child: DropdownButtonFormField<String>(
              value: _gender,
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
              ),
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
              items: _genderOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ),
            TextButton(onPressed: _savedata, child: const Text('Register'))
          ]
        )

      )


    );
  }
}
