import 'package:flutter/material.dart';

class FileItem {
  final String name;
  final String type;
  final String size;
  final String date;
  final IconData icon;
  final Color color;
  final bool isFolder;

  const FileItem({
    required this.name,
    required this.type,
    required this.size,
    required this.date,
    required this.icon,
    required this.color,
    this.isFolder = false,
  });
}