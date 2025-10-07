import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  // For Android emulator, backend on host: use 10.0.2.2
  static const String _baseUrl = 'http://10.0.2.2:8000';

  Future<Map<String, dynamic>> verifyImage(File imageFile) async {
    final uri = Uri.parse('$_baseUrl/verify');
    final request = http.MultipartRequest('POST', uri);

    try {
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          imageFile.path,
        ),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw HttpException('Server error: ${response.statusCode} - ${response.body}');
      }
    } on SocketException {
      throw const HttpException('Network error. Check your internet connection.');
    } on FormatException catch (e) {
      throw HttpException('Invalid response format: $e');
    } catch (e) {
      rethrow;
    }
  }
}
