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


/** This is an auto generated class representing the Customer type in your schema. */
@immutable
class Customer extends Model {
  static const classType = const _CustomerModelType();
  final String id;
  final int? _communicationPreference;
  final Allergens? _allergens;
  final String? _restaurantID;
  final User? _user;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  int? get communicationPreference {
    return _communicationPreference;
  }
  
  Allergens? get allergens {
    return _allergens;
  }
  
  String? get restaurantID {
    return _restaurantID;
  }
  
  User get user {
    try {
      return _user!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Customer._internal({required this.id, communicationPreference, allergens, restaurantID, required user}): _communicationPreference = communicationPreference, _allergens = allergens, _restaurantID = restaurantID, _user = user;
  
  factory Customer({String? id, int? communicationPreference, Allergens? allergens, String? restaurantID, required User user}) {
    return Customer._internal(
      id: id == null ? UUID.getUUID() : id,
      communicationPreference: communicationPreference,
      allergens: allergens,
      restaurantID: restaurantID,
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
      _communicationPreference == other._communicationPreference &&
      _allergens == other._allergens &&
      _restaurantID == other._restaurantID &&
      _user == other._user;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Customer {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("communicationPreference=" + (_communicationPreference != null ? _communicationPreference!.toString() : "null") + ", ");
    buffer.write("allergens=" + (_allergens != null ? _allergens!.toString() : "null") + ", ");
    buffer.write("restaurantID=" + "$_restaurantID" + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Customer copyWith({String? id, int? communicationPreference, Allergens? allergens, String? restaurantID, User? user}) {
    return Customer(
      id: id ?? this.id,
      communicationPreference: communicationPreference ?? this.communicationPreference,
      allergens: allergens ?? this.allergens,
      restaurantID: restaurantID ?? this.restaurantID,
      user: user ?? this.user);
  }
  
  Customer.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _communicationPreference = json['communicationPreference'],
      _allergens = json['allergens'],
      _restaurantID = json['restaurantID'],
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'communicationPreference': _communicationPreference, 'allergens': _allergens, 'restaurantID': _restaurantID, 'user': _user?.toJson()
  };

  static final QueryField ID = QueryField(fieldName: "customer.id");
  static final QueryField COMMUNICATIONPREFERENCE = QueryField(fieldName: "communicationPreference");
  static final QueryField ALLERGENS = QueryField(fieldName: "allergens");
  static final QueryField RESTAURANTID = QueryField(fieldName: "restaurantID");
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
      key: Customer.COMMUNICATIONPREFERENCE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Customer.ALLERGENS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Customer.RESTAURANTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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