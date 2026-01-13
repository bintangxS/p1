import 'package:flutter_application_1/models/comment.dart';
import 'package:flutter_application_1/models/product.dart';

List<Product> mangaproducts = [
  Product(
    id: 'p1',
    title: 'Let’s Start The Show!WxS Fan made anthology',
    createdAt: DateTime(2024, 12, 2),
    description: '''
    ''',
    price: 5.0,

    imagesUrl: [
      'assets/img/Manga/p1/cover.jpg',
      'assets/img/Manga/p1/img1.jpg',
    ],
    category: ProductCategory.manga,
    storeId: 's1',
    productDesc:
        '''This is a fan-made anthology of "Project SEKAI COLORFUL STAGE! feat. Hatsune Miku" (English title "HATSUNE MIKU: COLORFUL STAGE!"), the unit "Wonderlands×Showtime"
This book is written in Japanese.

With 47 participants and 112 FULL-COLOR pages. We are proud to present an energetic anthology that will make you smile as you read it!


List of Participants
https://x.com/Samidare_Haduki/status/1652991289976299520


Hosted by
Circle LiliumCasablanca
五月雨葉月　@Samidare_Haduki
''',
    favoriteCount: 70,
    stock: 41,
    comments: [
      Comment(
        id: 'User1',
        userName: 'Pembeli1',
        text: 'Wow! SO cool! the story realy good!',
        createdAt: DateTime(2024, 12, 9),
      ),
      Comment(
        id: 'User2',
        userName: 'Pembeli2',
        text:
            'Not bad, its surpising that the story take difference from the game while keep the essence',
        createdAt: DateTime(2025, 1, 10),
      ),
    ],
  ),

  Product(
    id: 'p2',
    title: 'GET OVER THAT NIGHT!!VBS Fan-made anthology',
    createdAt: DateTime(2025, 3, 2),
    description: 'First demo work',
    price: 6.0,
    stock: 231,

    imagesUrl: [
      'assets/img/Manga/p2/cover.jpg',
      'assets/img/Manga/p2/img1.jpg',
    ],
    category: ProductCategory.manga,
    storeId: 's1',
    productDesc:
        '''This is a fan-made anthology of "Project SEKAI COLORFUL STAGE! feat. Hatsune Miku" (English title "HATSUNE MIKU: COLORFUL STAGE!"), the unit "Vivid BAD SQUAD"
This book is written in Japanese.

With 36 participants and 82 FULL-COLOR pages, the book depicts four people who keep walking forward.　


List of Participants
https://twitter.com/Samidare_Haduki/status/1568917643218014209?s=20&t=8SjoK1FbvUE64CO2CxKOvg


Hosted by
Circle LiliumCasablanca
五月雨葉月　@Samidare_Haduki''',
    favoriteCount: 100,
    comments: [
      Comment(
        id: 'User1',
        userName: 'Pembeli1',
        text: 'Wow! its even better than part 1',
        createdAt: DateTime(2025, 3, 1),
      ),
      Comment(
        id: 'User2',
        userName: 'Pembeli2',
        text: 'Damn! its good',
        createdAt: DateTime(2025, 4, 10),
      ),
    ],
  ),
  Product(
    id: 'p3',
    title: ' L/n Fan made anthology',
    createdAt: DateTime(2025, 5, 12),
    description: 'First demo work',
    price: 5.0,
    stock: 321,
    imagesUrl: [
      'assets/img/Manga/p2/cover211.jpg',
      'assets/img/Manga/p2/img1_2.jpg',
    ],
    category: ProductCategory.manga,
    storeId: 's2',
    productDesc:
        '''With 24 participants and 64 FULL-COLOR pages. We are pleased to present you an anthology of these wonderful works, they were guided by a shooting star.

First come, first served 2023 Happy New Year postcard and special paper! (The offer will end as soon as they are gone.)


List of Participants
https://twitter.com/Samidare_Haduki/status/1606967994768588801?s=20


Hosted by
Circle LiliumCasablanca
五月雨葉月　@Samidare_Haduki''',
    favoriteCount: 0,
    comments: [],
  ),
  Product(
    id: 'p4',
    title: 'MORE HAPPINESS! MORE DREAM! _MMJ Fan-made anthology',
    createdAt: DateTime(2025, 5, 13),
    description: 'First demo work',
    price: 5.0,
    stock: 211,
    imagesUrl: [
      'assets/img/Manga/p2/cover3.jpg',
      'assets/img/Manga/p2/img1_31.jpg',
    ],
    category: ProductCategory.manga,
    storeId: 's2',
    productDesc:
        '''This is a fan-made anthology of "Project SEKAI COLORFUL STAGE! feat. Hatsune Miku" (English title "HATSUNE MIKU: COLORFUL STAGE!"), the unit "MORE MORE JUMP！"
This book is written in Japanese.

With 30 participants and 82 FULL-COLOR pages, the book will make you smile even when you're feeling down!　


List of Participants
https://twitter.com/Samidare_Haduki/status/1556596091801542656?s=20&t=MCPCu1ggKxDPuGxm-wCLeg

piapro Links Obtained
piapro Application PK:5qmp9ebi
https://piapro.jp/product/?id=5qmp9ebi


Hosted by
Circle LiliumCasablanca
五月雨葉月　@Samidare_Haduki''',
    favoriteCount: 0,
    comments: [],
  ),
  Product(
    id: 'p5',
    title: '25ji Fan-made anthology',
    createdAt: DateTime(2025, 5, 14),
    description: 'First demo work',
    price: 5.0,
    stock: 231,
    imagesUrl: [
      'assets/img/Manga/p2/cover41.jpg',
      'assets/img/Manga/p2/img1_4.jpg',
    ],
    category: ProductCategory.manga,
    storeId: 's1',
    productDesc:
        '''This is a fan-made anthology of "Project SEKAI COLORFUL STAGE! feat. Hatsune Miku" (English title "HATSUNE MIKU: COLORFUL STAGE!"), the unit "Nightcord at 25:00."
This book is written in Japanese.

We are pleased to present you a gorgeous volume with 50 participants and 140 pages in FULL COLOR!

List of Participants
https://twitter.com/Samidare_Haduki/status/1515631157274046467?s=20&t=8jjTBS90URMTkze6HHFjtg


Hosted by
Circle LiliumCasablanca
五月雨葉月　@Samidare_Haduki''',
    favoriteCount: 0,
    comments: [],
  ),
  Product(
    id: 'p6',
    title: 'Sample Illustration',
    createdAt: DateTime(2025, 5, 15),
    description: 'First demo work',
    price: 5.0,
    stock: 31,
    imagesUrl: [
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
    ],
    category: ProductCategory.manga,
    storeId: 's2',
    productDesc: '',
    favoriteCount: 0,
    comments: [],
  ),
  Product(
    id: 'p7',
    title: 'Sample Illustration',
    createdAt: DateTime(2025, 5, 16),
    description: 'First demo work',
    price: 5.0,
    stock: 31,
    imagesUrl: [
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
    ],
    category: ProductCategory.manga,
    storeId: 's2',
    productDesc: '',
    favoriteCount: 0,
    comments: [],
  ),
  Product(
    id: 'p8',
    title: 'Sample Illustration',
    createdAt: DateTime(2025, 5, 17),
    description: 'First demo work',
    price: 5.0,
    stock: 31,
    imagesUrl: [
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
    ],
    category: ProductCategory.manga,
    storeId: 's2',
    productDesc: '',
    favoriteCount: 0,
    comments: [],
  ),
  Product(
    id: 'p9',
    title: 'Sample Illustration',
    createdAt: DateTime(2025, 5, 18),
    description: 'First demo work',
    price: 5.0,
    stock: 31,
    imagesUrl: [
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
    ],
    category: ProductCategory.manga,
    storeId: 's2',
    productDesc: '',
    favoriteCount: 0,
    comments: [],
  ),
  Product(
    id: 'p10',
    title: 'Sample Illustration',
    createdAt: DateTime(2025, 5, 19),
    description: 'First demo work',
    price: 5.0,
    stock: 31,
    imagesUrl: [
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
    ],
    category: ProductCategory.manga,
    storeId: 's2',
    productDesc: '',
    favoriteCount: 0,
    comments: [],
  ),
  Product(
    id: 'p11',
    title: 'Sample Illustration',
    createdAt: DateTime(2025, 5, 20),
    description: 'First demo work',
    price: 5.0,
    stock: 31,
    imagesUrl: [
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
      'assets/img/logowxs.png',
    ],
    category: ProductCategory.manga,
    storeId: 's1',
    productDesc: '',
    favoriteCount: 0,
    comments: [],
  ),
];
