import 'package:drive_app/domain/repositories/file_repository.dart';

class UploadFileUseCase {
  final FileRepository repository;

  UploadFileUseCase(this.repository);

  Future<void> execute() {
    return repository.uploadFile();
  }
}