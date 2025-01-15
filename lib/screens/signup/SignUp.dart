import 'package:bidgrab/controllers/auth_controller.dart';
import 'package:bidgrab/models/user.dart';
import 'package:bidgrab/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../components/CurvedBottomContainer.dart';
import '../signin/SignIn.dart';
import '../../providers/authProvider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  static String id = '/signup';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String error = "";
  bool isSubmitting = false;

  void setError(String error) {
    setState(() {
      this.error = error;
    });
  }

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void handleSingUp() async {
    try {
      setState(() {
        isSubmitting = true;
      });
      final emailRegEx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      final passwordRegEx = RegExp(
          r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*[!@#\$&*~]).{8,}$');

      if (_nameController.text.isEmpty) {
        setError("Please enter a valid name!");
        setState(() {
          isSubmitting = false;
        });
        return;
      }
      if (_emailController.text.isEmpty ||
          !emailRegEx.hasMatch(_emailController.text)) {
        setError("Please enter a valid email!");
        setState(() {
          isSubmitting = false;
        });
        return;
      }
      if (_passwordController.text.isEmpty ||
          !passwordRegEx.hasMatch(_passwordController.text)) {
        setError("Please enter a valid password!");
        setState(() {
          isSubmitting = false;
        });
        return;
      }
      if (_confirmPasswordController.text != _passwordController.text) {
        setError("Passwords do not match!");
        setState(() {
          isSubmitting = false;
        });
        return;
      }


      User user = await Auth.register(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
      );
      Provider.of<AuthProvider>(context, listen: false).setUser(user);
      setError("");
      setState(() {
        isSubmitting = false;
      });
      Navigator.pushNamed(context, '/');
      return;
    } catch (error) {
      setError(error.toString());
      setState(() {
        isSubmitting = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: MediaQuery
            .of(context)
            .orientation == Orientation.portrait
            ? null
            : const Text(
          "Sign up",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MediaQuery
                .of(context)
                .orientation == Orientation.portrait
                ? Column(
              children: [
                CurvedBottomContainer(
                  child: Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: const Column(
                      children: [
                        Text(
                          "BidGrab",
                          style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            textAlign: TextAlign.center,
                            "Bid, Win, and Save Big on Unique Items!",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 72,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 64,
                )
              ],
            )
                : Container(),
            Container(
              padding: const EdgeInsets.all(16),
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(64)),
                      ),
                      label: Text("Name"),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(64)),
                      ),
                      label: Text("Email"),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(64)),
                      ),
                      label: Text("Password"),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(64)),
                      ),
                      label: Text("Confirm Password"),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FilledButton(
                    onPressed: isSubmitting ? () {} : () => handleSingUp(),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      child: isSubmitting
                          ? Row(
                        children: [
                          LoadingAnimationWidget.inkDrop(
                            color: Colors.white,
                            size: 26,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            "Submitting...",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      )
                          : const Text(
                        textAlign: TextAlign.center,
                        "Sign up",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    error,
                    style: const TextStyle(
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .orientation == Orientation.portrait
                  ? 64
                  : 0,
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Signin.id);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Consumer<ThemeProvider>(
                      builder: (context, value, child) =>
                          Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: value.darkModeEnabled
                                    ? Colors.white
                                    : Colors.black),
                          ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
