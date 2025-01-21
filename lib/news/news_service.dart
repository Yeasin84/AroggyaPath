import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  static const String _apiKey = '79358265d90a43768cfbccaa1047194f';
  static const String _baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<List<dynamic>> fetchHealthNews() async {
    final Uri url = Uri.parse(
        '$_baseUrl?category=health&language=en&apiKey=$_apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['articles']; // List of news articles
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
