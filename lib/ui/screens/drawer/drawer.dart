import 'package:demo_shop_app/ui/screens/history.dart';
import 'package:demo_shop_app/ui/screens/rate.dart';
import 'package:demo_shop_app/ui/screens/drawer/routes.dart';

import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: SizedBox(),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/ramadan_iftar.jpg'))),
          ),
          ListTile(
            leading: const Icon(
              Icons.person_outline,
              size: 35,
            ),
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {
              Navigator.of(context).pop()
            },
          ),

          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.feedback_outlined, size: 35),
            title: const Text('Feedback', style: TextStyle(fontSize: 20)),
            onTap: () => {Navigator.of(context).push(createRoute(const Rate()))},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.history, size: 35),
            title: const Text('Orders history', style: TextStyle(fontSize: 20)),
            onTap: () => {Navigator.of(context)
                .push(createRoute(const History()))},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded, size: 35),
            title: const Text('Logout', style: TextStyle(fontSize: 20)),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
