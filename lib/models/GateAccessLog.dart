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
// import 'Users.dart';
//
// /** This is an auto generated class representing the GateAccessLog type in your schema. */
// @immutable
// class GateAccessLog extends Model {
//   static const classType = const _GateAccessLogModelType();
//   final String id;
//   final int club_id;
//   final String username;
//   final int gate;
//   final int QRCode;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final Users user;
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
//   const GateAccessLog._internal(
//       {@required this.id,
//       @required this.club_id,
//       @required this.username,
//       @required this.gate,
//       @required this.QRCode,
//       this.createdAt,
//       this.updatedAt,
//       this.user,
//       this.userID});
//
//   factory GateAccessLog(
//       {String id,
//       @required int club_id,
//       @required String username,
//       @required int gate,
//       @required int QRCode,
//       DateTime createdAt,
//       DateTime updatedAt,
//       Users user,
//       String userID}) {
//     return GateAccessLog._internal(
//         id: id == null ? UUID.getUUID() : id,
//         club_id: club_id,
//         username: username,
//         gate: gate,
//         QRCode: QRCode,
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
//     return other is GateAccessLog &&
//         id == other.id &&
//         club_id == other.club_id &&
//         username == other.username &&
//         gate == other.gate &&
//         QRCode == other.QRCode &&
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
//     buffer.write("GateAccessLog {");
//     buffer.write("id=" + "$id" + ", ");
//     buffer.write(
//         "club_id=" + (club_id != null ? club_id.toString() : "null") + ", ");
//     buffer.write("username=" + "$username" + ", ");
//     buffer.write("gate=" + (gate != null ? gate.toString() : "null") + ", ");
//     buffer.write(
//         "QRCode=" + (QRCode != null ? QRCode.toString() : "null") + ", ");
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
//   GateAccessLog copyWith(
//       {String id,
//       int club_id,
//       String username,
//       int gate,
//       int QRCode,
//       TemporalTimestamp createdAt,
//       TemporalTimestamp updatedAt,
//       Users user,
//       String userID}) {
//     return GateAccessLog(
//         id: id ?? this.id,
//         club_id: club_id ?? this.club_id,
//         username: username ?? this.username,
//         gate: gate ?? this.gate,
//         QRCode: QRCode ?? this.QRCode,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         user: user ?? this.user,
//         userID: userID ?? this.userID);
//   }
//
//   GateAccessLog.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         club_id = json['club_id'],
//         username = json['username'],
//         gate = json['gate'],
//         QRCode = json['QRCode'],
//         createdAt = json['createdAt'] != null
//             ? DateTime.parse(json['createdAt'])
//             : null,
//         updatedAt = json['updatedAt'] != null
//             ? DateTime.parse(json['updatedAt'])
//             : null,
//         user = json['user'] != null
//             ? Users.fromJson(new Map<String, dynamic>.from(json['user']))
//             : null,
//         userID = json['userID'];
//
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'club_id': club_id,
//         'username': username,
//         'gate': gate,
//         'QRCode': QRCode,
//         'createdAt': createdAt?.millisecondsSinceEpoch,
//         'updatedAt': updatedAt?.millisecondsSinceEpoch,
//         'user': user?.toJson(),
//         'userID': userID
//       };
//
//   static final QueryField ID = QueryField(fieldName: "gateAccessLog.id");
//   static final QueryField CLUB_ID = QueryField(fieldName: "club_id");
//   static final QueryField USERNAME = QueryField(fieldName: "username");
//   static final QueryField GATE = QueryField(fieldName: "gate");
//   static final QueryField QRCODE = QueryField(fieldName: "QRCode");
//   static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
//   static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
//   static final QueryField USER = QueryField(
//       fieldName: "user",
//       fieldType: ModelFieldType(ModelFieldTypeEnum.model,
//           ofModelName: (Users).toString()));
//   static final QueryField USERID = QueryField(fieldName: "userID");
//   static var schema =
//       Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
//     modelSchemaDefinition.name = "GateAccessLog";
//     modelSchemaDefinition.pluralName = "GateAccessLogs";
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
//         key: GateAccessLog.CLUB_ID,
//         isRequired: true,
//         ofType: ModelFieldType(ModelFieldTypeEnum.int)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: GateAccessLog.USERNAME,
//         isRequired: true,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: GateAccessLog.GATE,
//         isRequired: true,
//         ofType: ModelFieldType(ModelFieldTypeEnum.int)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: GateAccessLog.QRCODE,
//         isRequired: true,
//         ofType: ModelFieldType(ModelFieldTypeEnum.int)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: GateAccessLog.CREATEDAT,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: GateAccessLog.UPDATEDAT,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
//         key: GateAccessLog.USER,
//         isRequired: false,
//         targetName: "gateAccessLogUserId",
//         ofModelName: (Users).toString()));
//
//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: GateAccessLog.USERID,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));
//   });
// }
//
// class _GateAccessLogModelType extends ModelType<GateAccessLog> {
//   const _GateAccessLogModelType();
//
//   @override
//   GateAccessLog fromJson(Map<String, dynamic> jsonData) {
//     return GateAccessLog.fromJson(jsonData);
//   }
// }
