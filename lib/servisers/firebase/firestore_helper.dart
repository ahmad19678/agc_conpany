import 'dart:developer';
import 'dart:io';
import 'package:agc_conpany/model/categpry_model.dart';
import 'package:agc_conpany/model/customer_model.dart';
import 'package:agc_conpany/model/order.dart';
import 'package:agc_conpany/model/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../model/product_model.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  // add to waitingUser
  waitingUser(UserApp user) async {
    await firebaseFirestore.collection('usersWaiting').doc(user.id).set(user.toMap());
  }
  Future<UserApp?> getUserFromWaiting(String userid) async {
    DocumentSnapshot<Map<String, dynamic>> document =
    await firebaseFirestore.collection('usersWaiting').doc(userid).get();
    Map<String, dynamic>? userData = document.data();
    userData?['id'] = document.id;
    if(userData !=null) {
      UserApp gdUser = UserApp.fromMap(userData);
      return gdUser;
    }
    return null;
  }
  acceptedUser(UserApp user) async {
    await firebaseFirestore.collection('users').doc(user.id).set(user.toMap());
  }
  Future<UserApp?> getUserFromAccepted(String userid) async {
    DocumentSnapshot<Map<String, dynamic>> document =
    await firebaseFirestore.collection('users').doc(userid).get();
    Map<String, dynamic>? userData = document.data();
    userData?['id'] = document.id;
    if(userData !=null) {
      UserApp gdUser = UserApp.fromMap(userData);
      return gdUser;
    }
    return null;
  }
  acceptedCustomer(CustomerModel customerModel) async {
    await firebaseFirestore.collection('Customer').doc(customerModel.id).set(customerModel.toMap());
  }
  Future<List<CustomerModel>> getAllCustomer() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('Customer').get();
    List<CustomerModel> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      log('firestore helper e.id: ${e.id}');
      log("firestore helper documentMap['id']: ${documentMap['id']}");
      CustomerModel customerModel = CustomerModel.fromMap(documentMap);
      return customerModel;
    }).toList();
    return allAsset;
  }
  deletefromCustomerAwaiting(String userID)async{
    await firebaseFirestore.collection('customersWaiting').doc(userID).delete();
  }
  deletefromUsersAwaiting(String userID)async{
    await firebaseFirestore.collection('usersWaiting').doc(userID).delete();
  }
  rejectedUser(UserApp user) async {
    await firebaseFirestore.collection('usersRejected').doc(user.id).set(user.toMap());
  }
  Future<UserApp?> getUserFromReject(String userid) async {
    DocumentSnapshot<Map<String, dynamic>> document =
    await firebaseFirestore.collection('usersRejected').doc(userid).get();
    Map<String, dynamic>? userData = document.data();
    userData?['id'] = document.id;
    if(userData !=null) {
      UserApp gdUser = UserApp.fromMap(userData);
      return gdUser;
    }else{
      print('null user ');
      return null;

    }
  }
  rejectedCustomer(CustomerModel customerModel) async {
    await firebaseFirestore.collection('CustomersRejected').doc(customerModel.id).set(customerModel.toMap());
  }

  //from watting salespeson to accept

  acceptedOrder(Order order) async {
    await firebaseFirestore.collection('AcceptedOrder').doc(order.id).set(order.toMap());
  }
  Future<List<Order>> getOrderSalesPerson() async{
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('SalesPersonOrderWaiting').get();
    List<Order> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      Order productModel = Order.fromMap(documentMap);
      return productModel;
    }).toList();
    return allAsset;
  }
  // delete from watting
  deletefromOrderSalesPerson(String orderID)async{
    await firebaseFirestore.collection('SalesPersonOrderWaiting').doc(orderID).delete();
  }

  // from accept  sales person to accountent
  acceptedOrdertoAccountent(Order order) async {
    await firebaseFirestore.collection('AccountentOrder').doc(order.id).set(order.toMap());
  }
  Future<List<Order>> getOrderSalesPersontoAccountent() async{
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('AcceptedOrder').get();
    List<Order> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      Order productModel = Order.fromMap(documentMap);
      return productModel;
    }).toList();
    return allAsset;
  }
  deletefromOrderSalesPersontoAccountent(String orderID)async{
    await firebaseFirestore.collection('AcceptedOrder').doc(orderID).delete();
  }


//accountent
  orderAccountentToStoreKeeper(Order order) async {
    await firebaseFirestore.collection('StoreKeeperOrder').doc(order.id).set(order.toMap());
  }
  orderStoreKeeperAccept(Order order) async {
    await firebaseFirestore.collection('StoreKeeperOrderAccept').doc(order.id).set(order.toMap());
  }
  Future<List<Order>> getOrderAccountant() async{
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('AccountentOrder').get();
    List<Order> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      Order productModel = Order.fromMap(documentMap);
      return productModel;
    }).toList();
    return allAsset;
  }
  Future<List<Order>> getOrderStoreKeeperOrderAccept() async{
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('StoreKeeperOrderAccept').get();
    List<Order> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      Order productModel = Order.fromMap(documentMap);
      return productModel;
    }).toList();
    return allAsset;
  }
  deletefromOrderAccountant(String orderID)async{
    await firebaseFirestore.collection('AccountentOrder').doc(orderID).delete();
  }
  deletefromStoreKeeperOrderAccept(String orderID)async{
    await firebaseFirestore.collection('StoreKeeperOrderAccept').doc(orderID).delete();
  }
  orderStoreKeeperToDriver(Order order) async {
    await firebaseFirestore.collection('DriverOrder').doc(order.id).set(order.toMap());
  }
  Future<List<Order>> getOrderStoreKeeper() async{
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('StoreKeeperOrder').get();
    List<Order> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      Order productModel = Order.fromMap(documentMap);
      return productModel;
    }).toList();
    return allAsset;
  }
  deletefromOrderStoreKeeper(String orderID)async{
    await firebaseFirestore.collection('StoreKeeperOrder').doc(orderID).delete();
  }

//Driver order

  Future<List<Order>> getOrderDriver() async{
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('DriverOrder').get();
    List<Order> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      Order productModel = Order.fromMap(documentMap);
      return productModel;
    }).toList();
    return allAsset;
  }
  deletefromOrderDriver(String orderID)async{
    await firebaseFirestore.collection('DriverOrder').doc(orderID).delete();
  }
  orderDriverPinding(Order order) async {
    await firebaseFirestore.collection('DriverOrderPinding').doc(order.id).set(order.toMap());
  }
  Future<List<Order>> getOrderDriverPinding() async{
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('DriverOrderPinding').get();
    List<Order> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      Order productModel = Order.fromMap(documentMap);
      return productModel;
    }).toList();
    return allAsset;
  }
  deletefromOrderDriverPinding(String orderID)async{
    await firebaseFirestore.collection('DriverOrderPinding').doc(orderID).delete();
  }
// Complete order
  CompletedOrder(Order order) async {
    await firebaseFirestore.collection('CompleteOrder').doc(order.id).set(order.toMap());
  }
  Future<List<Order>> getCompletedOrder() async{
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('CompleteOrder').get();
    List<Order> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      Order productModel = Order.fromMap(documentMap);
      return productModel;
    }).toList();
    return allAsset;
  }

  Future<List<UserApp>>getAllUsersWaiting() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('usersWaiting').get();
    List<UserApp> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      log('firestore helper e.id: ${e.id}');
      log("firestore helper documentMap['id']: ${documentMap['id']}");
      UserApp userApp = UserApp.fromMap(documentMap);
      return userApp;
    }).toList();
    return allAsset;
  }
  Future<List<UserApp>>getAllUsers() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('users').get();
    List<UserApp> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      log('firestore helper e.id: ${e.id}');
      log("firestore helper documentMap['id']: ${documentMap['id']}");
      UserApp userApp = UserApp.fromMap(documentMap);
      return userApp;
    }).toList();
    return allAsset;
  }
  Future<List<CategoryModel>>getAllCategory() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('Category').get();
    List<CategoryModel> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      CategoryModel categoryModel = CategoryModel.formMap(documentMap);
      return categoryModel;
    }).toList();
    return allAsset;
  }
  Future<List<ProductModel>>getAllProduct() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('Product').get();
    List<ProductModel> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      log('firestore helper e.id: ${e.id}');
      log("firestore helper documentMap['id']: ${documentMap['id']}");
      ProductModel productModel = ProductModel.fromMap(documentMap);
      return productModel;
    }).toList();
    return allAsset;
  }
  Future<List<CustomerModel>>getAllCustomerWaiting() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('customersWaiting').get();
    List<CustomerModel> allUser = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      CustomerModel userApp = CustomerModel.fromMap(documentMap);
      return userApp;
    }).toList();
    return allUser;
  }
  Future disableUser(String userId)async{
  await firebaseFirestore.collection('users').doc(userId).update({'disable': true});
}
  addCategory(String name)async{
    String id = firebaseFirestore.collection('Category').doc().id;
    CategoryModel categoryModel  = CategoryModel(categoryName: name,id:id);
    await firebaseFirestore.collection('Category').doc(id).set(categoryModel.toMap());
  }
  addProduct(ProductModel productModel) async{
    String id = firebaseFirestore.collection('Product').doc().id;
    productModel.id=id;
    await firebaseFirestore.collection('Product').doc(id).set(productModel.toMap());
  }
  Future<String>uploadImage(File file) async {
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    Reference reference = firebaseStorage.ref('products/$fileName');
    await reference.putFile(file);
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }
  updateCatogryname(String name,String catId)async{
    await firebaseFirestore.collection('Category').doc(catId).update({'categoryName': name});
  }
  updateProduct({required String name,required String disc,required String imagePath,required String productId})async{
    await firebaseFirestore.collection('Product').doc(productId).update({'productName': name,'description': disc,'imagePath': imagePath});
  }
  updateProductQuntity({required String quantity,required String productId})async{
   int quantity2=int.parse(quantity);
    await firebaseFirestore.collection('Product').doc(productId).update({'quantity': quantity2});
  }

}

