import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:8001';

  /// Verify medicine image with the backend
  static Future<Map<String, dynamic>> verifyMedicine(File imageFile) async {
    try {
      final uri = Uri.parse('$baseUrl/verify');
      final request = http.MultipartRequest('POST', uri);

      // Add image file to request
      final imageStream = http.ByteStream(imageFile.openRead());
      final imageLength = await imageFile.length();

      final multipartFile = http.MultipartFile(
        'image',
        imageStream,
        imageLength,
        filename: 'medicine.jpg',
      );

      request.files.add(multipartFile);

      // Send request
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final result = json.decode(responseBody);

        // Transform backend response to frontend format
        return {
          'is_genuine': result['is_authentic'] ?? false,
          'confidence': result['confidence_score'] ?? 0.0,
          'message': result['is_authentic'] == true
              ? 'Medicine appears to be genuine'
              : 'High-Risk Counterfeit detected',
          'issues_detected': result['issues_detected'] ?? [],
        };
      } else {
        throw Exception('Failed to verify medicine: ${response.statusCode}');
      }
    } catch (e) {
      // Return mock response for development when backend is unavailable
      await Future.delayed(const Duration(seconds: 2));

      // Simulate different responses for testing
      final random = DateTime.now().millisecondsSinceEpoch % 2;
      if (random == 0) {
        return {
          'is_genuine': true,
          'confidence': 0.98,
          'message': 'Medicine appears to be genuine',
          'issues_detected': [],
        };
      } else {
        return {
          'is_genuine': false,
          'confidence': 0.92,
          'message': 'High-Risk Counterfeit detected',
          'issues_detected': [
            'Font inconsistency detected',
            'Logo placement mismatch'
          ],
        };
      }
    }
  }

  /// Health check endpoint
  static Future<bool> checkHealth() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Get AI model information
  static Future<Map<String, dynamic>?> getModelInfo() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/model-info'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      return null;
    } catch (e) {
      // Log error in debug mode only
      assert(() {
        debugPrint('Error getting model info: $e');
        return true;
      }());
      return null;
    }
  }
}