import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

final db = GetStorage();

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Storage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Enter your Email',
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: 'Enter your Password',
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                db.write('email', email.text);
                if (email.text.isNotEmpty && password.text.isNotEmpty) {
                  db.write('email', email.text);
                  print('email:$email');
                }
              },
              child: Container(
                height: 60.h,
                width: 200.w,
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(
                  child: Text(
                    'Save Data',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 60.h,
              width: 200.w,
              decoration: BoxDecoration(color: Colors.amber),
              child: Center(
                  child:
                      Text('Show Data', style: TextStyle(color: Colors.black))),
            ),
          ],
        ),
      ),
    );
  }
}
