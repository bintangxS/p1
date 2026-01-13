class Store {
  final String id;
  final String ownerId;
  final String storeName;
  final String? storeImage;
  final String? bannerImage;
  final double rating;
  final String? storeBio;

  const Store({
    required this.id,
    required this.ownerId,
    required this.storeName,
    this.storeImage,
    this.bannerImage,
    required this.rating,
    this.storeBio,
  });
}

final List<Store> stores = [
  Store(
    id: 's1',
    ownerId: 'c1',
    storeName: 'Bstore',
    storeImage: 'assets/img/logowxs.png',
    bannerImage: 'assets/img/logowxs.png',
    storeBio:
        'fduighiusdfhgarioyhrgkurhgbuerhgukrhguierghfoughsukwrhufgbejkfgsbiufgte97tgeiorfyhoilgrfoaugfaehgfuljagfaejt;entklgwuoh',
    rating: 4.9,
  ),
  Store(
    id: 's2',
    ownerId: 'c2',
    storeName: 'Sstore',
    storeImage: 'assets/img/profile_img.png',
    bannerImage: 'assets/img/profile_img.png',
    storeBio:
        'fafifhnfilgksdhklghnaldkfbhnslkhfdsjogjisdghsdjfdlfsdfjhsd;ghad;bfksafsajf;sbh',
    rating: 4.8,
  ),
];

Store getStoreById(String storeId) {
  return stores.firstWhere((s) => s.id == storeId);
}
