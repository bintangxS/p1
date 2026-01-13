import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EventBanner extends StatefulWidget {
  const EventBanner({super.key});

  @override
  State<EventBanner> createState() => _EventBannerState();
}

class _EventBannerState extends State<EventBanner> {
  //final CarouselController _carouselController = CarouselController();
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  final ScrollController _smallController = ScrollController();
  int _carouselRealIndex = 0;

  final List<String> banner = [
    'assets/img/bgfgop1.jpg',
    'assets/img/profile_img.png',
    'assets/img/logowxs.png',
    'assets/img/The_Last_Line_Encore_Karen.png',
    'assets/img/The_Last_Line_Hikari.png',
    'assets/img/Soul_Revue_Maya.png',
    'assets/img/Soul_Revue_Claudine.png',
  ];
  late final List<String> loopBanner;
  int activIndex = 0;

  static const double smallWidth = 80;
  static const double spacing = 12;

  @override
  void initState() {
    super.initState();
    loopBanner = [...banner, ...banner, ...banner];

    ///start in middle so user can swap both way
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _smallController.jumpTo(banner.length * (smallWidth + spacing));
    });
  }

  void _scrollSmallBanner() {
    _smallController.animateTo(
      (banner.length + activIndex) * (smallWidth + spacing),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _jumpToBanner(int targetIndex) {
    final len = banner.length;
    final current = _carouselRealIndex;

    // current logical index (0..len-1)
    final currentLogical = current % len;

    // shortest direction
    final forward = (targetIndex - currentLogical + len) % len;
    final backward = forward - len;

    final offset = forward.abs() < backward.abs() ? forward : backward;

    final targetPage = current + offset;

    _carouselController.animateToPage(
      targetPage,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _smallController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //1
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: banner.length,
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                activIndex = index % banner.length;
                _carouselRealIndex = index;
              });
              _scrollSmallBanner();
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Image.asset(
              banner[index],
              fit: BoxFit.cover,
              width: double.infinity,
            );
          },
        ),
        const SizedBox(height: 8),
        //2
        SizedBox(
          height: 45,
          child: ListView.builder(
            controller: _smallController,
            itemCount: loopBanner.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final realIndex = index % banner.length;
              final isActive = realIndex == activIndex;
              return GestureDetector(
                onTap: () {
                  setState(() => activIndex = realIndex);

                  ///sync
                  //_carouselController.animateToPage(realIndex);

                  _jumpToBanner(realIndex);
                  _scrollSmallBanner();
                },

                child: Container(
                  width: smallWidth,
                  margin: const EdgeInsets.only(left: spacing),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: isActive ? Border.all(color: Colors.blue) : null,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    /*child: ColorFiltered(
                      colorFilter: !isActive? ColorFilter.mode(
                        Colors.grey.withValues(alpha: 0.9),
                        BlendMode.saturation,
                      ) : null,
                      child: Image.asset(loopBanner[index], fit: BoxFit.cover),
                    ),*/
                    child: isActive
                        ? Image.asset(loopBanner[index], fit: BoxFit.cover)
                        : ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.grey,
                              BlendMode.screen,
                            ),
                            child: Image.asset(
                              loopBanner[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 30),
        Divider(),
      ],
    );
  }
}
/*int currentIndex = 0;

void next() {
  setState(() {
    currentIndex++;
    if (currentIndex >= banners.length) {
      currentIndex = 0;
    }
  });
}*/


/*Widget carouselEvents() {
  return CarouselSlider(
    options: CarouselOptions(height: 180, autoPlay: true, viewportFraction: 1),
    items: ['assets/img/bgfgop1.jpg', 'assets/img/bgfgop1.jpg'].map((img) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Image.asset(img, fit: BoxFit.cover, width: double.infinity),
      );
    }).toList(),
  );
}

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return carouselEvents();
  }
}
*/