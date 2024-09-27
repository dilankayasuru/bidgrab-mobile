import 'package:bidgrab/models/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static String id = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: searchOpened ? const SearchBar() : const Text("Products"),
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
          Consumer<Userprovider>(
            builder: (context, value, child) => IconButton(
              onPressed: () {
                value.loggedIn = false;
                Navigator.pushNamed(context, '/');
              },
              icon: const Icon(
                Icons.logout,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          child: Column(
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
              const CircleAvatar(
                backgroundImage: AssetImage('images/profile/profile.jpg'),
                maxRadius: 56,
              ),
              const Text(
                "Dilanka Yasuru",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Text(
                "@dilanka",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).orientation == Orientation.portrait ? double.infinity : 320),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)),
                          ),
                          label: Text("First name"),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)),
                          ),
                          label: Text("Last name"),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)),
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
          ),
        ),
      )),
    );
  }
}
