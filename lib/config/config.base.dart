enum ConfigEnv { production, develop }

abstract class Config {
  String get requestBaseURL;
}
