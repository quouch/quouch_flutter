
import 'package:flutter/material.dart';

class RowTileWithImage extends StatelessWidget {
  const RowTileWithImage(
      {required this.title,
      this.subtitle = '',
      required this.imageUrl,
      this.onTap,
      super.key});
  final String title;

  /// Currently being used to show how far of a drive the destination is
  final String subtitle;
  final String imageUrl;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (subtitle.isNotEmpty) ...[
                const SizedBox(
                  height: 8,
                ),
                Text(subtitle)
              ],
            ],
          ),
        ],
      ),
    );
  }
}
