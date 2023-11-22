import 'package:antbery/config/them/blue_edge_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class dreawerWidget extends StatelessWidget {
  const dreawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: BlueEdgeStryle().bluMin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: BlueEdgeStryle().appSize(context).width * 0.11,
                  backgroundImage: NetworkImage(
                      'https://artriva.com/media/k2/items/cache/c889234799e865bbe90cee71f6cd2e53_XL.jpg'),
                ),
                // Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                //   image: DecorationImage(
                // image: NetworkImage('https://artriva.com/media/k2/items/cache/c889234799e865bbe90cee71f6cd2e53_XL.jpg'), // Replace with your image path
                // fit: BoxFit.cover,
                // colorFilter: ColorFilter.mode(
                //   Colors.black.withOpacity(0.5), // Adjust opacity here
                //   BlendMode.srcOver,
                // )
                // )),
                //   child: Text(
                //     'Akhil',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 24,
                //     ),
                //   ),
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Akhil',
                      style: BlueEdgeStryle().textStyle(
                          BlueEdgeStryle().appSize(context).width * 0.05),
                    ),
                    Gap(8),
                    Text(
                      'akhilb4001@gmail.com',
                      style: TextStyle(
                          color: BlueEdgeStryle().whitegrayCle,
                          fontSize:
                              BlueEdgeStryle().appSize(context).width *
                                  0.02),
                    )
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Implement profile functionality here
              Navigator.pop(context);
              // Add your code to navigate or perform actions related to profile
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Implement settings functionality here
              Navigator.pop(context);
              // Add your code to navigate or perform actions related to settings
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              // Implement about functionality here
              Navigator.pop(context);
              // Add your code to navigate or perform actions related to about
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text('Contact'),
            onTap: () {
              // Implement contact functionality here
              Navigator.pop(context);
              // Add your code to navigate or perform actions related to contact
            },
          ),
        ],
      ),
    );
  }
}
