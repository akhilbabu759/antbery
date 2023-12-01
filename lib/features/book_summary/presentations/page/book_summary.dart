import 'dart:developer';

import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/booking_history/presentation/page/booking_history.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookSummery extends StatelessWidget {
  const BookSummery({super.key, required this.model});
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
          'Booking Summary',
          style: TextStyle(color: const Color.fromARGB(255, 242, 242, 242)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                                      size: ProBlackStyle()
                                              .bappSize(context)
                                              .width *
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
                                      size: ProBlackStyle()
                                              .bappSize(context)
                                              .width *
                                          0.035,
                                    );
                                  }
                                })),
                            // Text(model.description,overflow: TextOverflow.ellipsis,maxLines: 1,)
                            SizedBox(
                                width: ProBlackStyle().bappSize(context).width *
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Booking for 10 day's",
                style: TextStyle(
                    color: ProBlackStyle().whitecloProBlack,
                    fontSize: ProBlackStyle().bappSize(context).width * 0.033),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: ProBlackStyle().whitecloProBlack,
                    fontSize: ProBlackStyle().bappSize(context).height * 0.01,
                    height: 1.5,
                  ),
                  children: [
                    buildTextSpan("Policy Details:\n", FontWeight.bold),
                    buildTextSpan(
                        "Responsibility:\nIndividuals borrowing or using the books are responsible for their proper care and handling.\n\n",
                        FontWeight.normal),
                    buildTextSpan(
                        "Acceptable Usage:\nBooks should be used for their intended purpose, avoiding any actions that may cause damage.\n\n",
                        FontWeight.normal),
                    buildTextSpan(
                        "Reporting Damages:\nAny damage noticed should be reported promptly to the appropriate authority (e.g., librarian, book owner).\n\n",
                        FontWeight.normal),
                    buildTextSpan("Types of Damage:\n", FontWeight.bold),
                    buildTextSpan(
                        "- Torn, ripped, or missing pages.\n"
                        "- Water damage or stains.\n"
                        "- Writing, underlining, or highlighting in the book.\n"
                        "- Broken spine or covers.\n\n",
                        FontWeight.normal),
                    buildTextSpan("Liability for Damage:\n", FontWeight.bold),
                    buildTextSpan(
                        "Users will be held accountable for any damage caused to the books while in their possession or during their use.\n\n",
                        FontWeight.normal),
                    buildTextSpan("Assessment and Payment:\n", FontWeight.bold),
                    buildTextSpan(
                        "An assessment of the damage will be made by the authorized personnel.\n"
                        "The individual responsible for the damage will be notified of the assessed cost for repair or replacement.\n\n",
                        FontWeight.normal),
                    buildTextSpan("Payment Process:\n", FontWeight.bold),
                    buildTextSpan(
                        "The individual responsible for the damage is required to compensate for the repair or replacement cost as per the assessment.\n\n",
                        FontWeight.normal),
                    buildTextSpan(
                        "Consequences of Non-Payment:\n", FontWeight.bold),
                    buildTextSpan(
                        "Failure to pay for damages may result in restricted borrowing privileges or other disciplinary actions.\n\n",
                        FontWeight.normal),
                    buildTextSpan("Acknowledgment:\n", FontWeight.bold),
                    buildTextSpan(
                        "By borrowing or using the books, individuals acknowledge that they have read and understood this Book Damage Policy.\n",
                        FontWeight.normal),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: ProBlackStyle().bappSize(context).height * 0.065,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Cancel',style: ProBlackStyle().btextStyle(20.0),),
            GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookingHistory(model: model),)),
              child: Container(
                height: ProBlackStyle().bappSize(context).height * 0.045,
                width: ProBlackStyle().bappSize(context).width * 0.28,
                decoration: BoxDecoration(
                    color: Color.fromARGB(209, 164, 234, 138),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(child: Text('Book')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextSpan buildTextSpan(String text, FontWeight fontWeight) {
    return TextSpan(
      text: text,
      style: TextStyle(fontWeight: fontWeight),
    );
  }
}
