import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyButton extends StatefulWidget {
  final String textToCopy;

  CopyButton({required this.textToCopy});

  @override
  _CopyButtonState createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> {
  late bool isCopied;

  @override
  void initState() {
    super.initState();
    isCopied = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 40,
      height: 40,
      child: IconButton(
        icon: isCopied
            ? Icon(Icons.check, color: Theme.of(context).colorScheme.secondary)
            : Icon(Icons.copy, color: Theme.of(context).colorScheme.secondary),
        onPressed: () {
          Clipboard.setData(ClipboardData(text: widget.textToCopy));

          setState(() {
            isCopied = true;
          });

          Timer(Duration(seconds: 3), () {
            setState(() {
              isCopied = false;
            });
          });
        },
      ),
    );
  }
}
