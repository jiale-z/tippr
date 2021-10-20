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


/** This is an auto generated class representing the DiningPreference type in your schema. */
@immutable
class DiningPreference extends Model {
  static const classType = const _DiningPreferenceModelType();
  final String id;
  final String? _userID;
  final String? _value;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get userID {
    return _userID;
  }
  
  String? get value {
    return _value;
  }
  
  const DiningPreference._internal({required this.id, userID, value}): _userID = userID, _value = value;
  
  factory DiningPreference({String? id, String? userID, String? value}) {
    return DiningPreference._internal(
      id: id == null ? UUID.getUUID() : id,
      userID: userID,
      value: value);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiningPreference &&
      id == other.id &&
      _userID == other._userID &&
      _value == other._value;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DiningPreference {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("value=" + "$_value");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DiningPreference copyWith({String? id, String? userID, String? value}) {
    return DiningPreference(
      id: id ?? this.id,
      userID: userID ?? this.userID,
      value: value ?? this.value);
  }
  
  DiningPreference.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userID = json['userID'],
      _value = json['value'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userID': _userID, 'value': _value
  };

  static final QueryField ID = QueryField(fieldName: "diningPreference.id");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField VALUE = QueryField(fieldName: "value");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DiningPreference";
    modelSchemaDefinition.pluralName = "DiningPreferences";
    
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
      key: DiningPreference.USERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DiningPreference.VALUE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _DiningPreferenceModelType extends ModelType<DiningPreference> {
  const _DiningPreferenceModelType();
  
  @override
  DiningPreference fromJson(Map<String, dynamic> jsonData) {
    return DiningPreference.fromJson(jsonData);
  }
}