import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'helper_functions.dart' as HelperFunctions;
import 'package:image_picker/image_picker.dart';
import 'theme/text_field_theme.dart';

class Register extends StatefulWidget { 
  const Register({super.key});

  @override
  State<Register> createState() => _LoginState();
}

class _LoginState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  String url = "http://192.168.100.113:8080/user/Register";
   File ? _selectedImage;
  final picker = ImagePicker();
  
  late User user = User(
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    password: '',
    profilePictureUrl: '',
  );
   bool _obscureText = true;
  Future save() async{
 var res = await http.post(Uri.parse(url), headers: {'Content-Type': 'application/json'}, body: json.encode({
  'email': user.email,
  'password': user.password,
  'firstname':user.firstName,
  'lastname':user.lastName,
  'username':user.username,
  'profilePictureUrl':_selectedImage,
}));

    print(res.body);
    if(res.body != null){
      Navigator.pop(context);
    }
    
  }
 

Future  getImage() async {
   final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnedImage==null) return ;
    setState(() {
     
        _selectedImage = File(returnedImage!.path);
     
    });
  }




  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
    appBar: AppBar(),
    body: SingleChildScrollView(child: 
    
    Padding(padding: EdgeInsets.all(30),
    
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
      Text("Let's Create your Account",style: Theme.of(context).textTheme.headlineMedium,),
      SizedBox(height: 32,),
      Form(child: Column(children: [
        Row(children: [
          Expanded(
            child: TextFormField(
              validator: (value){
    if(value!.isEmpty){
      return "Firstname is empty";
    }
    return null;
  },
  controller: TextEditingController(text: user.firstName),
              expands: false,
              decoration:  InputDecoration(
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
                labelText: 'Firstname',
                prefixIcon: Icon(Icons.person)
              ),
            ),
          ),
          SizedBox(width: 16,),
          Expanded(
            child: TextFormField(
              validator: (value){
    if(value!.isEmpty){
      return "Lastname is empty !!";
    }
    return null;
  },
  controller: TextEditingController(text: user.lastName),
              expands: false,
              decoration:  InputDecoration(
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
                labelText: 'lastname',
                prefixIcon: Icon(Icons.person)
              ),
            ),
          )
        ],),

        SizedBox(height: 16,),
        TextFormField(
          validator: (value){
    if(value!.isEmpty){
      return "Username is empty";
    }
    return null;
  },
  controller: TextEditingController(text: user.username),
              expands: false,
              decoration:  InputDecoration(
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
                labelText: 'Username',
                prefixIcon: Icon(Icons.verified_user_rounded)
              ),
            ),
         SizedBox(height: 16,),
        TextFormField(
          validator: (value){
    if(value!.isEmpty){
      return "email is empty";
    }
    return null;
  },
  controller: TextEditingController(text: user.email),
              expands: false,
              decoration:  InputDecoration(
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
                labelText: 'Email',
                prefixIcon: Icon(Icons.email)
              ),
            ),
           SizedBox(height: 16,),
       TextFormField(
  validator: (value){
    if(value!.isEmpty){
      return "password is empty";
    }
    return null;
  },
  controller: TextEditingController(text: user.password),
  onChanged: (value) => {
    user.password = value
  },
  obscureText: _obscureText, // Add a variable to toggle password visibility
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
      icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText; // Toggle password visibility
        });
      },
    ),
  ),
),

            SizedBox(height: 16,),

            // Row(
            //   children: [
            //     MainAxisAlignment:MainAxisAlignment.Center,
            //     Text("Profile Picture",style: Theme.of(context).textTheme.labelLarge,),
            //     SizedBox(width: 20,),
            //     ElevatedButton(onPressed: (){ getImage();}, child: Text('Pick Image from Gallery',
            //     style: TextStyle(
            //         color: Colors.white,
            //     ),
                
            //     ),style: ButtonStyle(
            //              backgroundColor: MaterialStateProperty.all<Color>(
            //              Colors.black,
            //                 ),
                            
            //           ),),
            //   ],
            // ),
            Row(
  mainAxisAlignment: MainAxisAlignment.center, // Use enum value directly without "MainAxisAlignment:"
  children: [
    Text(
      "Profile Picture",
      style: Theme.of(context).textTheme.labelLarge,
    ),
    SizedBox(width: 7),
    ElevatedButton(
      onPressed: () {
        getImage(); // Call your getImage function when the button is pressed
      },
      child: Text(
        'Pick Image from Gallery',
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    ),
  ],
),



                SizedBox(height: 16.0,),
                  
                  SizedBox(width: double.infinity,child:ElevatedButton(onPressed:() {
                     if(_formkey.currentState!.validate()){
                      save();
                     }
                  }, child: Text('Sign Up',style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all<Color>(
                     Colors.blue,
                        ),
                        
                  )
                  ,)),
          
        

      ],)),


        SizedBox(height: 16.0,),

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
    Text("Or Sign Up with", style: Theme.of(context).textTheme.labelMedium),
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

    ]),
    )
    ),






    );
  }
}
