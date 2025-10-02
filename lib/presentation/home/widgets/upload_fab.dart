import 'package:drive_app/domain/usecases/upload_file_usecase.dart';
import 'package:flutter/material.dart';

class UploadFab extends StatelessWidget {
  final UploadFileUseCase uploadFileUseCase;
  final Function(BuildContext) showUploadOptions;

  const UploadFab({
    super.key,
    required this.uploadFileUseCase,
    required this.showUploadOptions,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => showUploadOptions(context),
      icon: const Icon(Icons.add, color: Colors.white),
      label: const Text('Yükle', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue,
    );
  }
}