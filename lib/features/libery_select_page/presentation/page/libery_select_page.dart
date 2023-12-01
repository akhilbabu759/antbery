import 'dart:developer';

import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/book_summary/presentations/page/book_summary.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LiberySelectPage extends StatelessWidget {
  const LiberySelectPage({super.key, required this.model});
  final BookListEntities model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProBlackStyle().grayblackProblack,
      floatingActionButton: FloatingActionButton(
          backgroundColor: ProBlackStyle().graywhiteProBlack,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookSummery(model: model),
            ));
          },
          child: Icon(
            Icons.keyboard_double_arrow_right_sharp,
            size: 30,
            color: Color.fromARGB(246, 179, 214, 162),
          )),
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
          'Libery list',
          style: TextStyle(color: const Color.fromARGB(255, 242, 242, 242)),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: model.libery.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 18),
                child: Card(
                  child: Container(
                    height: ProBlackStyle().bappSize(context).height * 0.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 240),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Image.network(model.imgUrl),
                            Gap(ProBlackStyle().bappSize(context).width * 0.05),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    model.libery[index],
                                    style: TextStyle(
                                        fontSize: ProBlackStyle()
                                                .bappSize(context)
                                                .width *
                                            0.05),
                                  ),
                                  Text(model.bookName),
                                  Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(5, (index) {
                                        String stringValue =
                                            model.rating.toString();
                                        if (index < model.rating.toInt()) {
                                          return Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: ProBlackStyle()
                                                    .bappSize(context)
                                                    .width *
                                                0.035,
                                          );
                                        } else if (index ==
                                                (model.rating.toInt()) &&
                                            stringValue.contains('.')) {
                                          List<String> parts =
                                              stringValue.split('.');
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
                                              color:
                                                  ProBlackStyle().whitecloProBlack,
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
                                            size: ProBlackStyle()
                                                    .bappSize(context)
                                                    .width *
                                                0.035,
                                          );
                                        }
                                      })),
                                  // Text(model.description,overflow: TextOverflow.ellipsis,maxLines: 1,)
                                  SizedBox(
                                      width:
                                          ProBlackStyle().bappSize(context).width *
                                              0.6,
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
                        Positioned(right: 5,
                          child: Radio(
                                    value: 'groupValue',
                                    groupValue: 'groupValue',
                                    onChanged: (value) {
                                      
                                    },),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
