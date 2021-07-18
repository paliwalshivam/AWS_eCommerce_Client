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

/** This is an auto generated class representing the CartModel type in your schema. */
@immutable
class CartModel extends Model {
  static const classType = const _CartModelModelType();
  final String id;
  final String idFromAdmin;
  final String productName;
  final String productCategory;
  final String price;
  final int quantity;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const CartModel._internal(
      {@required this.id,
      @required this.idFromAdmin,
      @required this.productName,
      @required this.productCategory,
      @required this.price,
      this.quantity});

  factory CartModel(
      {String id,
      @required String idFromAdmin,
      @required String productName,
      @required String productCategory,
      @required String price,
      int quantity}) {
    return CartModel._internal(
        id: id == null ? UUID.getUUID() : id,
        idFromAdmin: idFromAdmin,
        productName: productName,
        productCategory: productCategory,
        price: price,
        quantity: quantity);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartModel &&
        id == other.id &&
        idFromAdmin == other.idFromAdmin &&
        productName == other.productName &&
        productCategory == other.productCategory &&
        price == other.price &&
        quantity == other.quantity;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("CartModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("idFromAdmin=" + "$idFromAdmin" + ", ");
    buffer.write("productName=" + "$productName" + ", ");
    buffer.write("productCategory=" + "$productCategory" + ", ");
    buffer.write("price=" + "$price" + ", ");
    buffer
        .write("quantity=" + (quantity != null ? quantity.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  CartModel copyWith(
      {String id,
      String idFromAdmin,
      String productName,
      String productCategory,
      String price,
      int quantity}) {
    return CartModel(
        id: id ?? this.id,
        idFromAdmin: idFromAdmin ?? this.idFromAdmin,
        productName: productName ?? this.productName,
        productCategory: productCategory ?? this.productCategory,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity);
  }

  CartModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        idFromAdmin = json['idFromAdmin'],
        productName = json['productName'],
        productCategory = json['productCategory'],
        price = json['price'],
        quantity = json['quantity'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'idFromAdmin': idFromAdmin,
        'productName': productName,
        'productCategory': productCategory,
        'price': price,
        'quantity': quantity
      };

  static final QueryField ID = QueryField(fieldName: "cartModel.id");
  static final QueryField IDFROMADMIN = QueryField(fieldName: "idFromAdmin");
  static final QueryField PRODUCTNAME = QueryField(fieldName: "productName");
  static final QueryField PRODUCTCATEGORY =
      QueryField(fieldName: "productCategory");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField QUANTITY = QueryField(fieldName: "quantity");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CartModel";
    modelSchemaDefinition.pluralName = "CartModels";

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
        key: CartModel.IDFROMADMIN,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: CartModel.PRODUCTNAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: CartModel.PRODUCTCATEGORY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: CartModel.PRICE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: CartModel.QUANTITY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));
  });
}

class _CartModelModelType extends ModelType<CartModel> {
  const _CartModelModelType();

  @override
  CartModel fromJson(Map<String, dynamic> jsonData) {
    return CartModel.fromJson(jsonData);
  }
}
