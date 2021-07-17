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

/** This is an auto generated class representing the OrderList type in your schema. */
@immutable
class OrderList extends Model {
  static const classType = const _OrderListModelType();
  final String id;
  final String productName;
  final int quantity;
  final String customerName;
  final String mobileNumber;
  final String address;
  final String orderTotal;
  final String idFromAdmin;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const OrderList._internal(
      {@required this.id,
      this.productName,
      this.quantity,
      this.customerName,
      this.mobileNumber,
      this.address,
      this.orderTotal,
      this.idFromAdmin});

  factory OrderList(
      {String id,
      String productName,
      int quantity,
      String customerName,
      String mobileNumber,
      String address,
      String orderTotal,
      String idFromAdmin}) {
    return OrderList._internal(
        id: id == null ? UUID.getUUID() : id,
        productName: productName,
        quantity: quantity,
        customerName: customerName,
        mobileNumber: mobileNumber,
        address: address,
        orderTotal: orderTotal,
        idFromAdmin: idFromAdmin);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderList &&
        id == other.id &&
        productName == other.productName &&
        quantity == other.quantity &&
        customerName == other.customerName &&
        mobileNumber == other.mobileNumber &&
        address == other.address &&
        orderTotal == other.orderTotal &&
        idFromAdmin == other.idFromAdmin;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("OrderList {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("productName=" + "$productName" + ", ");
    buffer.write(
        "quantity=" + (quantity != null ? quantity.toString() : "null") + ", ");
    buffer.write("customerName=" + "$customerName" + ", ");
    buffer.write("mobileNumber=" + "$mobileNumber" + ", ");
    buffer.write("address=" + "$address" + ", ");
    buffer.write("orderTotal=" + "$orderTotal" + ", ");
    buffer.write("idFromAdmin=" + "$idFromAdmin");
    buffer.write("}");

    return buffer.toString();
  }

  OrderList copyWith(
      {String id,
      String productName,
      int quantity,
      String customerName,
      String mobileNumber,
      String address,
      String orderTotal,
      String idFromAdmin}) {
    return OrderList(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        quantity: quantity ?? this.quantity,
        customerName: customerName ?? this.customerName,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        address: address ?? this.address,
        orderTotal: orderTotal ?? this.orderTotal,
        idFromAdmin: idFromAdmin ?? this.idFromAdmin);
  }

  OrderList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        productName = json['productName'],
        quantity = json['quantity'],
        customerName = json['customerName'],
        mobileNumber = json['mobileNumber'],
        address = json['address'],
        orderTotal = json['orderTotal'],
        idFromAdmin = json['idFromAdmin'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'productName': productName,
        'quantity': quantity,
        'customerName': customerName,
        'mobileNumber': mobileNumber,
        'address': address,
        'orderTotal': orderTotal,
        'idFromAdmin': idFromAdmin
      };

  static final QueryField ID = QueryField(fieldName: "orderList.id");
  static final QueryField PRODUCTNAME = QueryField(fieldName: "productName");
  static final QueryField QUANTITY = QueryField(fieldName: "quantity");
  static final QueryField CUSTOMERNAME = QueryField(fieldName: "customerName");
  static final QueryField MOBILENUMBER = QueryField(fieldName: "mobileNumber");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField ORDERTOTAL = QueryField(fieldName: "orderTotal");
  static final QueryField IDFROMADMIN = QueryField(fieldName: "idFromAdmin");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "OrderList";
    modelSchemaDefinition.pluralName = "OrderLists";

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
        key: OrderList.PRODUCTNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: OrderList.QUANTITY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: OrderList.CUSTOMERNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: OrderList.MOBILENUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: OrderList.ADDRESS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: OrderList.ORDERTOTAL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: OrderList.IDFROMADMIN,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _OrderListModelType extends ModelType<OrderList> {
  const _OrderListModelType();

  @override
  OrderList fromJson(Map<String, dynamic> jsonData) {
    return OrderList.fromJson(jsonData);
  }
}
