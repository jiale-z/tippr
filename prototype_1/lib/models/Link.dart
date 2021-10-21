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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Link type in your schema. */
@immutable
class Link extends Model {
  static const classType = const _LinkModelType();
  final String id;
  final String? _serverID;
  final User? _Customer;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get serverID {
    try {
      return _serverID!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  User get Customer {
    try {
      return _Customer!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Link._internal({required this.id, required serverID, required Customer}): _serverID = serverID, _Customer = Customer;
  
  factory Link({String? id, required String serverID, required User Customer}) {
    return Link._internal(
      id: id == null ? UUID.getUUID() : id,
      serverID: serverID,
      Customer: Customer);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Link &&
      id == other.id &&
      _serverID == other._serverID &&
      _Customer == other._Customer;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Link {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("serverID=" + "$_serverID" + ", ");
    buffer.write("Customer=" + (_Customer != null ? _Customer!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Link copyWith({String? id, String? serverID, User? Customer}) {
    return Link(
      id: id ?? this.id,
      serverID: serverID ?? this.serverID,
      Customer: Customer ?? this.Customer);
  }
  
  Link.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _serverID = json['serverID'],
      _Customer = json['Customer']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['Customer']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'serverID': _serverID, 'Customer': _Customer?.toJson()
  };

  static final QueryField ID = QueryField(fieldName: "link.id");
  static final QueryField SERVERID = QueryField(fieldName: "serverID");
  static final QueryField CUSTOMER = QueryField(
    fieldName: "Customer",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Link";
    modelSchemaDefinition.pluralName = "Links";
    
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
      key: Link.SERVERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Link.CUSTOMER,
      isRequired: true,
      targetName: "linkCustomerId",
      ofModelName: (User).toString()
    ));
  });
}

class _LinkModelType extends ModelType<Link> {
  const _LinkModelType();
  
  @override
  Link fromJson(Map<String, dynamic> jsonData) {
    return Link.fromJson(jsonData);
  }
}