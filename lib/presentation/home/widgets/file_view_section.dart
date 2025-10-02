import 'package:drive_app/domain/entities/file_item.dart';
import 'package:drive_app/presentation/home/widgets/file_grid_view.dart';
import 'package:drive_app/presentation/home/widgets/file_list_view.dart';
import 'package:flutter/material.dart';

class FileViewSection extends StatelessWidget {
  final bool isGridView;
  final List<FileItem> files;
  final Function(FileItem) onFileTap;

  const FileViewSection({
    super.key,
    required this.isGridView,
    required this.files,
    required this.onFileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFilesHeader(),
        isGridView
            ? FileGridView(files: files, onFileTap: onFileTap)
            : FileListView(files: files, onFileTap: onFileTap),
      ],
    );
  }

  Widget _buildFilesHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Tüm Dosyalar',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.sort, color: Colors.black87),
            label: const Text(
              'Sırala',
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}