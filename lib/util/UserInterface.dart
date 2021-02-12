import 'package:base_mvvmp/util/AppRouter.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toast/toast.dart';

import 'Colors.dart';
import 'DefaultText.dart';

class UserInterface {

  BuildContext context;

  UserInterface(this.context);

  static UserInterface of(BuildContext context) {
    return UserInterface(context);
  }

  static Widget shimmer({
    double height = 48,
    double width = 48,
    double borderRadius = 0,
    Color baseColor,
    Color highlightColor,
    EdgeInsets margin = const EdgeInsets.all(0),
    ShimmerDirection direction = ShimmerDirection.ltr,
  }){
    return Padding(
      padding: margin,
      child: Shimmer.fromColors(
        baseColor: baseColor ?? Colors.grey[200],
        highlightColor: highlightColor ?? Colors.grey[300],
        direction: direction,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))
          ),
          height: height,
          width: width,
        ),
      ),
    );
  }
  static Widget appBar({Color color, String title}) {
    return AppBar(
      backgroundColor: color,
      title: DefaultText(
        textLabel: title,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  successAlert({String title = '', String message = '', int duration = 3}){
    _alert(title: title, message: message, duration: duration);
  }

  errorAlert({String title = '', String message = '', int duration = 3}){
    _alert(title: title, message: message, duration: duration, isSuccess: false);
  }

  static Widget snackbar(context, String content, String label, Function action) {

    return SnackBar(
      content: DefaultText(textLabel: content,),
      action: SnackBarAction(
          label: label,
          onPressed: () => action
      ),
    );
  }

  _alert({String title = '', String message = '', int duration = 3, bool isSuccess = true}){
    Flushbar(
      title: title,
      messageText: Text(message,
        maxLines: 10,
        style: TextStyle(
            color: Colors.white
        ),
      ),
      duration: Duration(seconds: duration),
      backgroundColor: isSuccess ? Colors.orange : Color(0xFF303030),
      flushbarPosition: isSuccess ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
    )..show(context);
  }

  alertPopUp({String message,bool isSuccess, Color color}){
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          backgroundColor: color,
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                      color: ColorsState.white,
                    ),
                    padding: EdgeInsets.all(25),
                    child: Text(message)),
                GestureDetector(
                  onTap: (){
                    AppsRouter.pop(context);
                    if (isSuccess) {
                      AppsRouter.pop(context);
                    }
                  },
                  child: DefaultText(
                    padding: EdgeInsets.all(20),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    textLabel: isSuccess ? "Ok" : "Close",
                    colorsText: Colors.white,
                    colorbackground: color,
                  ),
                )
              ],
            ),
          ),
          contentPadding: EdgeInsets.all(0),
          insetPadding: EdgeInsets.all(20),
        ));

  }

  dialogPopUp({String title,String buttonText,String content,Function onTap,bool isSuccess}){

    Color color = isSuccess ? Colors.greenAccent : ColorsState.colorPrimaryRed;

    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height:60,
                  width: 60,
                  margin: EdgeInsets.only(top: 40),
                  child: Icon(isSuccess ? Icons.check : Icons.warning_amber_outlined),
                ),
                DefaultText(
                  textLabel: title,
                  margin: EdgeInsets.only(top: 8),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  colorsText: color,
                  fontWeight: FontWeight.bold,
                  sizeText: 16,
                ),
                DefaultText(
                  textLabel: content,
                  margin: EdgeInsets.only(top: 8),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  colorsText: Colors.grey,
                  sizeText: 14,
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: RaisedButton(onPressed: onTap,
                    color: color,
                    child: DefaultText(
                      textLabel: buttonText == null ? 'Ok' : buttonText,
                      colorsText: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          contentPadding: EdgeInsets.all(0),
          insetPadding: EdgeInsets.all(20),
        ));
  }



}

