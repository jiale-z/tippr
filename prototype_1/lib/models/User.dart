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
  final List<Link>? _CustomerLinks;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get serverCode {
    return _serverCode;
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  List<DiningPreference>? get DiningPreferences {
    return _DiningPreferences;
  }
  
  List<Link>? get CustomerLinks {
    return _CustomerLinks;
  }
  
  const User._internal({required this.id, serverCode, required name, DiningPreferences, CustomerLinks}): _serverCode = serverCode, _name = name, _DiningPreferences = DiningPreferences, _CustomerLinks = CustomerLinks;
  
  factory User({String? id, String? serverCode, required String name, List<DiningPreference>? DiningPreferences, List<Link>? CustomerLinks}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      serverCode: serverCode,
      name: name,
      DiningPreferences: DiningPreferences != null ? List<DiningPreference>.unmodifiable(DiningPreferences) : DiningPreferences,
      CustomerLinks: CustomerLinks != null ? List<Link>.unmodifiable(CustomerLinks) : CustomerLinks);
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
      DeepCollectionEquality().equals(_CustomerLinks, other._CustomerLinks);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("serverCode=" + "$_serverCode" + ", ");
    buffer.write("name=" + "$_name");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? serverCode, String? name, List<DiningPreference>? DiningPreferences, List<Link>? CustomerLinks}) {
    return User(
      id: id ?? this.id,
      serverCode: serverCode ?? this.serverCode,
      name: name ?? this.name,
      DiningPreferences: DiningPreferences ?? this.DiningPreferences,
      CustomerLinks: CustomerLinks ?? this.CustomerLinks);
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
      _CustomerLinks = json['CustomerLinks'] is List
        ? (json['CustomerLinks'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Link.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'serverCode': _serverCode, 'name': _name, 'DiningPreferences': _DiningPreferences?.map((e) => e?.toJson())?.toList(), 'CustomerLinks': _CustomerLinks?.map((e) => e?.toJson())?.toList()
  };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField SERVERCODE = QueryField(fieldName: "serverCode");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DININGPREFERENCES = QueryField(
    fieldName: "DiningPreferences",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (DiningPreference).toString()));
  static final QueryField CUSTOMERLINKS = QueryField(
    fieldName: "CustomerLinks",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Link).toString()));
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
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.DININGPREFERENCES,
      isRequired: false,
      ofModelName: (DiningPreference).toString(),
      associatedKey: DiningPreference.USERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.CUSTOMERLINKS,
      isRequired: false,
      ofModelName: (Link).toString(),
      associatedKey: Link.SERVERID
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