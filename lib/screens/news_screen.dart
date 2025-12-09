import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_requirements/core/service/api/api_service.dart';
import 'package:task_requirements/core/service/firebase_service.dart';
import 'package:task_requirements/core/service/notification/notification_service.dart';
import 'package:task_requirements/provider/news_provider.dart';
import 'package:task_requirements/widgets/news_card.dart';

import '../core/models/alticle.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late NewsProvider newsProvider;
  final apiService = ApiService();

  @override
  void initState() {
    newsProvider = NewsProvider(apiService);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      newsProvider.loadArticles();
      await FirebaseService.initializeFirebase();
      await NotificationService.initialize();
    });

    super.initState();
  }

  @override
  void dispose() {
    newsProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: newsProvider,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Top News'),
          actions: [
            ElevatedButton(
              onPressed: () {
                NotificationService.fcmService.sendCustomNotification();
              },
              child: Text("Send Notification"),
            ),
          ],
        ),
        body: Consumer<NewsProvider>(
          builder: (context, newsProvider, child) {
            if (newsProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: newsProvider.articles?.length ?? 0,
              itemBuilder: (context, index) {
                return NewsCard(article: newsProvider.articles?[index] ?? Article.empty());
              },
            );
          },
        ),
      ),
    );
  }
}
