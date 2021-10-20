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


/** This is an auto generated class representing the ServerBio type in your schema. */
@immutable
class ServerBio extends Model {
  static const classType = const _ServerBioModelType();
  final String id;
  final String? _bio;
  final String? _profile_picture;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get bio {
    return _bio;
  }
  
  String? get profile_picture {
    return _profile_picture;
  }
  
  const ServerBio._internal({required this.id, bio, profile_picture}): _bio = bio, _profile_picture = profile_picture;
  
  factory ServerBio({String? id, String? bio, String? profile_picture}) {
    return ServerBio._internal(
      id: id == null ? UUID.getUUID() : id,
      bio: bio,
      profile_picture: profile_picture);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServerBio &&
      id == other.id &&
      _bio == other._bio &&
      _profile_picture == other._profile_picture;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ServerBio {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("bio=" + "$_bio" + ", ");
    buffer.write("profile_picture=" + "$_profile_picture");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ServerBio copyWith({String? id, String? bio, String? profile_picture}) {
    return ServerBio(
      id: id ?? this.id,
      bio: bio ?? this.bio,
      profile_picture: profile_picture ?? this.profile_picture);
  }
  
  ServerBio.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _bio = json['bio'],
      _profile_picture = json['profile_picture'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'bio': _bio, 'profile_picture': _profile_picture
  };

  static final QueryField ID = QueryField(fieldName: "serverBio.id");
  static final QueryField BIO = QueryField(fieldName: "bio");
  static final QueryField PROFILE_PICTURE = QueryField(fieldName: "profile_picture");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ServerBio";
    modelSchemaDefinition.pluralName = "ServerBios";
    
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
      key: ServerBio.BIO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServerBio.PROFILE_PICTURE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ServerBioModelType extends ModelType<ServerBio> {
  const _ServerBioModelType();
  
  @override
  ServerBio fromJson(Map<String, dynamic> jsonData) {
    return ServerBio.fromJson(jsonData);
  }
}