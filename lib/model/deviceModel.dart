import 'package:isar/isar.dart';

part 'deviceModel.g.dart';

@Collection()
class Device {
  @Id()
  int id = Isar.autoIncrement;

  String deviceId;

  List<String> topics;

  Device({
    required this.deviceId,
    required this.topics,
  });
}
