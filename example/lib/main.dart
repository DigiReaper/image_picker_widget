import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_widget/image_picker_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circle example
            ImagePickerWidget(
              width: 180,
              initialImage:
                  "https://strattonapps.com/wp-content/uploads/2020/02/flutter-logo-5086DD11C5-seeklogo.com_.png",
              shape: ImagePickerWidgetShape.circle,
              isEditable: true,
              shouldCrop: true,
              imagePickerOptions: ImagePickerOptions(
                imageQuality: 65
              ),
              onChange: (File file) {
                print("I changed the file to: ${file.path}");
              },
            ),
            
            SizedBox(height: 20),
            
            // Custom shape example
            ImagePickerWidget(
              width: 200,
              height: 150,
              shape: ImagePickerWidgetShape.custom,
              isEditable: true,
              shouldCrop: true,
              initialImage: "https://example.com/placeholder.jpg",
              onChange: (File file) {
                print("Custom shape image changed: ${file.path}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
