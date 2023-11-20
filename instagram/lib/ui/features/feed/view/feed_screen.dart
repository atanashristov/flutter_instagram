import 'package:flutter/material.dart';
import 'package:instagram/ui/widgets/buttons/buttons.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  static const String routeName = '/feed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrimaryButton(
          'Go to screen 1',
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<dynamic>(
              builder: (_) => Scaffold(
                appBar: AppBar(
                  title: const Text('Hello at screen 1!'),
                ),
                body: Center(
                  child: PrimaryButton(
                    'Go to screen 2',
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (_) => Scaffold(
                          appBar: AppBar(
                            title: const Text('Hello at screen 2!'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
