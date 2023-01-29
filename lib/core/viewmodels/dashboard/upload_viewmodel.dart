import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreenViewmodel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  File? _buidlingPhoto;
  File? get buidlingPhoto => _buidlingPhoto;
  set buidlingPhoto(File? value) {
    _buidlingPhoto = value;
    notifyListeners();
  }

  String errorMessage = "";
  String successMessage = "";

  Future<bool> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.camera);
      if (pickedImage == null) return false;
      buidlingPhoto = File(pickedImage.path);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> analysePickedImage() async {
    return true;
  }

  Future<bool> submitData() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 3), () {}).then((value) {
      isLoading = false;
    });
    return true;
  }

  Future uploadPhoto(File photo) async {
    isLoading = true;
  }

  String _imageURL = "";
  String get imageURL => _imageURL;
  set imageURL(String val) {
    _imageURL = val;
    notifyListeners();
  }

  void updatePhotoUrl(String url) {
    notifyListeners();
  }

  Future<void> update() async {}
}
