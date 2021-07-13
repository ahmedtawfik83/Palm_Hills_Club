import 'GatesAccessLog.dart';
import 'QRCodes.dart';

class Users {
  final String id;
  final int club_id;
  final String username;
  final String phoneNumber;
  final String email;
  final String membershipNumber;
  final int userType;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<QrCode> qrCode;
  final List<GateAccessLog> gateAccessLog;

  Users.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        club_id = json['club_id'],
        username = json['username'],
        phoneNumber = json['phoneNumber'],
        email = json['email'],
        membershipNumber = json['membershipNumber'],
        userType = json['userType'],
        isVerified = json['isVerified'],
        createdAt = json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt = json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        qrCode = json['QRCode'] is List
            ? (json['QRCode'] as List)
                .map((e) => QrCode.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        gateAccessLog = json['GateAccessLog'] is List
            ? (json['GateAccessLog'] as List)
                .map((e) =>
                    GateAccessLog.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'club_id': club_id,
        'username': username,
        'phoneNumber': phoneNumber,
        'email': email,
        'membershipNumber': membershipNumber,
        'userType': userType,
        'isVerified': isVerified,
        'createdAt': createdAt?.millisecondsSinceEpoch,
        'updatedAt': updatedAt?.millisecondsSinceEpoch,
        'QRCode': qrCode.map((e) => e.toJson()).toList(),
        'GateAccessLog': gateAccessLog.map((e) => e.toJson()).toList()
      };
}
