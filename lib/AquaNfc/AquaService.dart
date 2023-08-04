import 'package:http/http.dart' as http;

class AquaService {
  Future<bool> getNfcCard() async {
    String url =
        'https://www.random.org/integers/?num=1&min=1&max=9&col=1&base=10&format=plain&rnd=new';
    print('i111111');

    try {
      var urle = Uri.parse(url);
      var response = await http.get(urle);

      print(response.body);
      if (response.statusCode == 200) {
        print(" Istek başarılı ");
        final number = int.parse(response.body);
        if (number % 2 == 0) {
          return true;
        } else {
          return false;
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
