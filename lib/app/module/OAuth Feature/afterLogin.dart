import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice/app/module/OAuth%20Feature/loginView.dart';

class AfterLogin extends StatelessWidget {
  AfterLogin({super.key, required this.user});
  GoogleSignInAccount user;

  Future<void> signOutWithGoogle() async {
    await GoogleServices.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              child: Image.network(user.photoUrl ??
                  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.ac-illust.com%2Fclip-art%2F25480354%2Fno-image-thumbnail-1-with-no-image&psig=AOvVaw0vEoYRI_AaRVt12f7tECPu&ust=1740147478858000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJCEqsy40osDFQAAAAAdAAAAABAE"),
            ),
            Text(
              user.displayName!,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              user.email,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () => {
                      signOutWithGoogle().then((val) {
                        Navigator.pop(context);
                      })
                    },
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
