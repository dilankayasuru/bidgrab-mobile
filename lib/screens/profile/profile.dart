import 'package:bidgrab/controllers/auth_controller.dart';
import 'package:bidgrab/providers/authProvider.dart';
import 'package:bidgrab/screens/profile/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static String id = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              try {
                await Auth.logout();
                Provider.of<AuthProvider>(context, listen: false).logOut();
                Navigator.pushReplacementNamed(context, '/');
              } catch (error) {
                print(error);
              }
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(child:
            Consumer<AuthProvider>(builder: (context, authProvider, child) {
          final user = authProvider.getUser();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  user.profilePic as String,
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                user.name ?? "",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                user.email ?? "",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              ProfileMenu(),
              Center(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? double.infinity
                          : 320),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Profile information",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          label: Text("Name"),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? double.infinity
                            : 320,
                        child: FilledButton(
                          onPressed: () {},
                          child: const Text("Save"),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Change password",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          label: Text("Password"),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          label: Text("Confirm password"),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? double.infinity
                            : 320,
                        child: FilledButton(
                          onPressed: () {},
                          child: const Text("Save password"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        })),
      )),
    );
  }
}
