abstract class Failurs {
  final String message;
  Failurs({required this.message});
} 
class ServerFailurs extends Failurs {
  ServerFailurs( {required String message}) : super(message: message);
}