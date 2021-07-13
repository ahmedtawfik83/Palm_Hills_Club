/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Gate type in your schema. */
@immutable
class Gate extends Model {
  static const classType = const _GateModelType();
  final String id;
  final String name;
  final bool isIn;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Gate._internal(
      {@required this.id,
      @required this.name,
      @required this.isIn,
      this.createdAt,
      this.updatedAt});

  factory Gate(
      {String id,
      @required String name,
      @required bool isIn,
      DateTime createdAt,
      DateTime updatedAt}) {
    return Gate._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        isIn: isIn,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Gate &&
        id == other.id &&
        name == other.name &&
        isIn == other.isIn &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Gate {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("isIn=" + (isIn != null ? isIn.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (createdAt != null ? createdAt.toString() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (updatedAt != null ? updatedAt.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Gate copyWith(
      {String id,
      String name,
      bool isIn,
      TemporalTimestamp createdAt,
      TemporalTimestamp updatedAt}) {
    return Gate(
        id: id ?? this.id,
        name: name ?? this.name,
        isIn: isIn ?? this.isIn,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  Gate.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        isIn = json['isIn'],
        createdAt = json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt = json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'isIn': isIn,
        'createdAt': createdAt?.millisecondsSinceEpoch,
        'updatedAt': updatedAt?.millisecondsSinceEpoch
      };

  static final QueryField ID = QueryField(fieldName: "gate.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField ISIN = QueryField(fieldName: "isIn");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Gate";
    modelSchemaDefinition.pluralName = "Gates";

    modelSchemaDefinition.authRules = [
      AuthRule(
          authStrategy: AuthStrategy.OWNER,
          ownerField: "owner",
          identityClaim: "cognito:username",
          operations: [
            ModelOperation.CREATE,
            ModelOperation.UPDATE,
            ModelOperation.DELETE,
            ModelOperation.READ
          ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Gate.NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Gate.ISIN,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Gate.CREATEDAT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Gate.UPDATEDAT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)));
  });
}

class _GateModelType extends ModelType<Gate> {
  const _GateModelType();

  @override
  Gate fromJson(Map<String, dynamic> jsonData) {
    return Gate.fromJson(jsonData);
  }
}
