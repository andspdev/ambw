import 'package:hive/hive.dart';

part 'notes.g.dart';

@HiveType(typeId: 1)
class Notes extends HiveObject
{
  @HiveField(0)
  String judul;

  @HiveField(1)
  String deskripsi;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  DateTime updatedAt;

  Notes({
    required this.judul,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt
  });
}