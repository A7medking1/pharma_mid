import 'package:equatable/equatable.dart';

class QrCodeModel extends Equatable {
  final int orderId;
  final String orderDate;
  final List<Tickets> tickets;

  const QrCodeModel({
    required this.orderId,
    required this.orderDate,
    required this.tickets,
  });

  factory QrCodeModel.fromJson(Map<String, dynamic> json) {
    return QrCodeModel(
      orderId: json["order_id"],
      orderDate: json["order_date"],
      tickets:
      List<Tickets>.from((json["tickets"]).map((e) => Tickets.fromJson(e))),
    );
  }

  @override
  List<Object> get props => [orderId, orderDate, tickets];
}

class Tickets extends Equatable {
  final String id;
  final String time;
  final String code;

  const Tickets({
    required this.id,
    required this.time,
    required this.code,
  });


  factory Tickets.fromJson(Map<String, dynamic> json) {
    return Tickets(
      id: json["id"],
      time: json["time"],
      code: json["code"],
    );
  }

  @override
  List<Object> get props => [id, time, code];
}
