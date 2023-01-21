import 'package:flutter/material.dart';

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Following',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white70)),
              SizedBox(
                width: 7,
              ),
              Container(
                color: Colors.white70,
                height: 10,
                width: 1.0,
              ),
              SizedBox(
                width: 7,
              ),
              Text('For You',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))
            ]),
      ),
    );
  }
}
