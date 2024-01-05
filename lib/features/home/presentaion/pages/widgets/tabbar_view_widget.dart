import 'package:antbery/config/comon_widget/horizontal_listview.dart';
import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/home/presentaion/bloc/financial_bloc/financialbook_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class FinancilTabBarViewWidget extends StatelessWidget {
  const FinancilTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FinancialbookBloc, FinancialbookState>(builder: (context, stat) {
            if (stat is FinancialbookLoding) {
              return Center(
                child: Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 85, 85, 85),
                  highlightColor: Color.fromARGB(255, 135, 134, 134),
                  period: Duration(seconds: 2),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 138, 138, 138)),
                    width: double.infinity,
                    height: ProBlackStyle().bappSize(context).height * 0.24,
                    // Replace this with your desired shimmering content
                  ),
                ),
              );
            }
            if (stat is FinancialbookLoded) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hot Reads',
            style: TextStyle(fontSize: 20, color: ProBlackStyle().whitecloProBlack
            // Additional styling options
            ),
          ),Gap(10),
      HorizontalListview(data: stat.result[0].hotReads ),
      Gap(30),
      Text(
        'Recomended',
        style:  TextStyle(fontSize: 20, color: ProBlackStyle().whitecloProBlack
            // Additional styling options
            ),
      ),
      Gap(10),
      HorizontalListview(data: stat.result[0].newbook ),
        ],
      );}
      return Text('data');
      }
    );
  }
}
