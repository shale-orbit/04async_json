import 'dart:convert';
import 'dart:io';
import 'package:async_json/async_json.dart';
import 'package:path/path.dart' as p;
Future<void> main() async {
  try {
    final text = await File(p.join('data','books.json')).readAsString();
    final books = [for (final j in jsonDecode(text) as List) Book.fromJson(j)];
    final byCat = <String, int>{};
    for (final b in books) {
      byCat[b.category] = (byCat[b.category] ?? 0) + 1;
    }
    final top3 = [...books]..sort((a, b) => b.borrowCount.compareTo(a.borrowCount));
    print('总数 ${books.length}');
    print('类目 $byCat');
    print('借阅量Top3 ${[for (final b in top3.take(3)) '${b.title}(${b.borrowCount})']}');
  } on FileSystemException {
    print('数据文件缺失，请检查 data/books.json');
  } 
   on TypeError {
  print('字段类型不符合模型要求，请检查 books.json');
}  catch (e) {
    print('解析失败：$e');
  }
}
