import 'package:mymoney/models/ad_model.dart';
import 'package:mymoney/global/loading_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeService {
  final LoadingService loadingService = LoadingService();

  bool isAdLoaded = false;

  int page = 1;
  List<AdModel> ads = [];

  incrementPage() {
    page++;
  }

  decrementPage() {
    page--;
  }

  Future<void> loadAds() async {
    if (ads.length > 60) return;

    for (var i = 1; i <= 8; i++) {
      ads.addAll([
        AdModel(
          'id $i',
          'title $i',
          'describe $i',
          'url $i',
          'image $i',
        )
      ]);
    }
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
