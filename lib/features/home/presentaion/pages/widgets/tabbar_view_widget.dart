import 'package:antbery/config/comon_widget/horizontal_listview.dart';
import 'package:antbery/config/them/pro_black.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hot Reads',
          style: ProBlackStyle().btextStyle(20.0),
        ),Gap(10),
    HorizontalListview(),
    Gap(30),
    Text(
      'Recent',
      style: ProBlackStyle().btextStyle(20.0),
    ),
    Gap(10),
    HorizontalListview(),
      ],
    );
  }
}
