import 'dart:developer';

import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key, required this.model});
  final BookListEntities model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProBlackStyle().grayblackProblack,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: ProBlackStyle().grayblackProblack,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: ProBlackStyle().whitecloProBlack,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Booking details',
          style: TextStyle(color: const Color.fromARGB(255, 242, 242, 242)),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(color: Color.fromARGB(255, 78, 78, 78),
        height: ProBlackStyle().bappSize(context).height * 0.065,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Booking ID- 6f6dbf7bvcs7sjhbc788',style: TextStyle(color: const Color.fromARGB(255, 170, 170, 170)),),
            ),
            
            ])
            ),
            Divider(height: 2,thickness: 2),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 18),
          child: Card(
            child: Container(
              height: ProBlackStyle().bappSize(context).height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
              ),
              child: Row(
                children: [
                  Image.network(model.imgUrl),
                  Gap(ProBlackStyle().bappSize(context).width * 0.05),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          model.libery[0],
                          style: TextStyle(
                              fontSize:
                                  ProBlackStyle().bappSize(context).width *
                                      0.05),
                        ),
                        Text(model.bookName),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(5, (index) {
                              String stringValue = model.rating.toString();
                              if (index < model.rating.toInt()) {
                                return Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size:
                                      ProBlackStyle().bappSize(context).width *
                                          0.035,
                                );
                              } else if (index == (model.rating.toInt()) &&
                                  stringValue.contains('.')) {
                                List<String> parts = stringValue.split('.');
                                log(parts.toString(), name: 'rat');
                                if ((int.parse(parts[1])) >= 1) {
                                  log(int.parse(parts[1]).toString(),
                                      name: 'rat');
                                  log(parts.toString(), name: 'rat');

                                  return Icon(
                                    Icons.star_half_sharp,
                                    color: Colors.amber,
                                    size: ProBlackStyle()
                                            .bappSize(context)
                                            .width *
                                        0.035,
                                  );
                                } else {
                                  return Icon(
                                    Icons.star_border_outlined,
                                    color: ProBlackStyle().whitecloProBlack,
                                    size: ProBlackStyle()
                                            .bappSize(context)
                                            .width *
                                        0.035,
                                  );
                                }
                              } else {
                                return Icon(
                                  Icons.star_border_outlined,
                                  color: ProBlackStyle().whitecloProBlack,
                                  size:
                                      ProBlackStyle().bappSize(context).width *
                                          0.035,
                                );
                              }
                            })),
                        // Text(model.description,overflow: TextOverflow.ellipsis,maxLines: 1,)
                        SizedBox(
                            width:
                                ProBlackStyle().bappSize(context).width * 0.6,
                            child: Text(
                              model.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: Color.fromARGB(255, 2, 143, 7),
              ),
              Gap(5),
              Column(
                children: [
                  Text(
                    'Booked',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 247, 247, 245)),
                  ),
                  Text(
                    '1/10/2023',
                    style: TextStyle(
                        color: Color.fromARGB(255, 196, 195, 195),
                        fontSize:
                            ProBlackStyle().bappSize(context).width * 0.016),
                  ),
                ],
              ),
            ],
          ),
        ), Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                Icons.circle_outlined,
                 color: Color.fromARGB(255, 207, 208, 207),
              ),
              Gap(5),
              Column(
                children: [
                  Text(
                    'last date',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 247, 247, 245)),
                  ),
                  Text(
                    '11/10/2023',
                    style: TextStyle(
                        color: Color.fromARGB(255, 196, 195, 195),
                        fontSize:
                            ProBlackStyle().bappSize(context).width * 0.016),
                  ),
                ],
              ),
            ],
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                Icons.circle_outlined,
                color: Color.fromARGB(255, 204, 205, 204),
              ),
              Gap(5),
              Column(
                children: [
                  Text(
                    'Return',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 247, 247, 245)),
                  ),
                  // Text(
                  //   '1/10/2023',
                  //   style: TextStyle(
                  //       color: Color.fromARGB(255, 196, 195, 195),
                  //       fontSize:
                  //           ProBlackStyle().bappSize(context).width * 0.016),
                  // ),
                ],
              ),
            ],
          ),
        ),
       Container(color: Color.fromARGB(255, 78, 78, 78),
        height: ProBlackStyle().bappSize(context).height * 0.065,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Cancel',style: ProBlackStyle().btextStyle(20.0),),
            Container(
              height: ProBlackStyle().bappSize(context).height * 0.045,
              width: ProBlackStyle().bappSize(context).width * 0.28,
              decoration: BoxDecoration(
                  color: Color.fromARGB(209, 164, 234, 138),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(child: Text('Extend')),)])
            ),Divider(height: 2,thickness: 2),
            
             Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'libery address',
                style: TextStyle(
                    color: ProBlackStyle().whitecloProBlack,
                    fontSize: ProBlackStyle().bappSize(context).width * 0.023),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'kinfra',
                style: TextStyle(
                    color: ProBlackStyle().whitecloProBlack,
                    fontSize: ProBlackStyle().bappSize(context).width * 0.023),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Op police station,koxikode,kerala,',
                style: TextStyle(
                    color: ProBlackStyle().whitecloProBlack,
                    fontSize: ProBlackStyle().bappSize(context).width * 0.023),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'pin :384920',
                style: TextStyle(
                    color: ProBlackStyle().whitecloProBlack,
                    fontSize: ProBlackStyle().bappSize(context).width * 0.023),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Ph:7890378929',
                style: TextStyle(
                    color: ProBlackStyle().whitecloProBlack,
                    fontSize: ProBlackStyle().bappSize(context).width * 0.023),
              ),
            ),


      ]),
      //  bottomNavigationBar: Container(
      //   height: ProBlackStyle().bappSize(context).height * 0.065,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Text('Cancel',style: ProBlackStyle().btextStyle(20.0),),
      //       Container(
      //         height: ProBlackStyle().bappSize(context).height * 0.045,
      //         width: ProBlackStyle().bappSize(context).width * 0.28,
      //         decoration: BoxDecoration(
      //             color: Color.fromARGB(209, 164, 234, 138),
      //             borderRadius: BorderRadius.circular(30)),
      //         child: Center(child: Text('Extend')),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
