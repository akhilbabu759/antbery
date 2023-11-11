import 'package:antbery/config/them/app_style.dart';
import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.94,
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(100)),
              color: AppStryle().bluMin),
          child: Center(
              child: Text(
            'Are You finding \n a book !',
            style:
                AppStryle().textStyle(MediaQuery.of(context).size.width * 0.08),
            textAlign: TextAlign.center,
          )),
        ),
        Positioned(
          bottom: 22.5,
          right: 18,
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.05,
            backgroundColor: AppStryle().whiteCle,
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.04,
              backgroundColor: AppStryle().bluMin,
            ),
          ),
        )
      ],
    );
  }
}
