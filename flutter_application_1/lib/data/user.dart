import 'package:flutter_application_1/models/creator.dart';

User? currentUser;

final List<User> users = [
  User(
    userid: 'u0',
    email: 'test@gmail.com',
    password: '123',
    username: 'User',
  ),

  User(
    userid: 'c1',
    email: 'MrB@gmail.com',
    password: '123yey',
    username: 'BintangWXS',
    //bio: 'Independent digital creator',
    userImg: 'assets/img/profile_img.png',
  ),

  User(
    userid: 'c2',
    email: 'notMrB@gmail.com',
    password: '123notyey',
    username: 'Not Bintang',
    //bio: 'Independent digital creator',
    userImg: 'assets/img/profile_img.png',
    roles: {UserRole.buyer, UserRole.seller},
    favoriteProductIds: {'p1', 'p3', 'p10'},
  ),
];

User getUserByuserid(String userid) {
  return users.firstWhere(
    (u) => u.userid == userid,
    orElse: () => throw Exception('User not found: $userid'),
  );
}
