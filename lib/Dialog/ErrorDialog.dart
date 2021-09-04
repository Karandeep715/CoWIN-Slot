import 'package:flutter/material.dart';


class ErrorAlertDialog extends StatelessWidget {

  final String message;
  const ErrorAlertDialog({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(message),
      actions: <Widget>[
        TextButton(onPressed: ()
        {
          Navigator.pop(context);
        },

          child: Center(
            child: Text("OK",
            style: TextStyle(
               color: Colors.red,
    ),
            ),
          ),
        )
      ],


    );
  }
}
