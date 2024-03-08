import 'dart:ui';

class Category {
  String id;
  String title;
  Color color;
  String imageName;
  Category({
    required this.title,
    required this.id,
    required this.color,
    required this.imageName,
  });
  static List<Category> getAllCategoryItems() {
    return [
      Category(
          title: 'Sports',
          id: 'sports',
          color: const Color(0xffC91C22),
          imageName: 'sports.png'),
      Category(
          title: 'General',
          id: 'general',
          color: const Color(0xff4882CF),
          imageName: 'politics.png'),
      Category(
          title: 'Health',
          id: 'health',
          color: const Color(0xffED1E79),
          imageName: 'health.png'),
      Category(
          title: 'Business',
          id: 'business',
          color: const Color(0xffCF7E48),
          imageName: 'business.png'),
      Category(
          title: 'Entertainment',
          id: 'entertainment',
          color: const Color(0xff4882CF),
          imageName: 'environment.png'),
      Category(
          title: 'Science',
          id: 'science',
          color: const Color(0xffF2D352),
          imageName: 'science.png'),
    ];
  }
}
