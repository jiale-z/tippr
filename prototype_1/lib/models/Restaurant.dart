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


/** This is an auto generated class representing the Restaurant type in your schema. */
@immutable
class Restaurant extends Model {
  static const classType = const _RestaurantModelType();
  final String id;
  final String? _menu;
  final User? _user;
  final List<Server>? _servers;
  final String? _title;
  final String? _restaurantCode;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get menu {
    return _menu;
  }
  
  User get user {
    try {
      return _user!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  List<Server>? get servers {
    return _servers;
  }
  
  String? get title {
    return _title;
  }
  
  String? get restaurantCode {
    return _restaurantCode;
  }
  
  const Restaurant._internal({required this.id, menu, required user, servers, title, restaurantCode}): _menu = menu, _user = user, _servers = servers, _title = title, _restaurantCode = restaurantCode;
  
  factory Restaurant({String? id, String? menu, required User user, List<Server>? servers, String? title, String? restaurantCode}) {
    return Restaurant._internal(
      id: id == null ? UUID.getUUID() : id,
      menu: menu,
      user: user,
      servers: servers != null ? List<Server>.unmodifiable(servers) : servers,
      title: title,
      restaurantCode: restaurantCode);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Restaurant &&
      id == other.id &&
      _menu == other._menu &&
      _user == other._user &&
      DeepCollectionEquality().equals(_servers, other._servers) &&
      _title == other._title &&
      _restaurantCode == other._restaurantCode;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Restaurant {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("menu=" + "$_menu" + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("restaurantCode=" + "$_restaurantCode");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Restaurant copyWith({String? id, String? menu, User? user, List<Server>? servers, String? title, String? restaurantCode}) {
    return Restaurant(
      id: id ?? this.id,
      menu: menu ?? this.menu,
      user: user ?? this.user,
      servers: servers ?? this.servers,
      title: title ?? this.title,
      restaurantCode: restaurantCode ?? this.restaurantCode);
  }
  
  Restaurant.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _menu = json['menu'],
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _servers = json['servers'] is List
        ? (json['servers'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Server.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _title = json['title'],
      _restaurantCode = json['restaurantCode'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'menu': _menu, 'user': _user?.toJson(), 'servers': _servers?.map((Server? e) => e?.toJson()).toList(), 'title': _title, 'restaurantCode': _restaurantCode
  };

  static final QueryField ID = QueryField(fieldName: "restaurant.id");
  static final QueryField MENU = QueryField(fieldName: "menu");
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
  static final QueryField SERVERS = QueryField(
    fieldName: "servers",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Server).toString()));
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField RESTAURANTCODE = QueryField(fieldName: "restaurantCode");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Restaurant";
    modelSchemaDefinition.pluralName = "Restaurants";
    
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
      key: Restaurant.MENU,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Restaurant.USER,
      isRequired: true,
      targetName: "restaurantUserId",
      ofModelName: (User).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Restaurant.SERVERS,
      isRequired: false,
      ofModelName: (Server).toString(),
      associatedKey: Server.RESTAURANTID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Restaurant.TITLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Restaurant.RESTAURANTCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _RestaurantModelType extends ModelType<Restaurant> {
  const _RestaurantModelType();
  
  @override
  Restaurant fromJson(Map<String, dynamic> jsonData) {
    return Restaurant.fromJson(jsonData);
  }
}