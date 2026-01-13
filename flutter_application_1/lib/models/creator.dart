enum UserRole { buyer, seller }

class User {
  final String userid;
  final String username;
  final String email;
  final String password;
  String? userImg;
  final Set<UserRole> roles;
  final Set<String> favoriteProductIds;
  final Set<String> cartProductIds;
  User({
    required this.userid,
    required this.email,
    required this.password,
    required this.username,
    this.userImg,
    Set<UserRole>? roles,
    Set<String>? favoriteProductIds,
    Set<String>? cartProductIds,
  }) : roles = roles ?? {UserRole.buyer},
       favoriteProductIds = favoriteProductIds ?? {},
       cartProductIds = cartProductIds ?? {};
  bool get isBuyer => roles.contains(UserRole.buyer);
  bool get isSeller => roles.contains(UserRole.seller);
  bool isFavorite(String productId) => favoriteProductIds.contains(productId);
  bool isInCart(String productId) => cartProductIds.contains(productId);
}
