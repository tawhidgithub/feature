import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice/app/module/OAuth%20Feature/afterLogin.dart';

class OAuthLoginView extends StatefulWidget {
  const OAuthLoginView({super.key});

  @override
  State<OAuthLoginView> createState() => _OAuthLoginViewState();
}

class _OAuthLoginViewState extends State<OAuthLoginView> {
  Future<void> signinWithGoogle() async {
    final GoogleSignInAccount user = await GoogleServices.login();

    if (user != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AfterLogin(user: user)));
    }
    print("-------------------------$user");
  }

  Future<void> signOutWithGoogle() async {
    GoogleServices.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OAuth Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () => {signinWithGoogle()},
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign in with google"),
                        ],
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () => {signOutWithGoogle()},
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign out with google"),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class GoogleServices {
  static final _googlesingin = GoogleSignIn();

  static login() => _googlesingin.signIn();
  static logout() => _googlesingin.disconnect();
}
