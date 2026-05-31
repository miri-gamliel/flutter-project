import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  TextEditingController controller = TextEditingController();
  String url = '';

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  void showQR() {
    setState(() {
      url =
          'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${controller.text}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter text or URL',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.text.isEmpty ? null : showQR,
              child: Text('Generate'),
            ),
            SizedBox(height: 20),
            url.isEmpty ? Container() : Image.network(url),
          ],
        ),
      ),
    );
  }
}
