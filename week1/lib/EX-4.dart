void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  // Your code
  double total = 0.00;
  order.forEach((pizza) {
    if(pizzaPrices.containsKey(pizza)){
      total += pizzaPrices[pizza]!;
    }
    else{
      print("$pizza is not on the Menu");
    }
  });
  print("The Total price is \$$total");
}
