class AppConfig {
 static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
 static const supabasePublishableKey = String.fromEnvironment('SUPABASE_KEY');

 static const geminiApiKey = String.fromEnvironment('GEMINI_API_KEY');
 static const geminiModel = String.fromEnvironment(
   'GEMINI_MODEL',
   defaultValue: 'gemini-3.5-flash',
 );

 static const bhashiniUserId = String.fromEnvironment('BHASHINI_USER_ID');
 static const bhashiniApiKey = String.fromEnvironment('BHASHINI_API_KEY');
 static const bhashiniPipelineId = String.fromEnvironment(
   'BHASHINI_PIPELINE_ID',
   defaultValue: '64392f96daac500b55c543cd',
 );

 static const ondcBaseUrl = String.fromEnvironment('ONDC_BASE_URL');
 static const ondcEnabled = bool.fromEnvironment('ONDC_ENABLED');

 static bool get hasSupabase =>
     supabaseUrl.isNotEmpty && supabasePublishableKey.isNotEmpty;
 static bool get hasGemini => geminiApiKey.isNotEmpty;
 static bool get hasBhashini =>
     bhashiniUserId.isNotEmpty && bhashiniApiKey.isNotEmpty;
}
