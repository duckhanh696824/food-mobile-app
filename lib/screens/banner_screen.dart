import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int _currentPage = 0;

  final List<String> bannerImages = [
    'https://lh3.googleusercontent.com/proxy/ZiadBn2WHeqZswlK_FqrlqUfnZ_1XtW6PNyhsYQc_6ojWQtydoIlPI2T3ILtnEgykb-7hlaLvJFr6Rk_PtlPGpUqAwgNBAtjjrv7_I5-KF5VJgDvHS7-Jzi39k1sIet5YB9QW6665wQ9t6tSiu9F',
    'https://bizweb.dktcdn.net/100/468/889/products/hoa-qua-tuoi-ngon.jpg?v=1669773944263',
    'https://cdn.tgdd.vn/Files/2020/11/23/1308734/cam-nang-phan-biet-tat-tan-tat-cac-loai-cu-ngoai-cho-cho-co-nang-vung-ve-202011231624332434.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiwTEJb74BgbWwHbhWIaumEsv_lrChHG0YNg&s',
  ];

  @override
  void initState() {
    super.initState();
    // Auto slide to next page
    Future.delayed(const Duration(seconds: 2), _autoSlide);
  }

  void _autoSlide() {
    if (_pageController.hasClients) {
      int nextPage = (_currentPage + 1) % bannerImages.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage = nextPage;
      });
    }
    Future.delayed(const Duration(seconds: 2), _autoSlide);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Stack(
        children: [
          // PageView for images
          PageView.builder(
            controller: _pageController,
            itemCount: bannerImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                bannerImages[index],
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      'Unable to load image',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                },
              );
            },
          ),
          // Smooth page indicator
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: bannerImages.length,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 12,
                  dotColor: Colors.grey.shade400,
                  activeDotColor: Colors.green.shade700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
