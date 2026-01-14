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
    storeName: 'Bintangstore',
    storeImage: 'assets/img/logowxs.png',
    bannerImage: 'assets/img/logowxs.png',
    storeBio: '''
  A cozy store for book lovers. From popular titles to hidden gems, we carefully pick products you would enjoy.
  Highly rated store offering premium selections with consistent quality and reliable service. Customer satisfaction is our priority.

''',
    rating: 4.9,
  ),
  Store(
    id: 's2',
    ownerId: 'c2',
    storeName: 'Starstore',
    storeImage: 'assets/img/profile_img.png',
    bannerImage: 'assets/img/profile_img.png',
    storeBio: '''Curated books, trusted quality, and fast service.
An independent store built by passionate readers. We focus on unique titles, creative works, and meaningful stories.

''',
    rating: 4.8,
  ),
];

Store getStoreById(String storeId) {
  return stores.firstWhere((s) => s.id == storeId);
}
