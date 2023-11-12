import 'package:antbery/config/them/app_style.dart';
import 'package:flutter/material.dart';

class HorizontalListview extends StatelessWidget {
  const HorizontalListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: AppStryle().appSize(context).height * 0.18,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                  'https://m.media-amazon.com/images/I/41RVqoveEpL._SY445_SX342_.jpg'),
            );
          },
        ),
      ),
    );
  }
}
