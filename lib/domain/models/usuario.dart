import 'package:meta/meta.dart';

class Usuario {
  late String nombre;
  int edad;
  List<String> profesiones;

  Usuario(
      {required this.nombre, required this.edad, required this.profesiones});
}

/* class NotificationModel {
  String to, title, body, fecha;

  int idNotificaciones;

  NotificationModel({
    required this.body,
    required this.fecha,
    required this.idNotificaciones,
    required this.title,
    required this.to,
  });

  static NotificationModel fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      idNotificaciones: json['idNotificaciones'] ?? 0,
      to: json['to'],
      title: json['title'] ?? "",
      body: json['body'] ?? "",
      fecha: json['Fecha'] ?? "",
    );
  }
}
 */