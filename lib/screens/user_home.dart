import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  String fileName = "";
  XFile? xfile;

  @override
  Widget build(BuildContext context) {
    //String getEmail() {}

    void signOut() {
      FirebaseAuth.instance.signOut();
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            // height: height * 0.05,
            // width: width * 0.9,
            child: fileName == ''
                ? Container(
                    height: height * 0.7,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      border: Border.all(
                        color: Colors.black,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                : Image.network(fileName),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          ElevatedButton(
            onPressed: () {
              pickImage();
            },
            child: const Text(
              'Upload',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Submit',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          TextButton(
            onPressed: () {
              signOut();
            },
            child: const Text(
              "Sign out",
              style: TextStyle(
                color: Colors.deepPurpleAccent,
              ),
            ),
          )
        ],
      ),
    );
  }

  void pickImage() async {
    xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    print(xfile!.path);
    if (xfile != null) {
      fileName = xfile!.name;
      print(fileName);
      setState(() {});
    }
  }
}
