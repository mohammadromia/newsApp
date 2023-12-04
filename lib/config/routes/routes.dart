import 'package:flutter/material.dart';

import '../../features/news/domain/entities/article.dart';
import '../../features/news/presentation/pages/article_detail.dart';
import '../../features/news/presentation/pages/home.dart';
import '../../features/news/presentation/pages/saved_artilce.dart';



class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());

      case '/ArticleDetails':
        return _materialRoute(ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());
        
      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}