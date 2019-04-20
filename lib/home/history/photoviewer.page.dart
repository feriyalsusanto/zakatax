import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewerPage extends StatefulWidget {
  String path;

  PhotoViewerPage(this.path);

  @override
  _PhotoViewerPageState createState() {
    return _PhotoViewerPageState();
  }
}

class _PhotoViewerPageState extends State<PhotoViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
          enableRotation: false,
      maxScale: 1.0,
      minScale: 0.1,
      imageProvider: FileImage(File(widget.path)),
    ));
  }
}
