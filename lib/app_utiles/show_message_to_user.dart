import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

enum MessageType { error, success }

Future<dynamic> showMessage(
  BuildContext context, {
  MessageType messageType = MessageType.error,
  String? title,
  required String message,
}) {
  final Color backgroundColor = messageType == MessageType.error
      ? Colors.red
      : Colors.grey;
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    title: title,
    isDismissible: true,
    endOffset: const Offset(0, -.15),
    duration: const Duration(seconds: 6),
    messageText: Text(
      message,
      style: Theme.of(context).textTheme.caption?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
    ),
    padding: const EdgeInsets.only(
        top: kToolbarHeight * 1.25, bottom: 16, left: 16, right: 16),

    backgroundColor: backgroundColor,
 
  ).show(context);
}
