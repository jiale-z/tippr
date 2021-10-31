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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ServerBio type in your schema. */
@immutable
class ServerBio extends Model {
  static const classType = const _ServerBioModelType();
  final String id;
  final String? _bio;
  final String? _profile_picture;
  final User? _Server;

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
  
  User get Server {
    try {
      return _Server!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const ServerBio._internal({required this.id, bio, profile_picture, required Server}): _bio = bio, _profile_picture = profile_picture, _Server = Server;
  
  factory ServerBio({String? id, String? bio, String? profile_picture, required User Server}) {
    return ServerBio._internal(
      id: id == null ? UUID.getUUID() : id,
      bio: bio,
      profile_picture: profile_picture,
      Server: Server);
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
      _profile_picture == other._profile_picture &&
      _Server == other._Server;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ServerBio {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("bio=" + "$_bio" + ", ");
    buffer.write("profile_picture=" + "$_profile_picture" + ", ");
    buffer.write("Server=" + (_Server != null ? _Server!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ServerBio copyWith({String? id, String? bio, String? profile_picture, User? Server}) {
    return ServerBio(
      id: id ?? this.id,
      bio: bio ?? this.bio,
      profile_picture: profile_picture ?? this.profile_picture,
      Server: Server ?? this.Server);
  }
  
  ServerBio.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _bio = json['bio'],
      _profile_picture = json['profile_picture'],
      _Server = json['Server']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['Server']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'bio': _bio, 'profile_picture': _profile_picture, 'Server': _Server?.toJson()
  };

  static final QueryField ID = QueryField(fieldName: "serverBio.id");
  static final QueryField BIO = QueryField(fieldName: "bio");
  static final QueryField PROFILE_PICTURE = QueryField(fieldName: "profile_picture");
  static final QueryField SERVER = QueryField(
    fieldName: "Server",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: ServerBio.SERVER,
      isRequired: true,
      targetName: "serverBioServerId",
      ofModelName: (User).toString()
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