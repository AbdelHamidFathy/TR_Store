import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tr_store/app/models/cart_item_model.dart';
import 'package:tr_store/common/constants.dart';
import 'package:tr_store/common/strings.dart';
import 'package:tr_store/common/widgets/toast.dart';

class CartController extends GetxController {
  Database? database;
  List<CartItemModel> cartList = [];
  @override
  void onInit() {
    createDatabase();
    super.onInit();
  }

  void createDatabase() {
    openDatabase(
      Constants.database,
      version: 1,
      onCreate: (database, version) {
        Get.log('database created');
        database.execute(Constants.createCartTable).then((value) {
          Get.log('table created');
        }).catchError((error) {
          Get.log('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getCartData(database);
        Get.log('database opened');
      },
    ).then((value) {
      database = value;
    });
  }

  void getCartData(Database database) {
    cartList = [];
    database.rawQuery(Constants.selectFromCart).then((value) {
      for (var map in value) {
        CartItemModel cartItem = CartItemModel(
          title: map['title'] as String,
          price: map['price'] as int,
          image: map['image'] as String,
          description: map['description'] as String,
          quantity: map['quantity'] as int,
          id: map['id'] as int,
        );
        cartList.add(cartItem);
      }
      update();
    }).catchError((error) {
      Get.log('Error fetching data from database: $error');
    });
  }

  addToCart({
    required String title,
    required int price,
    required String image,
    required String description,
    required int quantity,
  }) {
    database!.transaction((txn) {
      return txn
          .rawInsert(
        '${Constants.insertToCart}("$title", "$price", "$image", "$description", "$quantity")',
      )
          .then((value) {
        Get.log('$value inserted successfully');
        toast(
          msg: Strings.itemAddedToCartSuccessfully,
          state: ToastStates.success,
        );
        getCartData(database!);
      }).catchError((error) {
        Get.log('Error When Inserting New Record ${error.toString()}');
      });
    });
  }

  void updateCart({
    required int quantity,
    required int id,
  }) async {
    await database!
        .rawUpdate(Constants.updateCart, ['$quantity', id]).then((value) {
      getCartData(database!);
    });
  }

  void deleteFromCart({
    required int productId,
  }) {
    database!.rawDelete(Constants.deleteFromCart, [productId]).then((value) {
      getCartData(database!);
    });
  }
}
