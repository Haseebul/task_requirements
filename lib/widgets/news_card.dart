import 'package:flutter/material.dart';
import 'package:task_requirements/core/models/alticle.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, // Add shadow
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), // Rounded corners
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image (takes up about 30% of the width)
            article.imageUrl.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      article.imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[200],
                        child: const Icon(Icons.broken_image, color: Colors.grey),
                      ),
                    ),
                  )
                : Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[200],
                    child: const Icon(Icons.newspaper, color: Colors.grey),
                  ),

            const SizedBox(width: 10.0),

            // Text Content (takes up the rest of the space)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  // Description
                  Text(
                    article.description,
                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
