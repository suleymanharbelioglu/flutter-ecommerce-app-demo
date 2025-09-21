import 'package:cloud_firestore/cloud_firestore.dart';



 Future<void> addSampleProductsToFirestore() async {
  final List<Map<String, dynamic>> sampleProducts = [
    // Shorts
    {
      "categoryId": "ucm1ai9BggZTCgKqv4yz",
      "colors": [
        {"title": "Blue", "rgb": [0, 0, 255]},
        {"title": "Grey", "rgb": [128, 128, 128]},
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 25.0,
      "gender": 1,
      "images": ["https://example.com/images/Shorts.jpg"],
      "price": 30.0,
      "sizes": ["S", "M", "L"],
      "productId": "prod_shorts_1",
      "salesNumber": 15,
      "title": "Comfortable Cotton Shorts",
    },
    // Shoes
    {
      "categoryId": "s6Ey1PGsnESFhfszFMil",
      "colors": [
        {"title": "White", "rgb": [255, 255, 255]},
        {"title": "Black", "rgb": [0, 0, 0]},
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 75.0,
      "gender": 1,
      "images": ["Shoes.jpg"],
      "price": 100.0,
      "sizes": ["39", "40", "41", "42"],
      "productId": "prod_shoes_1",
      "salesNumber": 30,
      "title": "Classic Running Shoes",
    },
    // Hoodies
    {
      "categoryId": "bVAEvxRwL6kPkzr9JroC",
      "colors": [
        {"title": "Green", "rgb": [0, 128, 0]},
        {"title": "Purple", "rgb": [128, 0, 128]},
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 45.0,
      "gender": 2,
      "images": ["Hoodies.jpg"],
      "price": 60.0,
      "sizes": ["XS", "S", "M"],
      "productId": "prod_hoodie_1",
      "salesNumber": 20,
      "title": "Warm Winter Hoodie",
    },
    // Bags
    {
      "categoryId": "HeSNenYfyQfASCn7NUDu",
      "colors": [
        {"title": "Brown", "rgb": [165, 42, 42]},
        {"title": "Beige", "rgb": [245, 245, 220]},
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 50.0,
      "gender": 2,
      "images": ["Bags.jpg"],
      "price": 75.0,
      "sizes": ["One Size"],
      "productId": "prod_bag_1",
      "salesNumber": 12,
      "title": "Stylish Leather Bag",
    },
    // Jackets
    {
      "categoryId": "DvUv5F6zZDpaAO6vztj3",
      "colors": [
        {"title": "Navy", "rgb": [0, 0, 128]},
        {"title": "Black", "rgb": [0, 0, 0]},
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 80.0,
      "gender": 1,
      "images": ["Jackets.jpg"],
      "price": 120.0,
      "sizes": ["M", "L", "XL"],
      "productId": "prod_jacket_1",
      "salesNumber": 25,
      "title": "Waterproof Outdoor Jacket",
    }
  ];

  final productsCollection = FirebaseFirestore.instance.collection('Products');

  for (var product in sampleProducts) {
    await productsCollection.add(product);
  }

  print("Tüm ürünler Firebase'e başarıyla eklendi.");
}
