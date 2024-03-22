import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'FrostedGlassBox.dart';
import 'user.dart';

class Home extends StatelessWidget {
  final User user;

  const Home({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Print the profile picture URL to the console
    print('Profile Picture URL: ${user.profilePictureUrl}');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(user: user),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    try {
      // Decode base64-encoded image data
      imageBytes = base64Decode(user.profilePictureUrl);
    } catch (e) {
      // Error handling: if decoding fails, display a placeholder or error message
      print('Error decoding profile picture: $e');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: CircleAvatar(
           // Optional: Set a background color for the CircleAvatar
          radius: 30, // Optional: Adjust the size of the CircleAvatar
          child: imageBytes != null && imageBytes.isNotEmpty
              ? ClipOval(
                  child: Image.memory(
                    imageBytes,
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(Icons.error), // Display an error icon if imageBytes is null or empty
        ),
      ),
      body: Center(
        child: Text('Welcome ${user.username}'),
      ),
    );
  }
}
