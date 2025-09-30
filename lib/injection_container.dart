import 'package:drive_app/data/repositories/file_repository_impl.dart';
import 'package:drive_app/domain/repositories/file_repository.dart';
import 'package:drive_app/domain/usecases/get_files_usecase.dart';
import 'package:drive_app/domain/usecases/upload_file_usecase.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  FileRepository get fileRepository => FileRepositoryImpl();
  
  GetFilesUseCase get getFilesUseCase => GetFilesUseCase(fileRepository);
  UploadFileUseCase get uploadFileUseCase => UploadFileUseCase(fileRepository);
}