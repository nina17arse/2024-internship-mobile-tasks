import 'dart:ffi';

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

  void editProduct(int index, {String? name, String? description, double? price}) {
    if (index < 0 || index >= _products.length) {
      print('Invalid index');
    } else {
      var product = _products[index];
      product.name = name;
      product.description = description;
      product.price = price;
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

  var product1 = Product(name: 'Laptop', description: 'A high-end laptop', price: 1500.0);
  // var product2 = Product(name: 'Smartphone', description: 'A new smartphone', price: 800.0);

  productManager.addProduct(product1);
  

  productManager.viewAllProducts();


  productManager.viewProduct(0);


  productManager.editProduct(0, name: 'Gaming Laptop', price: 2000.0);

  
  productManager.deleteProduct(0);


  productManager.viewAllProducts();
}
