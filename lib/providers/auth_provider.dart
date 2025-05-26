// import 'package:flutter/material.dart';
// import 'dart:convert';

// class AuthProvider with ChangeNotifier {
//   String? _token;
//   String? get token => _token;

//   Future<void> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('http://127.0.0.1:8000/api/login'), // Ganti dengan URL API-mu
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'password': password}),
//     );

//     if (response.statusCode == 200) {
//       _token = jsonDecode(response.body)['token'];
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('token', _token!);
//       notifyListeners();
//     } else {
//       throw Exception('Login gagal: ${response.body}');
//     }
//   }

//   Future<void> register(String name, String email, String password) async {
//     final response = await http.post(
//       Uri.parse('http://127.0.0.1:8000/api/register'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'name': name, 'email': email, 'password': password}),
//     );

//     if (response.statusCode == 201) {
//       _token = jsonDecode(response.body)['token'];
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('token', _token!);
//       notifyListeners();
//     } else {
//       throw Exception('Registrasi gagal: ${response.body}');
//     }
//   }

//   Future<void> loadToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     _token = prefs.getString('token');
//     notifyListeners();
//   }

//   Future<void> logout() async {
//     _token = null;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//     notifyListeners();
//   }
// }
