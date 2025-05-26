// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:project_akhir/models/user.dart';
// import 'package:project_akhir/models/scan.dart';

// class ApiService {
//   static const String baseUrl = 'http://127.0.0.1:8000/api';

//   Future<Map<String, dynamic>> register(
//       String name, String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/register'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'name': name, 'email': email, 'password': password}),
//     );
//     return jsonDecode(response.body);
//   }

//   Future<Map<String, dynamic>> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'password': password}),
//     );
//     return jsonDecode(response.body);
//   }

//   Future<void> uploadScan(File image, String token) async {
//     var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/scan'));
//     request.headers['Authorization'] = 'Bearer $token';
//     request.files.add(await http.MultipartFile.fromPath('image', image.path));
//     await request.send();
//   }

//   Future<List<Scan>> getScans(String token) async {
//     final response = await http.get(
//       Uri.parse('$baseUrl/scans'),
//       headers: {'Authorization': 'Bearer $token'},
//     );
//     final data = jsonDecode(response.body) as List;
//     return data.map((json) => Scan.fromJson(json)).toList();
//   }
// }
