import 'package:drive_app/common/widgets/app_bar.dart';
import 'package:drive_app/common/widgets/bottom_nav_bar.dart';
import 'package:drive_app/domain/entities/file_item.dart';
import 'package:drive_app/domain/usecases/get_files_usecase.dart';
import 'package:drive_app/domain/usecases/upload_file_usecase.dart';
import 'package:drive_app/injection_container.dart';
import 'package:drive_app/presentation/home/widgets/file_view_section.dart';
import 'package:drive_app/presentation/home/widgets/upload_fab.dart';
import 'package:drive_app/presentation/home/widgets/file_action_sheets.dart';
import 'package:drive_app/presentation/home/widgets/quick_access_section.dart';
import 'package:drive_app/presentation/home/widgets/storage_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isGridView = false;
  int selectedIndex = 0;
  late final GetFilesUseCase getFilesUseCase;
  late final UploadFileUseCase uploadFileUseCase;

  List<FileItem> files = [];

  @override
  void initState() {
    super.initState();
    getFilesUseCase = ServiceLocator().getFilesUseCase;
    uploadFileUseCase = ServiceLocator().uploadFileUseCase;
    _loadFiles();
  }

  Future<void> _loadFiles() async {
    final loadedFiles = await getFilesUseCase.execute();
    setState(() => files = loadedFiles);
  }

  void _showUploadOptions(BuildContext context) {
    FileActionSheets.showUploadOptions(
      context: context,
      uploadFileUseCase: uploadFileUseCase,
    );
  }

  void _showFileOptions(FileItem file) {
    FileActionSheets.showFileOptions(context: context, file: file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MyAppBar(
        isGridView: isGridView,
        onViewChanged: () => setState(() => isGridView = !isGridView),
        onSearch: () {}, 
        onMore: () {}, 
      ),
      body: RefreshIndicator(
        onRefresh: _loadFiles,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const StorageCard(),
              const QuickAccessSection(),
              FileViewSection(
                isGridView: isGridView,
                files: files,
                onFileTap: _showFileOptions,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: UploadFab(
        uploadFileUseCase: uploadFileUseCase,
        showUploadOptions: _showUploadOptions,
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: selectedIndex,
        onItemTapped: (index) => setState(() => selectedIndex = index),
      ),
    );
  }
}