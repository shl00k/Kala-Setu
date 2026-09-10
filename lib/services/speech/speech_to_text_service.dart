import 'package:speech_to_text/speech_to_text.dart';

import 'speech_service.dart';

class SpeechToTextService implements SpeechService {
  final SpeechToText speech;
  SpeechToTextService({SpeechToText? speech})
    : speech = speech ?? SpeechToText();

  @override
  Future<bool> initialize() => speech.initialize();

  @override
  Future<String> listen({
    String? localeId,
    void Function(String transcript)? onPartialResult,
  }) async {
    final ready = await initialize();
    if (!ready) return '';

    var transcript = '';
    await speech.listen(
      listenOptions: SpeechListenOptions(
        localeId: localeId,
        listenFor: const Duration(seconds: 45),
        pauseFor: const Duration(seconds: 4),
        partialResults: true,
      ),
      onResult: (result) {
        transcript = result.recognizedWords;
        onPartialResult?.call(transcript);
      },
    );

    while (speech.isListening) {
      await Future<void>.delayed(const Duration(milliseconds: 150));
    }
    return transcript;
  }

  @override
  Future<void> stop() => speech.stop();
}
