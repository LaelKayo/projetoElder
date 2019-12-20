import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = false, _isInit = true;
  PDFDocument document;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: _isInit
                    ? Text('test')
                    : _isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : PDFViewer(document: document),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    child: Text('PDF'),
                    onPressed: () {
                      loadFromAssets();
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void loadFromAssets()async{
    setState(() {
      _isInit = false;
      _isLoading = true;
    });
    document = await PDFDocument.fromAsset("assets/manualHtml.pdf");
    setState(() {
      _isLoading = false;
    });
  }
}
