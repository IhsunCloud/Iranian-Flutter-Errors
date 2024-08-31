import 'package:flutter/material.dart';
import 'package:iranian_errors/iranian_errors.dart';

void main() => runApp(const Kernel());

class Kernel extends StatelessWidget {
  const Kernel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Error Manager'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await ErrorHandler.handleNetworkError(
                () => print('Network blocked'),
                () => print('Other network error'),
              );
            },
            child: const Text('Check Network'),
          ),
        ),
      ),
    );
  }
}
