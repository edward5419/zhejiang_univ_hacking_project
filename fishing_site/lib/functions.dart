import 'package:http/http.dart' as http;

void sendHttp(String id, String passward) async {
  final url = Uri.parse('localhost:8000');
  final map = {"id": id, "passward": passward};
  try {
    final response = await http.post(url, body: map);

    if (response.statusCode == 200) {
    } else {}
  } catch (e) {
    print(e);
  }
}
