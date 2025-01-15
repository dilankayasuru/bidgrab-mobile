import 'package:bidgrab/controllers/auth_controller.dart';
import 'package:bidgrab/providers/authProvider.dart';
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
                Navigator.pushNamed(context, '/');
                Provider.of<AuthProvider>(context, listen: false).logOut();
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
              const Text(
                "Change your profile",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(user.profilePic ?? ""),
                maxRadius: 56,
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
                      const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          label: Text("Email"),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Contact information",
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
                          label: Text("Phone"),
                        ),
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
                          label: Text("Address"),
                        ),
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
                          label: Text("Street"),
                        ),
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
                          label: Text("District"),
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
                          child: const Text("Submit"),
                        ),
                      )
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
