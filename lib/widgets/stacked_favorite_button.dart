
import 'package:flutter/material.dart';

class StackedFavoriteButton extends StatefulWidget {
  const StackedFavoriteButton({
    super.key,
  });

  @override
  State<StackedFavoriteButton> createState() => _StackedFavoriteButtonState();
}

class _StackedFavoriteButtonState extends State<StackedFavoriteButton> {
  late bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: Stack(
        children: [
          const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.favorite,
                color: isFavorited
                    ? Theme.of(context).primaryColor
                    : Colors.black.withOpacity(.7),
                size: 20),
            onPressed: () {
              setState(() {
                isFavorited = !isFavorited;
              });
            },
          )
        ],
      ),
    );
  }
}
