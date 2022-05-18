import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageurl =
        "https://scontent.fixc7-1.fna.fbcdn.net/v/t1.6435-1/78432425_551780265369472_5726243891598852096_n.jpg?stp=c0.0.160.160a_dst-jpg_p160x160&_nc_cat=100&ccb=1-6&_nc_sid=7206a8&_nc_ohc=aD5_AT9kkvMAX-XQs11&_nc_ht=scontent.fixc7-1.fna&oh=00_AT-sNlSTcG8IHLLaL24yDRNkIK3NJe5b_9M3plIk5Ls_yQ&oe=62A7FBEF";
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                margin: EdgeInsets.zero,
                accountName: Text("Sourabh Yadav",
                style: TextStyle(
                  color: Colors.white
                ),),
                accountEmail: Text("sourabhyadav564@gmail.com",
                  style: TextStyle(
                      color: Colors.white
                  ),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageurl),
                ),
              )),
          ListTile(
            minVerticalPadding: 25.0,
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.indigoAccent,
              size: 40.0,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
          ),
          ListTile(
            minVerticalPadding: 25.0,
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.indigoAccent,
              size: 40.0,
            ),
            title: Text(
              "Account",
              style: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
          ),
          ListTile(
            minVerticalPadding: 25.0,
            leading: Icon(
              CupertinoIcons.arrow_right_circle,
              color: Colors.indigoAccent,
              size: 40.0,
            ),
            title: Text(
              "Logout",
              style: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
