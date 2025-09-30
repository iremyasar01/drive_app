import 'package:drive_app/domain/entities/file_item.dart';
import 'package:flutter/material.dart';
class FileListView extends StatelessWidget {
  final List<FileItem> files;
  final Function(FileItem) onFileTap;

  const FileListView({
    super.key,
    required this.files,
    required this.onFileTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: files.length,
      itemBuilder: (context, index) {
        final file = files[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: file.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(file.icon, color: file.color),
            ),
            title: Text(
              file.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text('${file.size} • ${file.date}'),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => onFileTap(file),
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}