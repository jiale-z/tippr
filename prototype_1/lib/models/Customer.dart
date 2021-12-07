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

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Customer type in your schema. */
@immutable
class Customer extends Model {
  static const classType = const _CustomerModelType();
  final String id;
  final List<bool>? _allergens;
  final int? _communicationPreference;
  final User? _user;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  List<bool>? get allergens {
    return _allergens;
  }
  
  int? get communicationPreference {
    return _communicationPreference;
  }
  
  User get user {
    try {
      return _user!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Customer._internal({required this.id, allergens, communicationPreference, required user}): _allergens = allergens, _communicationPreference = communicationPreference, _user = user;
  
  factory Customer({String? id, List<bool>? allergens, int? communicationPreference, required User user}) {
    return Customer._internal(
      id: id == null ? UUID.getUUID() : id,
      allergens: allergens != null ? List<bool>.unmodifiable(allergens) : allergens,
      communicationPreference: communicationPreference,
      user: user);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Customer &&
      id == other.id &&
      DeepCollectionEquality().equals(_allergens, other._allergens) &&
      _communicationPreference == other._communicationPreference &&
      _user == other._user;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Customer {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("allergens=" + (_allergens != null ? _allergens!.toString() : "null") + ", ");
    buffer.write("communicationPreference=" + (_communicationPreference != null ? _communicationPreference!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Customer copyWith({String? id, List<bool>? allergens, int? communicationPreference, User? user}) {
    return Customer(
      id: id ?? this.id,
      allergens: allergens ?? this.allergens,
      communicationPreference: communicationPreference ?? this.communicationPreference,
      user: user ?? this.user);
  }
  
  Customer.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _allergens = json['allergens']?.cast<bool>(),
      _communicationPreference = (json['communicationPreference'] as num?)?.toInt(),
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'allergens': _allergens, 'communicationPreference': _communicationPreference, 'user': _user?.toJson()
  };

  static final QueryField ID = QueryField(fieldName: "customer.id");
  static final QueryField ALLERGENS = QueryField(fieldName: "allergens");
  static final QueryField COMMUNICATIONPREFERENCE = QueryField(fieldName: "communicationPreference");
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Customer";
    modelSchemaDefinition.pluralName = "Customers";
    
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
      key: Customer.ALLERGENS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.bool))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Customer.COMMUNICATIONPREFERENCE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Customer.USER,
      isRequired: true,
      targetName: "customerUserId",
      ofModelName: (User).toString()
    ));
  });
}

class _CustomerModelType extends ModelType<Customer> {
  const _CustomerModelType();
  
  @override
  Customer fromJson(Map<String, dynamic> jsonData) {
    return Customer.fromJson(jsonData);
  }
}