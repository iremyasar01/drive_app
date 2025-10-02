import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isGridView;
  final VoidCallback onViewChanged;
  final VoidCallback onSearch;
  final VoidCallback onMore;

  const MyAppBar({
    super.key,
    required this.isGridView,
    required this.onViewChanged,
    required this.onSearch,
    required this.onMore,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        'Dosyalarım',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Icon(
            isGridView ? Icons.list : Icons.grid_view,
            color: Colors.black87,
          ),
          onPressed: onViewChanged,
        ),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black87),
          onPressed: onSearch,
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black87),
          onPressed: onMore,
        ),
      ],
    );
  }
}