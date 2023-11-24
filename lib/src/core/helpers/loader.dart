import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

    void showLoader() {
    if (!isOpen) {
      setState(() {
        isOpen = true;
      });
      showDialog(
        context: context,
        builder: (_) {
          return AbsorbPointer(
            absorbing: true,
            child: LoadingAnimationWidget.dotsTriangle(
              color: Colors.red,
              size: 60,
            ),
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }
}
