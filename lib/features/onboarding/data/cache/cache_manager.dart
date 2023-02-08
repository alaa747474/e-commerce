import 'package:hive/hive.dart';

class CacheManger {
  onboardingCaching()async{
  Box box=await Hive.openBox('MyBox');
         box.put('ShowHome',true);
}
}