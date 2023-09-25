import 'package:clean_news/config/routes/routes.dart';
import 'package:clean_news/config/theme/app_theme.dart';
import 'package:clean_news/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_news/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:clean_news/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const DailyNews(),
      ),
    );
  }
}
