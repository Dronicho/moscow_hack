import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moscow/domain/services/firebase_storage.dart';

class ImageLoader extends InheritedWidget {
  final _storage = GetIt.I<FirebaseStorageService>();
  final _picker = ImagePicker();

  ImageLoader({Key? key, required this.child}) : super(key: key, child: child);

  final Widget child;

  Future<_ImagePayload> uploadImage() async {
    final res = await _picker.getImage(source: ImageSource.gallery);
    if (res != null) {
      final name = res.path.split('/').last;
      final url = await _storage.uploadFile(
          File(res.path), '/images' + res.path.split('/').join(''));
      return _ImagePayload(File(res.path), url, name);
    }
    return _ImagePayload(null, '', '');
  }

  static ImageLoader? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ImageLoader>();
  }

  @override
  bool updateShouldNotify(ImageLoader oldWidget) {
    return true;
  }
}

class _ImagePayload {
  final File? file;
  final String url;
  final String name;

  _ImagePayload(this.file, this.url, this.name);
}
