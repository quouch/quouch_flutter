import 'package:flutter/material.dart';

class LargeTitledImageWidget extends StatelessWidget {
  const LargeTitledImageWidget(
      {required this.text, this.subtitle, required this.imageUrl, super.key});

  final String text;
  final String? subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(subtitle ?? ''),
      ],
    );
  }
}
