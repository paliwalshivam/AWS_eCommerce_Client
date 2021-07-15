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

/** This is an auto generated class representing the LikedProducts type in your schema. */
@immutable
class LikedProducts extends Model {
  static const classType = const _LikedProductsModelType();
  final String id;
  final String idFromAdmin;
  final String company;
  final String productName;
  final String productCategory;
  final String description;
  final String price;
  final String size;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const LikedProducts._internal(
      {@required this.id,
      this.idFromAdmin,
      this.company,
      this.productName,
      this.productCategory,
      this.description,
      this.price,
      this.size});

  factory LikedProducts(
      {String id,
      String idFromAdmin,
      String company,
      String productName,
      String productCategory,
      String description,
      String price,
      String size}) {
    return LikedProducts._internal(
        id: id == null ? UUID.getUUID() : id,
        idFromAdmin: idFromAdmin,
        company: company,
        productName: productName,
        productCategory: productCategory,
        description: description,
        price: price,
        size: size);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LikedProducts &&
        id == other.id &&
        idFromAdmin == other.idFromAdmin &&
        company == other.company &&
        productName == other.productName &&
        productCategory == other.productCategory &&
        description == other.description &&
        price == other.price &&
        size == other.size;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("LikedProducts {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("idFromAdmin=" + "$idFromAdmin" + ", ");
    buffer.write("company=" + "$company" + ", ");
    buffer.write("productName=" + "$productName" + ", ");
    buffer.write("productCategory=" + "$productCategory" + ", ");
    buffer.write("description=" + "$description" + ", ");
    buffer.write("price=" + "$price" + ", ");
    buffer.write("size=" + "$size");
    buffer.write("}");

    return buffer.toString();
  }

  LikedProducts copyWith(
      {String id,
      String idFromAdmin,
      String company,
      String productName,
      String productCategory,
      String description,
      String price,
      String size}) {
    return LikedProducts(
        id: id ?? this.id,
        idFromAdmin: idFromAdmin ?? this.idFromAdmin,
        company: company ?? this.company,
        productName: productName ?? this.productName,
        productCategory: productCategory ?? this.productCategory,
        description: description ?? this.description,
        price: price ?? this.price,
        size: size ?? this.size);
  }

  LikedProducts.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        idFromAdmin = json['idFromAdmin'],
        company = json['company'],
        productName = json['productName'],
        productCategory = json['productCategory'],
        description = json['description'],
        price = json['price'],
        size = json['size'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'idFromAdmin': idFromAdmin,
        'company': company,
        'productName': productName,
        'productCategory': productCategory,
        'description': description,
        'price': price,
        'size': size
      };

  static final QueryField ID = QueryField(fieldName: "likedProducts.id");
  static final QueryField IDFROMADMIN = QueryField(fieldName: "idFromAdmin");
  static final QueryField COMPANY = QueryField(fieldName: "company");
  static final QueryField PRODUCTNAME = QueryField(fieldName: "productName");
  static final QueryField PRODUCTCATEGORY =
      QueryField(fieldName: "productCategory");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField SIZE = QueryField(fieldName: "size");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LikedProducts";
    modelSchemaDefinition.pluralName = "LikedProducts";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LikedProducts.IDFROMADMIN,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LikedProducts.COMPANY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LikedProducts.PRODUCTNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LikedProducts.PRODUCTCATEGORY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LikedProducts.DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LikedProducts.PRICE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LikedProducts.SIZE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _LikedProductsModelType extends ModelType<LikedProducts> {
  const _LikedProductsModelType();

  @override
  LikedProducts fromJson(Map<String, dynamic> jsonData) {
    return LikedProducts.fromJson(jsonData);
  }
}
