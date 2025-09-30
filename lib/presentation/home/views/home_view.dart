import 'package:drive_app/data/repositories/file_repository_impl.dart';
import 'package:drive_app/domain/entities/file_item.dart';
import 'package:drive_app/domain/repositories/file_repository.dart';
import 'package:drive_app/domain/usecases/get_files_usecase.dart';
import 'package:drive_app/domain/usecases/upload_file_usecase.dart';
import 'package:drive_app/presentation/home/widgets/file_grid_view.dart';
import 'package:drive_app/presentation/home/widgets/file_list_view.dart';
import 'package:drive_app/presentation/home/widgets/quick_access_section.dart';
import 'package:drive_app/presentation/home/widgets/storage_card.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGridView = false;
  int selectedIndex = 0;
  final FileRepository fileRepository = FileRepositoryImpl();
  late final GetFilesUseCase getFilesUseCase;
  late final UploadFileUseCase uploadFileUseCase;

  List<FileItem> files = [];

  @override
  void initState() {
    super.initState();
    getFilesUseCase = GetFilesUseCase(fileRepository);
    uploadFileUseCase = UploadFileUseCase(fileRepository);
    _loadFiles();
  }

  Future<void> _loadFiles() async {
    final loadedFiles = await getFilesUseCase.execute();
    setState(() {
      files = loadedFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Dosyalarım',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isGridView ? Icons.list : Icons.grid_view,
              color: Colors.black87,
            ),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadFiles,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const StorageCard(),
              const QuickAccessSection(),
              _buildFilesHeader(),
              isGridView 
                  ? FileGridView(files: files, onFileTap: _showFileOptions)
                  : FileListView(files: files, onFileTap: _showFileOptions),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showUploadOptions(context),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Yükle', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Dosyalar'),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: 'Paylaşılan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
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
            label: const Text('Sırala', style: TextStyle(color: Colors.black87),),
          ),
        ],
      ),
    );
  }

  void _showUploadOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
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
      ),
    );
  }

  void _showFileOptions(FileItem file) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
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
      ),
    );
  }
}