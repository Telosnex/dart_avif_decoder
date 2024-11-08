import 'dart:ui';

import 'package:dart_avif_decoder/dart_avif_decoder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  print('about to init');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget encoderOutput = Container();
  Widget encoderOutput2 = Container();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          actions: [
            IconButton(
              icon: const Icon(Icons.repeat_outlined),
              tooltip: 'Decode Demo',
              onPressed: () async {
                final bytes = await rootBundle.load("assets/vettel.avif");
                final avifBytes = await decodeAvif(bytes.buffer.asUint8List());
                // Now that the avif is here, we need to display its image pkg
                // image property in a normal Flutter Image widget.
                final hi = avifBytes.first.image;
                final pngByteData =
                    await hi.toByteData(format: ImageByteFormat.png);
                final pngBytes = pngByteData!.buffer.asUint8List();
                setState(() {
                  encoderOutput = Image.memory(
                    pngBytes,
                    height: 200,
                    fit: BoxFit.contain,
                  );
                });
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            encoderOutput,
          ],
        ),
      ),
    );
  }
}
