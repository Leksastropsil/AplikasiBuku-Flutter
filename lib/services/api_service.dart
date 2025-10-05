import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/buku.dart';

class ApiService {
  // 'http://10.0.2.2:8080'
  // 'http://localhost:8080'
  static const String baseUrl = 'http://10.0.2.2:8080';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/login'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> register(String nama, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/registrasi'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'nama': nama, 'email': email, 'password': password}),
    );
    return jsonDecode(response.body);
  }

  Future<List<Buku>> getBooks() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/books'));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Buku> books = body.map((dynamic item) => Buku.fromJson(item)).toList();
        return books;
      } else {
        throw Exception('Gagal memuat daftar buku');
      }
    } catch (e) {
      throw Exception('Gagal terhubung ke server: ${e.toString()}');
    }
  }

  Future<bool> addBook(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/books'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(data),
      );
      return response.statusCode == 201;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> updateBook(int id, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/api/books/$id'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(data),
      );
      return response.statusCode == 200;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> deleteBook(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/api/books/$id'));
      return response.statusCode == 200;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}