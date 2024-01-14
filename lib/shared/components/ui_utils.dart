import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoding(String message,BuildContext context){
  showDialog(context: context,
      barrierDismissible: false,
      builder: (context){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AlertDialog(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(message),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),

              ],
            ),
          ),
        );
      } );
}

void showMessage(BuildContext context,String message,
    String posBtn,VoidCallback posAction
    , {String? negBtn, VoidCallback? negAction}){
  showDialog(context: context, builder: (contex){
    List<Widget> actions=[
      TextButton(onPressed: posAction, child: Text(posBtn)),
    ];
    if(negBtn !=null){
      actions.add(TextButton(onPressed: negAction, child: Text(negBtn)));
    }
    return AlertDialog(
      title: Text(message),
      actions: actions,
    );
  });
}

void hideLoading(BuildContext context){
  Navigator.pop(context);
}