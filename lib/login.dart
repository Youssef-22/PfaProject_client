import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/user.dart';
import 'package:http/http.dart' as http;
import 'helper_functions.dart' as HelperFunctions;
import 'theme/text_field_theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  final _formkey = GlobalKey<FormState>();
  final String url = "http://192.168.100.113:8080/user/login";
   
  bool _obscureText = true;
  late User user = User(
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    password: '',
    profilePictureUrl: '',
  );

  Future<void> save() async {
    var res = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': user.email,
        'password': user.password,
      }),
    );
    if (res.statusCode == 200) {
      // Successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      // Invalid credentials
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Invalid email or password."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      
      body: SingleChildScrollView(
        
        padding: EdgeInsets.all(24.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Image(
              height: 150,
              image: AssetImage(dark ? 'lib/images/eelogowhite.png' : 'lib/images/eelogo.png'),
            ),
            Text(
              'Welcome Back',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10),
            Text(
              'Discover Limitless Exercises and solutions in all the fields of studies',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 20),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                       errorMaxLines: 3,
                        prefixIconColor: Colors.grey,
                        suffixIconColor: Colors.grey,
                        // constraints: const BoxConstraints.expand (height: 14.inputFieldHeight),
                        labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
                        hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
                        errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
                        floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
                        border: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide (width: 1, color: Colors.grey),
                        ),

                        enabledBorder: const OutlineInputBorder().copyWith(
                          borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide (width: 1, color: Colors.grey),
                        ),
                        focusedBorder:const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular (14),
                        borderSide: const BorderSide (width: 1, color: Colors.black12),
                        ),
                        errorBorder: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide (width: 1, color: Colors.red),
                        ),
                        focusedErrorBorder: const OutlineInputBorder().copyWith(
                          borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide (width: 2, color: Colors.orange)),
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        user.email = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      errorMaxLines: 3,
                        prefixIconColor: Colors.grey,
                        suffixIconColor: Colors.grey,
                        // constraints: const BoxConstraints.expand (height: 14.inputFieldHeight),
                        labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
                        hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
                        errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
                        floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
                        border: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide (width: 1, color: Colors.grey),
                        ),

                        enabledBorder: const OutlineInputBorder().copyWith(
                          borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide (width: 1, color: Colors.grey),
                        ),
                        focusedBorder:const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular (14),
                        borderSide: const BorderSide (width: 1, color: Colors.black12),
                        ),
                        errorBorder: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide (width: 1, color: Colors.red),
                        ),
                        focusedErrorBorder: const OutlineInputBorder().copyWith(
                          borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide (width: 2, color: Colors.orange)),
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        user.password = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(width: double.infinity,child:ElevatedButton(onPressed:() {
                     if(_formkey.currentState!.validate()){
                      save();
                     }
                  }, child: Text('Sign In',style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all<Color>(
                     Colors.blue,
                        ),
                        
                  )
                  ,)),

                  SizedBox(height: 16.0,),
                  SizedBox(width: double.infinity,child:OutlinedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                  }, child: Text('Create Account'),
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: Colors.blue,
                        width: 1
                      )
                    ),
                  ),
                  
                  )),
                ],
              ),
            ),

            SizedBox(height: 20,),

          Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Flexible(
      child: Divider(
        color: dark ? Colors.white : Colors.black,
        thickness: 0.5,
        indent: 60,
        endIndent: 5,
      ),
    ), 
    Text("Or Sign In with", style: Theme.of(context).textTheme.labelMedium),
    Flexible(
      child: Divider(
        color: dark ? Colors.white : Colors.black,
        thickness: 0.5,
        indent: 5,
        endIndent: 60,
      ),
    )
  ],
),

SizedBox(height: 16,),


SizedBox(width: double.infinity,child:ElevatedButton(onPressed:() {
                    
                     
                  },
                  
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                Image(image: AssetImage('lib/images/gglogo2.png'),height: 30,width: 30,),
                   
                SizedBox(width: 10), // Adjust spacing between image and text as needed
                Text(
                  'Google',
                  style: TextStyle(color: Colors.white),
                   ),
                  ]),
                  
                  style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all<Color>(
                     Colors.black,
                        ),
                        
                  )
                  ,)),



           


          ],
        ),
      ),
    );
  }
}
