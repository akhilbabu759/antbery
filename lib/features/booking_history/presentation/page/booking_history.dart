import 'dart:developer';

import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/booking_details/presentaion/page/bookin_details.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({super.key, required this.model});
  final BookListEntities model;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          'Booking History',
          style: TextStyle(color: const Color.fromARGB(255, 242, 242, 242)),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(itemCount: 10,
            itemBuilder: (context, index) =>  Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 18),
                  child: GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder:  (context) =>BookingDetails(model: model) ,)),
                    child: Card(
                      child: Container(
                        height: ProBlackStyle().bappSize(context).height * 0.1,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 83, 83, 83),
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Image.network(model.imgUrl),
                            
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    model.libery[0],
                                    style: TextStyle(color: ProBlackStyle().whitecloProBlack,
                                        fontSize:
                                            ProBlackStyle().bappSize(context).width *
                                                0.05),
                                  ),
                                  Text(model.bookName,style: TextStyle(color: Color.fromARGB(255, 206, 205, 205),),),
                                 
                                  // Text(model.description,overflow: TextOverflow.ellipsis,maxLines: 1,)
                                  SizedBox(
                                      width: ProBlackStyle().bappSize(context).width *
                                          0.6,
                                          child: Center(child: Text('Booked: 1/10/2023 to 11/10/2023',style: TextStyle(color: Color.fromARGB(255, 195, 147, 3),fontSize: MediaQuery.of(context).size.width*0.018),)),
                                       ),
                                ],
                              ),
                            ),Icon(Icons.arrow_forward_ios,color:  ProBlackStyle().whitecloProBlack,),Gap(ProBlackStyle().bappSize(context).width * 0.02),
                          
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          ),
        ),
      ]),

    );
  }
}