// /*
// * Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
// *
// * Licensed under the Apache License, Version 2.0 (the "License").
// * You may not use this file except in compliance with the License.
// * A copy of the License is located at
// *
// *  http://aws.amazon.com/apache2.0
// *
// * or in the "license" file accompanying this file. This file is distributed
// * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// * express or implied. See the License for the specific language governing
// * permissions and limitations under the License.
// */
//
// // ignore_for_file: public_member_api_docs
//
// import 'ModelProvider.dart';
// import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
// import 'package:collection/collection.dart';
// import 'package:flutter/foundation.dart';
//
// /** This is an auto generated class representing the User type in your schema. */
// @immutable
// class User extends Model {
//   static const classType = const _UserModelType();
//   final String id;
//   final int club_id;
//   final String username;
//   final String phoneNumber;
//   final String email;
//   final String membershipNumber;
//   final int userType;
//   final bool isVerified;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final List<QRCode> qrCode;
//   final List<GateAccessLog> gateAccessLog;
//
//   @override
//   getInstanceType() => classType;
//
//   @override
//   String getId() {
//     return id;
//   }
//
//   const User._internal(
//       {@required this.id,
//       this.club_id,
//       @required this.username,
//       this.phoneNumber,
//       this.email,
//       this.membershipNumber,
//       @required this.userType,
//       this.isVerified,
//       this.createdAt,
//       this.updatedAt,
//       this.qrCode,
//       this.gateAccessLog});
//
//   factory User(
//       {String id,
//       int club_id,
//       @required String username,
//       String phoneNumber,
//       String email,
//       String membershipNumber,
//       @required int userType,
//       bool isVerified,
//       DateTime createdAt,
//       DateTime updatedAt,
//       List<QRCode> QRCode,
//       List<GateAccessLog> GateAccessLog}) {
//     return User._internal(
//         id: id == null ? UUID.getUUID() : id,
//         club_id: club_id,
//         username: username,
//         phoneNumber: phoneNumber,
//         email: email,
//         membershipNumber: membershipNumber,
//         userType: userType,
//         isVerified: isVerified,
//         createdAt: createdAt,
//         updatedAt: updatedAt,
//         qrCode: QRCode,
//         gateAccessLog: GateAccessLog);
//   }
//
//   bool equals(Object other) {
//     return this == other;
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     return other is User &&
//         id == other.id &&
//         club_id == other.club_id &&
//         username == other.username &&
//         phoneNumber == other.phoneNumber &&
//         email == other.email &&
//         membershipNumber == other.membershipNumber &&
//         userType == other.userType &&
//         isVerified == other.isVerified &&
//         createdAt == other.createdAt &&
//         updatedAt == other.updatedAt &&
//         DeepCollectionEquality().equals(QRCode, other.qrCode) &&
//         DeepCollectionEquality().equals(GateAccessLog, other.gateAccessLog);
//   }
//
//   @override
//   int get hashCode => toString().hashCode;
//
//   @override
//   String toString() {
//     var buffer = new StringBuffer();
//
//     buffer.write("User {");
//     buffer.write("id=" + "$id" + ", ");
//     buffer.write(
//         "club_id=" + (club_id != null ? club_id.toString() : "null") + ", ");
//     buffer.write("username=" + "$username" + ", ");
//     buffer.write("phoneNumber=" + "$phoneNumber" + ", ");
//     buffer.write("email=" + "$email" + ", ");
//     buffer.write("membershipNumber=" + "$membershipNumber" + ", ");
//     buffer.write(
//         "userType=" + (userType != null ? userType.toString() : "null") + ", ");
//     buffer.write("isVerified=" +
//         (isVerified != null ? isVerified.toString() : "null") +
//         ", ");
//     buffer.write("createdAt=" +
//         (createdAt != null ? createdAt.toString() : "null") +
//         ", ");
//     buffer.write(
//         "updatedAt=" + (updatedAt != null ? updatedAt.toString() : "null"));
//     buffer.write("}");
//
//     return buffer.toString();
//   }
//
//   User copyWith(
//       {String id,
//       int club_id,
//       String username,
//       String phoneNumber,
//       String email,
//       String membershipNumber,
//       int userType,
//       bool isVerified,
//       TemporalTimestamp createdAt,
//       TemporalTimestamp updatedAt,
//       List<QRCode> QRCode,
//       List<GateAccessLog> GateAccessLog}) {
//     return User(
//         id: id ?? this.id,
//         club_id: club_id ?? this.club_id,
//         username: username ?? this.username,
//         phoneNumber: phoneNumber ?? this.phoneNumber,
//         email: email ?? this.email,
//         membershipNumber: membershipNumber ?? this.membershipNumber,
//         userType: userType ?? this.userType,
//         isVerified: isVerified ?? this.isVerified,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         QRCode: QRCode ?? this.qrCode,
//         GateAccessLog: GateAccessLog ?? this.gateAccessLog);
//   }
//
//   User.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         club_id = json['club_id'],
//         username = json['username'],
//         phoneNumber = json['phoneNumber'],
//         email = json['email'],
//         membershipNumber = json['membershipNumber'],
//         userType = json['userType'],
//         isVerified = json['isVerified'],
//         createdAt = json['createdAt'] != null
//             ? DateTime.parse(json['createdAt'])
//             : null,
//         updatedAt = json['updatedAt'] != null
//             ? DateTime.parse(json['updatedAt'])
//             : null,
//         qrCode = json['QRCode'] is List
//             ? (json['QRCode'] as List)
//                 .map((e) => QRCode.fromJson(new Map<String, dynamic>.from(e)))
//                 .toList()
//             : null,
//         gateAccessLog = json['GateAccessLog'] is List
//             ? (json['GateAccessLog'] as List)
//                 .map((e) =>
//                     GateAccessLog.fromJson(new Map<String, dynamic>.from(e)))
//                 .toList()
//             : null;
//
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'club_id': club_id,
//         'username': username,
//         'phoneNumber': phoneNumber,
//         'email': email,
//         'membershipNumber': membershipNumber,
//         'userType': userType,
//         'isVerified': isVerified,
//         'createdAt': createdAt?.millisecondsSinceEpoch,
//         'updatedAt': updatedAt?.millisecondsSinceEpoch,
//         'QRCode': qrCode?.map((e) => e?.toJson())?.toList(),
//         'GateAccessLog': gateAccessLog?.map((e) => e?.toJson())?.toList()
//       };
//
//   static final QueryField ID = QueryField(fieldName: "user.id");
//   static final QueryField CLUB_ID = QueryField(fieldName: "club_id");
//   static final QueryField USERNAME = QueryField(fieldName: "username");
//   static final QueryField PHONENUMBER = QueryField(fieldName: "phoneNumber");
//   static final QueryField EMAIL = QueryField(fieldName: "email");
//   static final QueryField MEMBERSHIPNUMBER =
//       QueryField(fieldName: "membershipNumber");
//   static final QueryField USERTYPE = QueryField(fieldName: "userType");
//   static final QueryField ISVERIFIED = QueryField(fieldName: "isVerified");
//   static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
//   static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
//   static final QueryField QRCODE = QueryField(
//       fieldName: "QRCode",
//       fieldType: ModelFieldType(ModelFieldTypeEnum.model,
//           ofModelName: (QRCode).toString()));
//   static final QueryField GATEACCESSLOG = QueryField(
//       fieldName: "GateAccessLog",
//       fieldType: ModelFieldType(ModelFieldTypeEnum.model,
//           ofModelName: (GateAccessLog).toString()));
//   static var schema =
//       Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
//     modelSchemaDefinition.name = "User";
//     modelSchemaDefinition.pluralName = "Users";
//
//     modelSchemaDefinition.authRules = [
//       AuthRule(authStrategy: AuthStrategy.PRIVATE, operations: [
//         ModelOperation.CREATE,
//         ModelOperation.UPDATE,
//         ModelOperation.DELETE,
//         ModelOperation.READ
//       ])
//     ];
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.id());
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: User.CLUB_ID,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.int)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: User.USERNAME,
//         isRequired: true,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: User.PHONENUMBER,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: User.EMAIL,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: User.MEMBERSHIPNUMBER,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: User.USERTYPE,
//         isRequired: true,
//         ofType: ModelFieldType(ModelFieldTypeEnum.int)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: User.ISVERIFIED,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.bool)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: User.CREATEDAT,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: User.UPDATEDAT,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
//         key: User.QRCODE,
//         isRequired: false,
//         ofModelName: (QRCode).toString(),
//         associatedKey: QRCode.USERID));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
//         key: User.GATEACCESSLOG,
//         isRequired: false,
//         ofModelName: (GateAccessLog).toString(),
//         associatedKey: GateAccessLog.USERID));
//   });
// }
//
// class _UserModelType extends ModelType<User> {
//   const _UserModelType();
//
//   @override
//   User fromJson(Map<String, dynamic> jsonData) {
//     return User.fromJson(jsonData);
//   }
// }
