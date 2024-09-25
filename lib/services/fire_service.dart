import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireService {
  // DatabaseReference database = FirebaseDatabase.instance.ref();
  Reference storage = FirebaseStorage.instance.ref();
  // final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
}
