import 'package:antbery/config/them/blue_edge_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widget/home_grideview.dart';
import 'widget/home_top_container.dart';
import 'widget/horizontal_listview.dart';

class BlueEdge extends StatelessWidget {
  const BlueEdge({
    super.key,required this.func
  });
  final Function func;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.infinity,
          child: Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTopContainer(fun: func),
                  Gap(BlueEdgeStryle().appSize(context).height * 0.05),
                  GestureDetector(
                    onVerticalDragDown: (details) {},
                    child: Container(
                      width: BlueEdgeStryle().mainContainerWidth(context),
                      decoration: BoxDecoration(
                          color: BlueEdgeStryle().bluMin,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(20),
                            Text(
                              'HOT Reads',
                              style: TextStyle(
                                  color: BlueEdgeStryle().whiteCle,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            Gap(10),
                            HorizontalListview(),
                            Gap(20),
                            Text('Recent',
                                style: TextStyle(
                                    color: BlueEdgeStryle().whiteCle,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic)),
                            Gap(20),
                            HorizontalListview(),
                            Gap(20),
                            HomeGrideview()
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
