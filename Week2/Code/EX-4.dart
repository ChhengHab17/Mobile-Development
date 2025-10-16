enum DeliveryMethod {pickup,delivery}

class Product {
    final String name;
    final double price;

    Product({required this.name, required this.price});
}

class Address{
    final String street;
    final String city;
    final String zipCode;

    Address({required this.street, required this.city, required this.zipCode});
}
class Order{
    final List<Product> products;
    final Address? address;
    final DeliveryMethod deliveryMethod;
    final DateTime orderDate = DateTime.now();

    Order({required this.products, this.address, required this.deliveryMethod});

    double calculateTotalPrice(){
        double total = 0;
        for(var product in products){
            total += product.price;
        }
        return total;
    }
}
void main() {
  Product p1 = Product(name: 'Laptop', price: 1000);
  Product p2 = Product(name: 'Mouse', price: 50);

  Address homeAddress = Address(street: 'national road 6', city: 'Phnom Penh', zipCode: '120101');

  Order order1 = Order(
    products: [p1, p2],
    deliveryMethod: DeliveryMethod.delivery,
    address: homeAddress,
  );

  Order order2 = Order(
    products: [p2],
    deliveryMethod: DeliveryMethod.pickup,
  );

  print('Order1 total: \$${order1.calculateTotalPrice()}');
  print('Order2 total: \$${order2.calculateTotalPrice()}');
}