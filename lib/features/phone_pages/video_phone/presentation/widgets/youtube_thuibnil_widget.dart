import 'package:flutter/material.dart';

class YouTubeThumbnail extends StatelessWidget {
  final String youtubeUrl;

  const YouTubeThumbnail({super.key, required this.youtubeUrl});

  /// Extracts the video ID from a YouTube URL
  String _extractVideoId(String url) {
    final uri = Uri.parse(url);
    if (uri.host.contains('youtube.com')) {
      return uri.queryParameters['v'] ?? '';
    } else if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : '';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final videoId = _extractVideoId(youtubeUrl);
    if (videoId.isEmpty) {
      return const Center(
        child: Text(
          'Invalid YouTube URL',
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    final thumbnailUrl = 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';

    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          thumbnailUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Text(
                'Thumbnail not available',
                style: TextStyle(color: Colors.grey),
              ),
            );
          },
        ),
      ),
    );
  }
}
