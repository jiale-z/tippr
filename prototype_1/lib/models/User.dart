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

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _serverCode;
  final String? _name;
  final List<DiningPreference>? _DiningPreferences;
  final ServerBio? _ServerBio;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get serverCode {
    return _serverCode;
  }
  
  String? get name {
    return _name;
  }
  
  List<DiningPreference>? get DiningPreferences {
    return _DiningPreferences;
  }
  
  ServerBio? get ServerBio {
    return _ServerBio;
  }
  
  const User._internal({required this.id, serverCode, name, DiningPreferences, ServerBio}): _serverCode = serverCode, _name = name, _DiningPreferences = DiningPreferences, _ServerBio = ServerBio;
  
  factory User({String? id, String? serverCode, String? name, List<DiningPreference>? DiningPreferences, ServerBio? ServerBio}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      serverCode: serverCode,
      name: name,
      DiningPreferences: DiningPreferences != null ? List<DiningPreference>.unmodifiable(DiningPreferences) : DiningPreferences,
      ServerBio: ServerBio);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _serverCode == other._serverCode &&
      _name == other._name &&
      DeepCollectionEquality().equals(_DiningPreferences, other._DiningPreferences) &&
      _ServerBio == other._ServerBio;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("serverCode=" + "$_serverCode" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("ServerBio=" + (_ServerBio != null ? _ServerBio!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? serverCode, String? name, List<DiningPreference>? DiningPreferences, ServerBio? ServerBio}) {
    return User(
      id: id ?? this.id,
      serverCode: serverCode ?? this.serverCode,
      name: name ?? this.name,
      DiningPreferences: DiningPreferences ?? this.DiningPreferences,
      ServerBio: ServerBio ?? this.ServerBio);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _serverCode = json['serverCode'],
      _name = json['name'],
      _DiningPreferences = json['DiningPreferences'] is List
        ? (json['DiningPreferences'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => DiningPreference.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _ServerBio = json['ServerBio']?['serializedData'] != null
        ? ServerBio.fromJson(new Map<String, dynamic>.from(json['ServerBio']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'serverCode': _serverCode, 'name': _name, 'DiningPreferences': _DiningPreferences?.map((DiningPreference? e) => e?.toJson()).toList(), 'ServerBio': _ServerBio?.toJson()
  };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField SERVERCODE = QueryField(fieldName: "serverCode");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DININGPREFERENCES = QueryField(
    fieldName: "DiningPreferences",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (DiningPreference).toString()));
  static final QueryField SERVERBIO = QueryField(
    fieldName: "ServerBio",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (ServerBio).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.SERVERCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.DININGPREFERENCES,
      isRequired: false,
      ofModelName: (DiningPreference).toString(),
      associatedKey: DiningPreference.USERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: User.SERVERBIO,
      isRequired: false,
      targetName: "userServerBioId",
      ofModelName: (ServerBio).toString()
    ));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}