import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // List notifications = StaticDB.alerts['alerts'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.theme.accentColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: context.canvasColor,
        centerTitle: true,
        title: Text('Alerts',
            style: TextStyle(
                fontSize: 20,
                color: context.theme.accentColor,
                fontFamily: GoogleFonts.roboto().fontFamily)),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              // StaticDB.alerts['alerts'].isEmpty
              //     ?
              Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 170.0, bottom: 20),
                  child: Icon(
                    CupertinoIcons.bell_circle,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  "No alerts found",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          )
          // : ListView.builder(
          //     scrollDirection: Axis.vertical,
          //     physics: const BouncingScrollPhysics(),
          //     shrinkWrap: true,
          //     itemCount: StaticDB.alerts['alerts'].length,
          //     itemBuilder: (context, int index) {
          //       return Dismissible(
          //           key: Key(StaticDB.alerts['alerts'][index]['id']),
          //           onDismissed: (direction) {
          //             setState(() {
          //               StaticDB.alerts['alerts'].removeAt(index);
          //             });
          //             ScaffoldMessenger.of(context).showSnackBar(
          //                 SnackBar(content: Text("Notification deleted")));
          //           },
          //           child: Column(
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: ListTile(
          //                   tileColor: Colors.white,
          //                   minVerticalPadding: 10,
          //                   leading: CircleAvatar(
          //                     backgroundColor: Colors.white,
          //                     child: Icon(
          //                       Icons.notifications,
          //                       color: Colors.black,
          //                     ),
          //                   ),
          //                   title: Text(
          //                     StaticDB.alerts['alerts'][index]['title'],
          //                     style: TextStyle(
          //                         fontSize: 16,
          //                         color: Colors.black,
          //                         fontWeight: FontWeight.normal),
          //                   ),
          //                   onTap: () {
          //                     Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                             builder: (context) =>
          //                                 NewsDetail(index: index, type: "",)));
          //                   },
          //                 ),
          //               ),
          //               const Divider(
          //                 height: 1,
          //               )
          //             ],
          //           ));
          //     },
          //   ),
          ),
    );
  }
}
