import 'package:flutter/material.dart';

class DialogBody extends StatelessWidget {
  final String dialogContent;
  const DialogBody({super.key, required this.dialogContent});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator.adaptive(strokeWidth: 1.5),
            ),
            const SizedBox(height: 15),
            Text(dialogContent),
          ],
        ),
      ),
    );
  }
}
