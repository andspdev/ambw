import 'package:hive/hive.dart';

part 'pin.g.dart';

@HiveType(typeId: 0)
class Pin
{
  @HiveField(0)
  final int pin;

  @HiveField(1)
  final DateTime createdAt;

  @HiveField(2)
  final DateTime updatedAt;

  Pin({
    required this.pin,
    required this.createdAt,
    required this.updatedAt
  });
}