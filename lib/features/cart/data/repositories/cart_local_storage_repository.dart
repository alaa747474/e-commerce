import 'package:e_commerce_app/features/cart/data/repositories/base_cart_local_storage_repository.dart';
import 'package:hive/hive.dart';
import 'package:e_commerce_app/features/products/data/models/product.dart';

class CartLocalStorageRepository extends BaseCartLocalStorageRepository {
  String boxName='cart_box';
   @override
  Future<Box> openBox() async{
   Box box= await Hive.openBox<Product>(boxName);
   return box;
  }

  @override
  Future<void> addProductToCart(Box box, Product product)async {
    await box.put(product.id.toString(),product);
  }
  @override
  Future<void> removeProductFromCart(Box box, Product product) async{
   await box.delete(product.id.toString());
  }
    @override
  List<Product> getCartProducts(Box box) {
    return box.values.toList() as List<Product>;
  }
  
}