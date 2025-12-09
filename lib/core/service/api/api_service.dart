import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_requirements/core/models/alticle.dart';
import 'news_service.dart';

class ApiService implements NewsService {
  final String _apiKey = 'c2208bf211634aa98f1dc6ce02a40d8e';
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines';

  @override
  Future<List<Article>?> fetchTopHeadlines() async {
    final response = await http.get(Uri.parse('$_baseUrl?country=us&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['articles'] as List)
          .map((articleJson) => Article.fromJson(articleJson))
          .toList();
    } else {
      return null;
    }
  }
}
