import 'package:flutter_money_manager/features/daily/presentation/widgets/create_transaction_widgets.dart';
import 'package:go_router/go_router.dart';

import '../features/daily/presentation/pages/daily_page.dart';

class AppRouter {
  AppRouter._();

  static final routeConfig = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const DailyPage(),
      ),
      GoRoute(
        path: '/create-transaction',
        builder: (context, state) => const CreateTransactionWidgets(),
      ),
    ],
  );
}