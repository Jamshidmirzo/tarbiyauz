import 'package:flutter/material.dart';
import 'package:tarbiyauz/features/phone_pages/video_phone/presentation/widgets/youtube_thuibnil_widget.dart';

class VideoPhoneScreen extends StatelessWidget {
  const VideoPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of YouTube video URLs
    final youtubeUrls = [
      'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      'https://www.youtube.com/watch?v=3JZ_D3ELwOQ',
      'https://www.youtube.com/watch?v=Zi_XLOBDo_Y',
      'https://youtu.be/2Vv-BfVoq4g',
      'https://www.youtube.com/watch?v=ftZ0mL6OHdA',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("YouTube Thumbnails"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: youtubeUrls.length,
        itemBuilder: (context, index) {
          return YouTubeThumbnail(
            youtubeUrl: youtubeUrls[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}
