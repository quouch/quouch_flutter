part of 'test_app.dart';

Future<Element> initializeWidgetForTest(
    WidgetTester tester, dynamic pageToTest) async {
  await mockNetworkImagesFor(
      () => tester.pumpWidget(TestApp(home: pageToTest)));

  var context = tester.element(find.byType(pageToTest.runtimeType));
  return context;
}
