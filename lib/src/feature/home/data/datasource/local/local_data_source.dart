import 'package:hive/hive.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/notification_items.dart';

abstract class NotificationLocalDataSource {
  Future<List<NotificationItems>> getNotifications();

  Future<int> addNotification(NotificationItems item);

  Future<void> removeNotification(int index);

  Future<void> removeAllNotification();

  Future<int> isItemAdded(int id);
}

class NotificationLocalDataSourceImpl extends NotificationLocalDataSource {
  final Box _box = Hive.box('notification');

  @override
  Future<int> addNotification(NotificationItems item) async {
    return await _box.add(item);
  }

  @override
  Future<List<NotificationItems>> getNotifications() async {
    return _box.values
        .map((e) => NotificationItems.fromEntity(e))
        .toList();
  }

  @override
  Future<int> isItemAdded(int id) async {
    return _box.values.toList().indexWhere((e) => e.sessionId == id);
  }

  @override
  Future<void> removeAllNotification() async {
    await _box.clear();
  }

  @override
  Future<void> removeNotification(int index) async {
    await _box.deleteAt(index);
  }
}
