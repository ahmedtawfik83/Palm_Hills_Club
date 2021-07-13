import 'dart:convert';

import 'Users.dart';

class QrCode {
  final String id;
  final int club_id;
  final String username;
  final String code;
  final bool isUsed;
  final DateTime validUntil;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Users user;
  final String userID;

  QrCode(this.id, this.club_id, this.username, this.code, this.isUsed,
      this.validUntil, this.createdAt, this.updatedAt, this.user, this.userID);

  QrCode.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        club_id = json['club_id'],
        username = json['username'],
        code = json['code'],
        isUsed = json['isUsed'],
        validUntil = json['validUntil'] != null
            ? DateTime.parse(json['validUntil'])
            : null,
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
        'code': code,
        'isUsed': isUsed,
        'validUntil': validUntil?.millisecondsSinceEpoch,
        'createdAt': createdAt?.millisecondsSinceEpoch,
        'updatedAt': updatedAt?.millisecondsSinceEpoch,
        'user': user?.toJson(),
        'userID': userID
      };
}
