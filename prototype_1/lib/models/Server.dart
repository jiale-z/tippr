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
import 'ServerBio.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Server type in your schema. */
@immutable
class Server extends Model {
  static const classType = const _ServerModelType();
  final String id;
  final User? _user;
  final String? _restaurantID;
  final ServerBio? _bio;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  User get user {
    try {
      return _user!;
    } catch (e) {
      throw new DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get restaurantID {
    return _restaurantID;
  }

  ServerBio? get bio {
    return _bio;
  }

  const Server._internal({required this.id, required user, restaurantID, bio})
      : _user = user,
        _restaurantID = restaurantID,
        _bio = bio;

  factory Server(
      {String? id, required User user, String? restaurantID, ServerBio? bio}) {
    return Server._internal(
        id: id == null ? UUID.getUUID() : id,
        user: user,
        restaurantID: restaurantID,
        bio: bio);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Server &&
        id == other.id &&
        _user == other._user &&
        _restaurantID == other._restaurantID &&
        _bio == other._bio;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Server {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("restaurantID=" + "$_restaurantID" + ", ");
    buffer.write("bio=" + (_bio != null ? _bio!.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Server copyWith(
      {String? id, User? user, String? restaurantID, ServerBio? bio}) {
    return Server(
        id: id ?? this.id,
        user: user ?? this.user,
        restaurantID: restaurantID ?? this.restaurantID,
        bio: bio ?? this.bio);
  }

  Server.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _user = json['user']?['serializedData'] != null
            ? User.fromJson(
                new Map<String, dynamic>.from(json['user']['serializedData']))
            : null,
        _restaurantID = json['restaurantID'],
        _bio = json['bio'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': _user?.toJson(),
        'restaurantID': _restaurantID,
        'bio': _bio
      };

  static final QueryField ID = QueryField(fieldName: "server.id");
  static final QueryField USER = QueryField(
      fieldName: "user",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (User).toString()));
  static final QueryField RESTAURANTID = QueryField(fieldName: "restaurantID");
  static final QueryField BIO = QueryField(fieldName: "bio");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Server";
    modelSchemaDefinition.pluralName = "Servers";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: Server.USER,
        isRequired: true,
        targetName: "serverUserId",
        ofModelName: (User).toString()));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Server.RESTAURANTID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Server.BIO,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _ServerModelType extends ModelType<Server> {
  const _ServerModelType();

  @override
  Server fromJson(Map<String, dynamic> jsonData) {
    return Server.fromJson(jsonData);
  }
}
