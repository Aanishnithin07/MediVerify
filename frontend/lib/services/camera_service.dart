import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService {
  static final ImagePicker _picker = ImagePicker();
  
  /// Request camera permission
  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }
  
  /// Take a photo using image picker
  static Future<File?> takePhoto() async {
    try {
      // Check permission first
      final hasPermission = await requestCameraPermission();
      if (!hasPermission) {
        return null;
      }
      
      // Take photo
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        maxWidth: 1920,
        maxHeight: 1080,
      );
      
      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      // Log error in debug mode only
      assert(() {
        debugPrint('Error taking photo: $e');
        return true;
      }());
      return null;
    }
  }
  
  /// Pick image from gallery (alternative option)
  static Future<File?> pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      
      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      // Log error in debug mode only
      assert(() {
        debugPrint('Error picking image: $e');
        return true;
      }());
      return null;
    }
  }
}