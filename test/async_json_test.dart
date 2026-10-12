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
}
