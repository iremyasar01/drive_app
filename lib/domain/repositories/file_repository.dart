import 'package:drive_app/domain/entities/file_item.dart';

abstract class FileRepository {
  Future<List<FileItem>> getFiles();
  Future<void> uploadFile();
  Future<void> createFolder();
  Future<void> deleteFile(FileItem file);
  Future<void> shareFile(FileItem file);
}