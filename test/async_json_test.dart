import 'package:test/test.dart';
import 'package:async_json/async_json.dart';


void main() {
  test('Book.fromJson 能正确解析字段', () {
    final book = Book.fromJson({
      'id': 'b01',
      'title': '跨平台之路',
      'category': '计算机技术',
      'author': '张承志',
      'rating': 5,
      'borrowCount': 9,
      'month': '1月',
    });

    expect(book.title, '跨平台之路');
    expect(book.category, '计算机技术');
    expect(book.borrowCount, 9);
  });

  test('fromJson -> toJson -> fromJson 往返一致', () {
  final original = {
    'id': 'b02',
    'title': '异步的秩序',
    'category': '科普百科',
    'author': '张承志',
    'rating': 4,
    'borrowCount': 66,
    'month': '1月',
  };
  final book = Book.fromJson(original);
  final restored = Book.fromJson(book.toJson());

  expect(book.toJson(), restored.toJson());
});
}
