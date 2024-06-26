import 'package:hive/hive.dart';

part 'notes.g.dart';

@HiveType(typeId: 1)
class Notes
{
  @HiveField(0)
  final String judul;

  @HiveField(1)
  final String deskripsi;

  @HiveField(2)
  final String createdAt;

  @HiveField(3)
  final DateTime updatedAt;

  Notes({
    required this.judul,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt
  });
}