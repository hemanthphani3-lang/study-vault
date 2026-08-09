import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/app/app.dart';
import 'package:study_vault/core/extensions/context_extensions.dart';
import 'package:study_vault/core/theme/app_colors.dart';
import 'package:study_vault/core/theme/app_theme.dart';
import 'package:study_vault/features/home/presentation/views/home_view.dart';
import 'package:study_vault/features/library/presentation/views/library_view.dart';
import 'package:study_vault/features/network/presentation/views/network_view.dart';
import 'package:study_vault/features/search/presentation/views/resource_details_view.dart';
import 'package:study_vault/features/search/presentation/views/search_results_view.dart';
import 'package:study_vault/features/search/presentation/views/search_view.dart';
import 'package:study_vault/features/settings/presentation/views/settings_view.dart';

import 'package:go_router/go_router.dart';

Widget _buildTestApp(Widget child) {
  return ProviderScope(
    child: MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) => child,
          ),
          GoRoute(path: '/search', name: 'search', builder: (_, __) => const Scaffold()),
          GoRoute(path: '/search-results', name: 'search-results', builder: (_, __) => const Scaffold()),
          GoRoute(path: '/network', name: 'network', builder: (_, __) => const Scaffold()),
          GoRoute(path: '/library', name: 'library', builder: (_, __) => const Scaffold()),
          GoRoute(path: '/details', name: 'resource-details', builder: (_, __) => const Scaffold()),
        ],
      ),
    ),
  );
}

void main() {
  group('StudyVault Sprint 3 Theme & Design System Tests', () {
    test('Celestial Knowledge color palette matches specifications', () {
      expect(AppColors.background, const Color(0xFF050816));
      expect(AppColors.surface, const Color(0xFF12182E));
      expect(AppColors.card, const Color(0xFF1B2340));
      expect(AppColors.primary, const Color(0xFF8B7DFF));
      expect(AppColors.secondary, const Color(0xFF63F2E8));
      expect(AppColors.success, const Color(0xFF62FFB5));
      expect(AppColors.warning, const Color(0xFFFFD98A));
      expect(AppColors.error, const Color(0xFFFF6B81));
    });

    testWidgets('ThemeExtension delivers tokens to context without boilerplate',
        (WidgetTester tester) async {
      late Color bgColor;
      late bool isPhoneLayout;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: Builder(
            builder: (BuildContext context) {
              bgColor = context.colors.background;
              isPhoneLayout = context.isPhone;
              return Container(color: bgColor);
            },
          ),
        ),
      );

      expect(bgColor, AppColors.background);
      expect(isPhoneLayout, isNotNull);
    });
  });

  group('Sprint 3 Screen Rendering Tests', () {
    testWidgets('HomeView renders with hero search, categories, and trending cards',
        (WidgetTester tester) async {
      await tester.pumpWidget(_buildTestApp(const HomeView()));
      await tester.pump();

      expect(find.text('StudyVault'), findsWidgets);
      expect(find.text('Academic Domains'), findsOneWidget);
      expect(find.text('Trending Resources'), findsOneWidget);
    });

    testWidgets('SearchView renders search bar and topic suggestions',
        (WidgetTester tester) async {
      await tester.pumpWidget(_buildTestApp(const SearchView()));
      await tester.pump();

      expect(find.text('Academic Knowledge Search'), findsOneWidget);
      expect(find.text('Trending Topics & Swarms'), findsOneWidget);
    });

    testWidgets('SearchResultsView renders sort and filter chips',
        (WidgetTester tester) async {
      await tester.pumpWidget(_buildTestApp(const SearchResultsView()));
      await tester.pump();

      expect(find.text('Search Results'), findsOneWidget);
      expect(find.text('All Verified'), findsOneWidget);
    });

    testWidgets('ResourceDetailsView renders cover, metadata, and download action',
        (WidgetTester tester) async {
      await tester.pumpWidget(_buildTestApp(const ResourceDetailsView()));
      await tester.pump();

      expect(find.text('Resource Details'), findsOneWidget);
      expect(find.text('Document Metadata'), findsOneWidget);
      expect(find.text('Sync to Local Vault'), findsOneWidget);
    });

    testWidgets('LibraryView renders vault quota progress and saved documents',
        (WidgetTester tester) async {
      await tester.pumpWidget(_buildTestApp(const LibraryView()));
      await tester.pump();

      expect(find.text('Personal Knowledge Vault'), findsOneWidget);
      expect(find.text('Vault Storage Active'), findsOneWidget);
    });

    testWidgets('NetworkView renders P2P mesh status and contribution metrics',
        (WidgetTester tester) async {
      await tester.pumpWidget(_buildTestApp(const NetworkView()));
      await tester.pump();

      expect(find.text('P2P Knowledge Mesh'), findsOneWidget);
      expect(find.text('Knowledge Contribution'), findsOneWidget);
    });

    testWidgets('SettingsView renders node identity and storage management',
        (WidgetTester tester) async {
      await tester.pumpWidget(_buildTestApp(const SettingsView()));
      await tester.pump();

      expect(find.text('Settings & Node Preferences'), findsOneWidget);
      expect(find.text('Academic Seeder Node'), findsOneWidget);
    });
  });

  group('StudyVault App Root Bootstrap Test', () {
    testWidgets('StudyVaultApp initializes cleanly with GoRouter and Riverpod',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: StudyVaultApp(),
        ),
      );
      await tester.pump();

      expect(find.text('StudyVault'), findsWidgets);
    });
  });
}

