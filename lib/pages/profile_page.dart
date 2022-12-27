import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

String name = "";

checkUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('isLoggedIn') == true) {
    name = prefs.getString('name')!;
    print(name);
    return true;
  } else {
    name = "Guest";
    return false;
  }
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn().then((value) {
      if (value) {
        setState(() {});
      }
    });
  }

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
        title: Text('My Profile',
            style: TextStyle(
                fontSize: 20,
                color: context.theme.accentColor,
                fontFamily: GoogleFonts.roboto().fontFamily)),
      ),
      backgroundColor: context.canvasColor,
      body: Container(
        child: ListView(
          children: [
            Container(
              color: context.theme.canvasColor,
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topRight,
              //     end: Alignment.bottomLeft,
              //     colors: [
              //       Colors.green,
              //       Colors.orange,
              //     ],
              //   ),
              // ),
              margin: EdgeInsets.zero,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Icon(
                    CupertinoIcons.person_alt_circle_fill,
                    size: 150,
                    color: context.accentColor,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(65.0),
                //   child: CircleAvatar(
                //     radius: 75,
                //     backgroundImage: AssetImage('assets/Flag_of_India.png'),
                //   ),
                // ),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.canvasColor,
                        border: Border.all(
                          color: context.theme.accentColor,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 30,
                            offset: Offset(0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(18),
                      ),
                      height: 70,
                      width: double.infinity,
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: context.accentColor,
                          ),
                          title: Text(name),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.37,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 10.0),
                  child: InkWell(
                    onTap: () {
                      Constants.setUserData(
                        false,
                        "",
                      );
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.canvasColor,
                        border: Border.all(
                          color: context.theme.accentColor,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 30,
                            offset: Offset(0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(40),
                      ),
                      height: 60,
                      width: 170,
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            CupertinoIcons.arrow_left_square,
                            color: context.accentColor,
                          ),
                          title: Text('Log Out'),
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 10.0),
                //   child: InkWell(
                //     onTap: () {
                //       // Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagePage()));
                //     },
                //     child: Container(
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           color: context.theme.accentColor,
                //           width: 1,
                //         ),
                //         color: context.canvasColor,
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(.1),
                //             blurRadius: 30,
                //             offset: Offset(0, 10),
                //           ),
                //         ],
                //         borderRadius: BorderRadius.circular(18),
                //       ),
                //       height: 70,
                //       width: double.infinity,
                //       child: Center(
                //         child: ListTile(
                //           leading: Icon(
                //             Icons.language,
                //             color: context.accentColor,
                //           ),
                //           title: Text('Language of Interest'),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
