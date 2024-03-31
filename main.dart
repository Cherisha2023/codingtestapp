import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

void main() {
  runApp(CodingTestApp());
}

class CodingTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CodingTestScreen(),
    );
  }
}

class CodingTestScreen extends StatefulWidget {
  @override
  _CodingTestScreenState createState() => _CodingTestScreenState();
}

class _CodingTestScreenState extends State<CodingTestScreen> {
  final TextEditingController _codeController = TextEditingController();

  void _submitCode() {
    // Mock functionality for code submission
    String code = _codeController.text;
    print('Code Submitted: $code');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Code Submitted'),
          content: Text('Thank you for your submission!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coding Test'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Problem Statement:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Text(
                'Write a function that returns the sum of two numbers.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Plagiarism Warning: Copying code from other sources without proper attribution can lead to serious consequences.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Code Editor:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: TextFormField(
                controller: _codeController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Write your code here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitCode,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FancyButton(
                  onPressed: () {
                    // Add functionality for this button
                  },
                  icon: Icons.play_arrow,
                  label: 'Run',
                ),
                FancyButton(
                  onPressed: () {
                    // Add functionality for this button
                  },
                  icon: Icons.refresh,
                  label: 'Reset',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FancyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  const FancyButton({
    Key? key, // Make key parameter optional
    required this.onPressed,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  _FancyButtonState createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 1.0, end: 0.95).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: ElevatedButton.icon(
        onPressed: () {
          _animationController.forward();
          widget.onPressed();
        },
        icon: Icon(widget.icon),
        label: Text(
          widget.label,
          style: TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
