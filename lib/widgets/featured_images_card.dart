import 'package:flutter/material.dart';

/// Widget that features up to 3 images on a card. Contains a bottom portion to allow for title and subtitle text
///
/// Looks best with 3 images but can take any number. If given more than 3 urls, it will still only use the first 3.
///
/// Comes with `onTap` function using an Inkwell. Typically used to navigate to a new screen.
///
/// The first image is wrapped with a `Hero` where the id is the image url. You can use this to animate the image to the next screen.
/// Widget that features up to 3 images on a card. Contains a bottom portion to allow for title and subtitle text
///
/// Looks best with 3 images but can take any number. If given more than 3 urls, it will still only use the first 3.
///
/// Comes with `onTap` function using an Inkwell. Typically used to navigate to a new screen.
///
/// The first image is wrapped with a `Hero` where the id is the image url. You can use this to animate the image to the next screen.
class FeaturedImagesCard extends StatelessWidget {
  const FeaturedImagesCard(
      {required this.imageUrls,
      required this.titleText,
      required this.subtitleText,
      required this.onTap,
      super.key});

  final List<String> imageUrls;
  final String titleText;
  final String subtitleText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    const double imageSpacing =
        2; // Small sliver of whitespace between the images

    return Card(
      elevation: 6,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        onTap: onTap as void Function()?,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  if (imageUrls.isNotEmpty) ...[
                    Expanded(
                      flex: 3,
                      child: Hero(
                        tag: imageUrls[0],
                        child: Image.network(
                          imageUrls[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ] else
                    const SizedBox.shrink(),
                  if (imageUrls.length >= 2) ...[
                    const SizedBox(width: imageSpacing),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              imageUrls[1],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (imageUrls.length >= 3) ...[
                            const SizedBox(height: imageSpacing),
                            Expanded(
                              child: Image.network(
                                imageUrls[2],
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            )
                          ] else
                            const SizedBox.shrink(),
                        ],
                      ),
                    )
                  ] else
                    const SizedBox.shrink(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // if (titleText != null && titleText.isNotEmpty)
                    if (titleText.isNotEmpty) ...[
                      Text(
                        titleText,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    // if (subtitleText != null && subtitleText.isNotEmpty)
                    if (subtitleText.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        subtitleText,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
