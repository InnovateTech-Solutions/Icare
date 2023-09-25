import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/color.dart';
import '../../model/user_model.dart';
import 'firebase_storge_services.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  late UserModel userModel;

  void setUserModel(UserModel userModel) {
    this.userModel = userModel;
  }

  createUser(UserModel user) {
    setUserModel(user);
    _db
        .collection("User")
        .add(user.tojason())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created",
            snackPosition: SnackPosition.BOTTOM,
            colorText: ColorConstants.mainScaffoldBackgroundColor,
            backgroundColor: ColorConstants.snakbarColorsuccessful))
        .catchError((error, stackTrace) {
      Get.snackbar(error.toString(), "Something went wrong , try agin",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstants.mainScaffoldBackgroundColor,
          backgroundColor: ColorConstants.snakbarColorError);
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("User").where("Email", isEqualTo: email).get();
    final userdata = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    userModel = userdata;
    return userdata;
  }

  Widget getUserImageUrl() {
    if (userModel != null && userModel.imageUrl != null) {
      return CircleAvatar(
          radius: 70, // Adjust the radius as needed
          backgroundImage: NetworkImage(userModel.imageUrl!));
    } else {
      return SvgPicture.asset(
        "assets/Profilepic.svg",
        width: 100.w,
        height: 100.h,
      );
    }
  }

  void addImage() {}

  void pickUpImage() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 500.h,
      maxWidth: 500.w,
      imageQuality: 75,
    );
    print('${file!.path}');
    if (file == null) return;
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child("images");

    Reference referenceImageToUpload = referenceDirImage.child(file.path);
    try {
      await referenceImageToUpload.putFile(File(file!.path));
      print("first image " + await referenceImageToUpload.getDownloadURL());
      print(userModel.email);
      userModel.imageUrl = await referenceImageToUpload.getDownloadURL();

      addImage();
    } catch (error) {}
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("User").doc(user.id).update(user.tojason());
  }

  final allImg = <String>[].obs;
  @override
  void OnReady() {
    GetAllImg();
    super.onReady();
  }

  Future<void> GetAllImg() async {
    List<String> imgName = [
      "offer1"
          "offer2"
          "offer3"
    ];
    try {
      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorgeService>().getImage(img);
        allImg.add(imgUrl!);
      }
    } catch (e) {}
  }
}
