import 'package:drive_app/domain/entities/file_item.dart';
import 'package:drive_app/domain/repositories/file_repository.dart';

class GetFilesUseCase {
  final FileRepository repository;

  GetFilesUseCase(this.repository);

  Future<List<FileItem>> execute() {
    return repository.getFiles();
  }
}