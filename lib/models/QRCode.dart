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
// import 'package:flutter/foundation.dart';
//
// /** This is an auto generated class representing the QRCode type in your schema. */
// @immutable
// class QRCode extends Model {
//   static const classType = const _QRCodeModelType();
//   final String id;
//   final int club_id;
//   final String username;
//   final String code;
//   final bool isUsed;
//   final DateTime validUntil;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final User user;
//   final String userID;
//
//   @override
//   getInstanceType() => classType;
//
//   @override
//   String getId() {
//     return id;
//   }
//
//   const QRCode._internal(
//       {@required this.id,
//       @required this.club_id,
//       @required this.username,
//       @required this.code,
//       @required this.isUsed,
//       @required this.validUntil,
//       this.createdAt,
//       this.updatedAt,
//       this.user,
//       this.userID});
//
//   factory QRCode(
//       {String id,
//       @required int club_id,
//       @required String username,
//       @required String code,
//       @required bool isUsed,
//       @required DateTime validUntil,
//       DateTime createdAt,
//       DateTime updatedAt,
//       User user,
//       String userID}) {
//     return QRCode._internal(
//         id: id == null ? UUID.getUUID() : id,
//         club_id: club_id,
//         username: username,
//         code: code,
//         isUsed: isUsed,
//         validUntil: validUntil,
//         createdAt: createdAt,
//         updatedAt: updatedAt,
//         user: user,
//         userID: userID);
//   }
//
//   bool equals(Object other) {
//     return this == other;
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     return other is QRCode &&
//         id == other.id &&
//         club_id == other.club_id &&
//         username == other.username &&
//         code == other.code &&
//         isUsed == other.isUsed &&
//         validUntil == other.validUntil &&
//         createdAt == other.createdAt &&
//         updatedAt == other.updatedAt &&
//         user == other.user &&
//         userID == other.userID;
//   }
//
//   @override
//   int get hashCode => toString().hashCode;
//
//   @override
//   String toString() {
//     var buffer = new StringBuffer();
//
//     buffer.write("QRCode {");
//     buffer.write("id=" + "$id" + ", ");
//     buffer.write(
//         "club_id=" + (club_id != null ? club_id.toString() : "null") + ", ");
//     buffer.write("username=" + "$username" + ", ");
//     buffer.write("code=" + "$code" + ", ");
//     buffer.write(
//         "isUsed=" + (isUsed != null ? isUsed.toString() : "null") + ", ");
//     buffer.write("validUntil=" +
//         (validUntil != null ? validUntil.toString() : "null") +
//         ", ");
//     buffer.write("createdAt=" +
//         (createdAt != null ? createdAt.toString() : "null") +
//         ", ");
//     buffer.write("updatedAt=" +
//         (updatedAt != null ? updatedAt.toString() : "null") +
//         ", ");
//     buffer.write("user=" + (user != null ? user.toString() : "null") + ", ");
//     buffer.write("userID=" + "$userID");
//     buffer.write("}");
//
//     return buffer.toString();
//   }
//
//   QRCode copyWith(
//       {String id,
//       int club_id,
//       String username,
//       String code,
//       bool isUsed,
//       TemporalTimestamp validUntil,
//       TemporalTimestamp createdAt,
//       TemporalTimestamp updatedAt,
//       User user,
//       String userID}) {
//     return QRCode(
//         id: id ?? this.id,
//         club_id: club_id ?? this.club_id,
//         username: username ?? this.username,
//         code: code ?? this.code,
//         isUsed: isUsed ?? this.isUsed,
//         validUntil: validUntil ?? this.validUntil,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         user: user ?? this.user,
//         userID: userID ?? this.userID);
//   }
//
//   QRCode.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         club_id = json['club_id'],
//         username = json['username'],
//         code = json['code'],
//         isUsed = json['isUsed'],
//         validUntil = json['validUntil'] != null
//             ? DateTime.parse(json['validUntil'])
//             : null,
//         createdAt = json['createdAt'] != null
//             ? DateTime.parse(json['createdAt'])
//             : null,
//         updatedAt = json['updatedAt'] != null
//             ? DateTime.parse(json['updatedAt'])
//             : null,
//         user = json['user'] != null
//             ? User.fromJson(new Map<String, dynamic>.from(json['user']))
//             : null,
//         userID = json['userID'];
//
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'club_id': club_id,
//         'username': username,
//         'code': code,
//         'isUsed': isUsed,
//         'validUntil': validUntil?.millisecondsSinceEpoch,
//         'createdAt': createdAt?.millisecondsSinceEpoch,
//         'updatedAt': updatedAt?.millisecondsSinceEpoch,
//         'user': user?.toJson(),
//         'userID': userID
//       };
//
//   static final QueryField ID = QueryField(fieldName: "qRCode.id");
//   static final QueryField CLUB_ID = QueryField(fieldName: "club_id");
//   static final QueryField USERNAME = QueryField(fieldName: "username");
//   static final QueryField CODE = QueryField(fieldName: "code");
//   static final QueryField ISUSED = QueryField(fieldName: "isUsed");
//   static final QueryField VALIDUNTIL = QueryField(fieldName: "validUntil");
//   static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
//   static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
//   static final QueryField USER = QueryField(
//       fieldName: "user",
//       fieldType: ModelFieldType(ModelFieldTypeEnum.model,
//           ofModelName: (User).toString()));
//   static final QueryField USERID = QueryField(fieldName: "userID");
//   static var schema =
//       Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
//     modelSchemaDefinition.name = "QRCode";
//     modelSchemaDefinition.pluralName = "QRCodes";
//
//     modelSchemaDefinition.authRules = [
//       AuthRule(
//           authStrategy: AuthStrategy.OWNER,
//           ownerField: "owner",
//           identityClaim: "cognito:username",
//           operations: [
//             ModelOperation.CREATE,
//             ModelOperation.UPDATE,
//             ModelOperation.DELETE,
//             ModelOperation.READ
//           ])
//     ];
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.id());
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: QRCode.CLUB_ID,
//         isRequired: true,
//         ofType: ModelFieldType(ModelFieldTypeEnum.int)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: QRCode.USERNAME,
//         isRequired: true,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: QRCode.CODE,
//         isRequired: true,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: QRCode.ISUSED,
//         isRequired: true,
//         ofType: ModelFieldType(ModelFieldTypeEnum.bool)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: QRCode.VALIDUNTIL,
//         isRequired: true,
//         ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: QRCode.CREATEDAT,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: QRCode.UPDATEDAT,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
//         key: QRCode.USER,
//         isRequired: false,
//         targetName: "qrCodeUserId",
//         ofModelName: (User).toString()));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: QRCode.USERID,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));
//   });
// }
//
// class _QRCodeModelType extends ModelType<QRCode> {
//   const _QRCodeModelType();
//
//   @override
//   QRCode fromJson(Map<String, dynamic> jsonData) {
//     return QRCode.fromJson(jsonData);
//   }
// }
