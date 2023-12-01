import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/booking_history/presentation/page/booking_history.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:antbery/features/home/presentaion/pages/home.dart';
import 'package:antbery/features/queue/presentation/page/queue.dart';
import 'package:antbery/features/settings/presentation/page/setting.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Account extends StatelessWidget {
  const Account({super.key, required this.model});
  final BookListEntities model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProBlackStyle().grayblackProblack,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: ProBlackStyle().grayblackProblack,
        // leading: GestureDetector(
        //   child: Icon(
        //     Icons.arrow_back_ios,
        //     color: ProBlackStyle().whitecloProBlack,
        //   ),
        // ),
        centerTitle: true,
        title: Text(
          'Account',
          style: TextStyle(color: const Color.fromARGB(255, 242, 242, 242)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Gap(15),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://latestforyouth.com/wp-content/uploads/2022/09/boy-profile-092201.jpg',
                ),
                radius: ProBlackStyle().bappSize(context).width * 0.13,
              ),
              Gap(8),
              Column(
                children: [
                  Text(
                    'Akhil',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            ProBlackStyle().bappSize(context).width * 0.047),
                  ),
                  Gap(5),
                  Text(
                    'Email: akhilb4001@gamail.com',
                    style: TextStyle(color: Color.fromARGB(255, 189, 189, 189)),
                  )
                ],
              )
            ],
          ),
          Divider(thickness: 2),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookingHistory(model: model),
            )),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                tileColor: Color.fromARGB(255, 88, 88, 88),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                leading: Text('Booking History',
                    style:
                        TextStyle(color: Color.fromARGB(255, 236, 236, 236))),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookingHistory(model: model),
            )),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                tileColor: Color.fromARGB(255, 88, 88, 88),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                leading: Text('Edit Profile',
                    style:
                        TextStyle(color: Color.fromARGB(255, 236, 236, 236))),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookingHistory(model: model),
            )),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                tileColor: Color.fromARGB(255, 88, 88, 88),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                leading: Text('Saved address',
                    style:
                        TextStyle(color: Color.fromARGB(255, 236, 236, 236))),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Text('Current address:',
              style: TextStyle(
                  color: Color.fromARGB(255, 179, 178, 178),
                  fontSize: ProBlackStyle().bappSize(context).width * 0.024)),
          Text('Akhil',
              style: TextStyle(
                  color: Color.fromARGB(255, 179, 178, 178),
                  fontSize: ProBlackStyle().bappSize(context).width * 0.022)),
          Text('Op bus stand iritty,kerala',
              style: TextStyle(
                  color: Color.fromARGB(255, 179, 178, 178),
                  fontSize: ProBlackStyle().bappSize(context).width * 0.022)),
          Text('Pin:384920 ',
              style: TextStyle(
                  color: Color.fromARGB(255, 179, 178, 178),
                  fontSize: ProBlackStyle().bappSize(context).width * 0.022)),
          Text('Ph:7890378929',
              style: TextStyle(
                  color: Color.fromARGB(255, 179, 178, 178),
                  fontSize: ProBlackStyle().bappSize(context).width * 0.022)),
          Divider(
            thickness: 2,
          ),
          Gap(ProBlackStyle().bappSize(context).height * 0.05),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            18.0), // Set your desired border radius
                      ),
                    ),
                    minimumSize: MaterialStatePropertyAll(Size(
                        ProBlackStyle().bappSize(context).width * 0.6,
                        ProBlackStyle().bappSize(context).height * 0.064)),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(196, 136, 2, 2))),
                onPressed: () {},
                child: Center(
                  child: Text('Log Out'),
                )),
          )
        ]),
      ),
    );
  }
}
