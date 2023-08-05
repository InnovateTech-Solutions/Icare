import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserService extends GetxController {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  uploadFile(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await storage.ref('filename/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult result = await storage.ref('').listAll();

    result.items.forEach((firebase_storage.Reference reference) {
      print(" Found file $reference");
    });

    return result;
  }

   Future<void> passwordReset(context, email) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
       showDialog(context: context, builder: (context){
        return  const AlertDialog(
          content: Text('Password reset link sent! Check your email'),
            );
          }
          );
    } on FirebaseAuthException catch (e){

      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      }
      );
    }

  }
}
