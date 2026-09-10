abstract class SpeechService {
  Future<bool> initialize();
  Future<String> listen({
    String? localeId,
    void Function(String transcript)? onPartialResult,
  });
  Future<void> stop();
}
