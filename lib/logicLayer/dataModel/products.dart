import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


class Product {
  final int id;
  final String name;
  final String description;
  final  String price;
  final  List imageUrl;
  final  List ? colors;
  Product({this.colors,required this.name,
    required this.description,required this.price,
    required this.imageUrl, required this.id });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'colors': colors,
      'id':id,

    };
  }
}

void addProduct(Product product,String nameCollection) async {
  final CollectionReference productsCollection =
  FirebaseFirestore.instance.collection(nameCollection);
  await productsCollection.add(product.toMap());
}



// Reference to the Firebase Storage service
final FirebaseStorage storage = FirebaseStorage.instance;

// Get the file from the specified location in Firebase Storage
Future<String> getImageUrl(String filePath) async {
  final  storageReference = storage.ref().child(filePath);
  String url = await storageReference.getDownloadURL();
  return url;
}

Product watch1 = Product(name: 'Apple Watch Series 6', description: 'The most notable changes to the Apple Watch Series 6 include blood oxygen tracking, a faster processor, and a new 2.5x brighter always-on display',
price: '\$399',
imageUrl: [
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch11.png'),
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch12.png'),
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch13.png'),
],
colors:['pink','black','white'],
  id:1,
);

Product watch2 = Product(name: 'Samsung Galaxy Watch 3', description: 'The Samsung Galaxy Watch 3 is a sleek and feature-packed smartwatch that offers GPS, heart rate monitoring, and a rotating bezel for navigation.',
price: '\$429.99',
imageUrl: [
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch21.jpg'),
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch22.jpg'),
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch23.jpg'),
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch24.jpg'),
],
colors:['black','silver','bronze'], id:2
);

Product watch3 = Product(name: 'Fitbit Sense', description: 'The Fitbit Sense is a top-of-the-line smartwatch that boasts advanced health tracking features like ECG, skin temperature sensing, and a stress management score.',
price: '\$329.95',
imageUrl: [
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch31.jpg'),
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch32.jpg'),
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch33.jpg'),
],
colors:['carbon black','moonstone'], id:3
);

Product watch4 = Product(name: 'Garmin Venu 2', description: 'The Garmin Venu 2 is a GPS-enabled smartwatch that features an AMOLED display, up to five days of battery life, and built-in fitness and wellness tracking.',
price: '\$349.99',
imageUrl: [
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch41.jpg'),
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch42.jpg'),
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch43.jpg'),
],
colors:['silver','gold','shadow gray'], id: 4
);

Product watch5 = Product(name: 'TicWatch Pro 3 GPS', description: 'The TicWatch Pro 3 GPS is a budget-friendly smartwatch that offers GPS, NFC, and two weeks of battery life with its dual-layer display technology.',
price: '\$259',
imageUrl: [
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch51.jpg'),
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch52.jpg'),
  getImageUrl('gs://ecomapp-f24e0.appspot.com/wearable/watch43.jpg'),
],
colors:['shadow black','timeless silver'],
  id:5
);

 void addWearble() {
   addProduct(watch1, "wearable"
   );
   addProduct(watch2, "wearable"
   );
   addProduct(watch3, "wearable"
   );
   addProduct(watch4, "wearable"
   );
   addProduct(watch5, "wearable"
   );
 }

 class AddInfo extends StatelessWidget {
   static const route="addInfo";
   const AddInfo({Key? key}) : super(key: key);
   @override
   Widget build(BuildContext context) {
     return  Scaffold(
       body:Center(
      child: TextButton(onPressed: () {
         addWearble();
         print("done");
       }, child: Text("button"),),
     ),);
   }
 }
