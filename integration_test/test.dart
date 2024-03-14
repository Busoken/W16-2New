import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:netflux/flutter_flow/flutter_flow_drop_down.dart';
import 'package:netflux/flutter_flow/flutter_flow_icon_button.dart';
import 'package:netflux/flutter_flow/flutter_flow_widgets.dart';
import 'package:netflux/index.dart';
import 'package:netflux/main.dart';
import 'package:netflux/flutter_flow/flutter_flow_util.dart';

import 'package:netflux/backend/supabase/supabase.dart';
import 'package:netflux/auth/supabase_auth/auth_util.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('register', (WidgetTester tester) async {
      _overrideOnError();

      await SupaFlow.initialize();
      await authManager.signOut();

      await tester.pumpWidget(MyApp());

      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(ValueKey('emailAddress_Create_ixlz')),
          'artsad1awutwathakarn11@gmail.com');
      await tester.enterText(
          find.byKey(ValueKey('password_Create_5g88')), 'artsadawut12345');
      await tester.enterText(
          find.byKey(ValueKey('password_Create2_9jh4')), 'artsadawut12345');
      await tester.tap(find.byKey(ValueKey('Button_x1f8')));
      await tester.pumpAndSettle();
      expect(find.byKey(ValueKey('signoutbutton')), findsOneWidget);
      await tester.tap(find.byKey(ValueKey('signoutbutton')));
    });
  }

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
