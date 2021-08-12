import 'package:flutter/material.dart';

class ErorrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Container(
          width: size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 72,
              ),
              SizedBox(
                height: 36,
              ),
              Text(
                  'Something went Wrong! We are Definetly Trying to fix it for you')
            ],
          ),
        ),
      ),
    );
  }
}
