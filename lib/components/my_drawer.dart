import "package:chat_app/services/auth/auth_service.dart";
import "package:chat_app/pages/settings_page.dart";
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final _authService = AuthService();
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // Logo

        Column(
          children: [
            const DrawerHeader(
                child: Center(
              child: Icon(
                Icons.message_rounded,
                color: Colors.black,
                size: 64,
              ),
            )),

            // Home Page
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListTile(
                leading: const Icon(Icons.home_filled),
                title: const Text("HOME"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),

            // Settings Page
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("SETTINGS"),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ));
                },
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ListTile(
            leading: const Icon(Icons.logout_sharp),
            title: const Text("LOG OUT"),
            onTap: () {
              logout();
            },
          ),
        )
      ]),
    );
  }
}
