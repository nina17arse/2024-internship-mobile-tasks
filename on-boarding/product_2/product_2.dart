import 'dart:ffi';
import 'dart:io';

// Class decleration
class Product{
  String? name;
  String? description;
  double? price;

  // Constructors
  Product({
    required this.name,
    required this.description,
    required this.price,
  });


  // I have absolutly No idea what this is? It is called setter or getter i don't know
  @override
  String toString() {
    return 'Product(name: $name, description: $description, price: $price)';
  }

}


class ProductManager {
  //Initialization
  // Underscore cause it is private i think it is connected to encapsulation ?
  final List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
    print('Product added');
  }

  void editProduct(int index) {
    if (index < 0 || index >= _products.length) {
      print('Invalid index');
    } else {
      var product = _products[index];
      print('Enter the new name:');
      String? newName = stdin.readLineSync();
      product.name = newName;
      print('Enter the new description:');
      String? newDescription = stdin.readLineSync();
      product.description = newDescription;
      print('Enter the new price:');
      double? newPrice = double.parse(stdin.readLineSync()!);
      product.price = newPrice;
      print('Product updated');

    }
  }

  void viewAllProducts() {
    if (_products.length==0) {
      print('No products available');
    } else {
      for (var items in _products) {
        print(items);
      }
    }
  }

  void viewProduct(int index) {
    if (index < 0 || index >= _products.length) {
      print('Invalid index.');
    } else {
      print(_products[index]);
    }
  }

  

  void deleteProduct(int index) {
    if (index < 0 || index >= _products.length) {
      print('Invalid product index.');
    } else {
      _products.removeAt(index);
      print('Product deleted');
    }
  }
}


void main(){
  // var name = "Jhon";
  // print(name);
  //Data Types
  /* Nums,Strs,Booleans,Lists,Maps,Dynamic(Determined at runtime)
  Strings = */
  var productManager = ProductManager();

  while(true){
    print('Welcome to e-commerce product manager');
    print("-------Developed by @naty.w--------");
    print("Choose a Function");
    print('0. Add Product');
    print('1. Edit Product');
    print('2. View All Products');
    print('3. View One Product');
    print('4. Delete a Product');
    print('9. Exit ');

    int userChoice = int.parse(stdin.readLineSync()!);

    switch(userChoice){
      case 0:
        print('Enter the name:');
        String? nxt = stdin.readLineSync();
        print('Enter the description:');
        String? nxdesc = stdin.readLineSync();
        print('Enter the price:');
        double? nxtprc = double.parse(stdin.readLineSync()!);

        var prtd = Product(name: nxt, description: nxdesc, price: nxtprc);
        productManager.addProduct(prtd);
        break;
      case 1:
        print("Input ID Of Product:" );
        int indx = int.parse(stdin.readLineSync()!);
        productManager.editProduct(indx);
      case 2:
        print("Here Is All The Products: ");
        productManager.viewAllProducts();
        break;
      case 3:
        print("Enter ID of Product: ");
        int indx = int.parse(stdin.readLineSync()!);
        print("Here is the Requested Product:" );
        productManager.viewProduct(indx);
        break;
      case 4:
        print("Enter ID of Product: ");
        int indx = int.parse(stdin.readLineSync()!);
        productManager.deleteProduct(indx);
      case 5:
        return;
      case 9:
        exit(0);
      default:
        print("Invalid Choice");

        
    }



  }
}
