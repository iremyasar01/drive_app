import 'package:drive_app/domain/entities/file_item.dart';
import 'package:drive_app/domain/repositories/file_repository.dart';
import 'package:flutter/material.dart';

class FileRepositoryImpl implements FileRepository {
  @override
  Future<List<FileItem>> getFiles() async {
    // Burada gerçek veri kaynağından (API, local DB) verileri alırız
    await Future.delayed(const Duration(milliseconds: 500));
    
    return [
     FileItem(
      name: 'Projeler',
      type: 'Klasör',
      size: '15 öğe',
      date: '28 Eyl',
      icon: Icons.folder,
      color: Colors.amber,
      isFolder: true,
    ),
    FileItem(
      name: 'Fotoğraflar',
      type: 'Klasör',
      size: '48 öğe',
      date: '25 Eyl',
      icon: Icons.folder,
      color: Colors.blue,
      isFolder: true,
    ),
    FileItem(
      name: 'Sunum.pdf',
      type: 'PDF',
      size: '2.4 MB',
      date: '29 Eyl',
      icon: Icons.picture_as_pdf,
      color: Colors.red,
    ),
    FileItem(
      name: 'Rapor.docx',
      type: 'Word',
      size: '856 KB',
      date: '27 Eyl',
      icon: Icons.description,
      color: Colors.blue,
    ),
    FileItem(
      name: 'Grafik.png',
      type: 'Resim',
      size: '1.2 MB',
      date: '26 Eyl',
      icon: Icons.image,
      color: Colors.green,
    ),
    FileItem(
      name: 'Video.mp4',
      type: 'Video',
      size: '45 MB',
      date: '24 Eyl',
      icon: Icons.video_file,
      color: Colors.purple,
    ),
  
    ];
  }

  @override
  Future<void> uploadFile() {
    // Upload işlemleri
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> createFolder() {
    // Klasör oluşturma işlemleri
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> deleteFile(FileItem file) {
    // Silme işlemleri
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> shareFile(FileItem file) {
    // Paylaşma işlemleri
    return Future.delayed(const Duration(seconds: 1));
  }
}