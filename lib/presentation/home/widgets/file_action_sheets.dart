import 'package:drive_app/domain/entities/file_item.dart';
import 'package:drive_app/domain/usecases/upload_file_usecase.dart';
import 'package:flutter/material.dart';

class FileActionSheets {
  static void showUploadOptions({
    required BuildContext context,
    required UploadFileUseCase uploadFileUseCase,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _UploadOptionsSheet(uploadFileUseCase: uploadFileUseCase),
    );
  }

  static void showFileOptions({
    required BuildContext context,
    required FileItem file,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _FileOptionsSheet(file: file),
    );
  }
}

class _UploadOptionsSheet extends StatelessWidget {
  final UploadFileUseCase uploadFileUseCase;

  const _UploadOptionsSheet({required this.uploadFileUseCase});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.upload_file, color: Colors.blue),
            title: const Text('Dosya Yükle'),
            onTap: () {
              uploadFileUseCase.execute();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.folder, color: Colors.amber),
            title: const Text('Klasör Oluştur'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera, color: Colors.green),
            title: const Text('Fotoğraf Çek'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class _FileOptionsSheet extends StatelessWidget {
  final FileItem file;

  const _FileOptionsSheet({required this.file});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Paylaş'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('İndir'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.drive_file_rename_outline),
            title: const Text('Yeniden Adlandır'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Sil', style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}