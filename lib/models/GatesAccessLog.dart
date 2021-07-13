import 'Users.dart';

class GateAccessLog {
  final String id;
  final int club_id;
  final String username;
  final int gate;
  final int QRCode;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Users user;
  final String userID;

  GateAccessLog.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        club_id = json['club_id'],
        username = json['username'],
        gate = json['gate'],
        QRCode = json['QRCode'],
        createdAt = json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt = json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        user = json['user'] != null
            ? Users.fromJson(new Map<String, dynamic>.from(json['user']))
            : null,
        userID = json['userID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'club_id': club_id,
        'username': username,
        'gate': gate,
        'QRCode': QRCode,
        'createdAt': createdAt?.millisecondsSinceEpoch,
        'updatedAt': updatedAt?.millisecondsSinceEpoch,
        'user': user?.toJson(),
        'userID': userID
      };
}
