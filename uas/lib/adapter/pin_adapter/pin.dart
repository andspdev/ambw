import 'package:hive/hive.dart';

part 'pin.g.dart';

@HiveType(typeId: 0)
class Pin extends HiveObject
{
  @HiveField(0)
  final int? pin;

  Pin({
    required this.pin
  });
}