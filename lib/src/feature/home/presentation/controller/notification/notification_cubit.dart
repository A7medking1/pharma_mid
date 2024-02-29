import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:king_saud_hospital/src/feature/auth/presentation/screens/sign_in/widget/form_field.dart';
import 'package:king_saud_hospital/src/feature/home/data/datasource/local/local_data_source.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/notification_items.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  static NotificationCubit get(context) => BlocProvider.of(context);

  final NotificationLocalDataSource local = NotificationLocalDataSourceImpl();

  List<NotificationItems> notificationItems = [];

  void getNotifications() async {
    emit(GetNotificationLoading());
    try {
      notificationItems = await local.getNotifications();
      emit(GetNotificationSuccess());
    } catch (e) {
      showToast(msg: e.toString(), state: ToastStates.ERROR);
      emit(GetError());
    }
  }

  void addNotification(NotificationItems item) async {
    if ((await isItemAdded(item.sessionId)) == -1) {
      await local.addNotification(item);
    } else {
      return;
    }
  }

  Future<int> isItemAdded(int index) async {
    return await local.isItemAdded(index);
  }

  void removeAllNotification() async {
    try {
      await local.removeAllNotification();
      getNotifications();
    } catch (e) {
      showToast(msg: e.toString(), state: ToastStates.ERROR);
      emit(GetError());
    }
  }

  void removeNotification(int index) async {
    try {
      await local.removeNotification(index);
      getNotifications();
    } catch (e) {
      showToast(msg: e.toString(), state: ToastStates.ERROR);
      emit(GetError());
    }
  }
}
