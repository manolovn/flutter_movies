import 'package:flutter/material.dart';

class ErrorCaseWidget extends StatelessWidget {
  const ErrorCaseWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.error, color: Colors.red[300], size: 64.0),
          Container(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              "Oooops, something went wrong :(",
              style: TextStyle(
                color: Colors.red[300],
              ),
            ),
          )
        ],
      ),
    );
  }
}
