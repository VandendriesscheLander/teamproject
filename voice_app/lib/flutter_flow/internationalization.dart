import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'nl'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? nlText = '',
  }) =>
      [enText, nlText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // MainQuestionRecordPage
  {
    '3sx25g4n': {
      'en': 'Share Your Voice',
      'nl': '',
    },
    't8hifcjb': {
      'en': 'Tap to Record',
      'nl': '',
    },
    '0vq83vxu': {
      'en': 'Loading ...',
      'nl': '',
    },
    'outov8hp': {
      'en': 'Back',
      'nl': '',
    },
    'wsm2u9qi': {
      'en': 'Next',
      'nl': '',
    },
    '6n9ptg1t': {
      'en': 'Next',
      'nl': '',
    },
  },
  // QuestionSpeechToText
  {
    'iayv63oi': {
      'en': 'Review Your Voice',
      'nl': '',
    },
    'fjluloda': {
      'en': 'Please review and edit the transcribed text if needed',
      'nl': '',
    },
    '52fg31n2': {
      'en': 'Your transcribed text will appear here...',
      'nl': '',
    },
    '9dmk3mnj': {
      'en': 'Back',
      'nl': '',
    },
    'iffcn9dq': {
      'en': 'Next',
      'nl': '',
    },
  },
  // ProbingQuestionRecordingPage1
  {
    'agohr1wr': {
      'en': 'Probing Question',
      'nl': '',
    },
    'ar9t2e7z': {
      'en': 'Let\'s explore your thoughts further',
      'nl': '',
    },
    'zfyh790f': {
      'en': 'Tap to Record',
      'nl': '',
    },
    '7fa6ig0n': {
      'en': 'Loading ...',
      'nl': '',
    },
    'e6vef727': {
      'en': 'Back',
      'nl': '',
    },
    '1mxx1752': {
      'en': 'Next',
      'nl': '',
    },
    'rive00as': {
      'en': 'Skip',
      'nl': '',
    },
  },
  // HomePage
  {
    'sfn01k3a': {
      'en': 'Welcome Back!',
      'nl': '',
    },
    'w8lo488t': {
      'en': 'Share your thoughts on today\'s community questions',
      'nl': '',
    },
    'eqwqyv4i': {
      'en': 'Local Education',
      'nl': '',
    },
    '0rati7su': {
      'en':
          'How can our schools better prepare students for future challenges?',
      'nl': '',
    },
    'p3j30ztz': {
      'en': 'Community Safety',
      'nl': '',
    },
    '930ytqev': {
      'en':
          'What initiatives would enhance safety and security in our neighborhood?',
      'nl': '',
    },
    'xtlonu0u': {
      'en': 'Environmental Impact',
      'nl': '',
    },
    '9lo8gdji': {
      'en': 'How can we reduce our community\'s environmental footprint?',
      'nl': '',
    },
    'vxiculrz': {
      'en': 'Local Business',
      'nl': '',
    },
    't0o39bmv': {
      'en': 'What support do small businesses need to thrive in our community?',
      'nl': '',
    },
  },
  // SummaryPage
  {
    'j0gopu3q': {
      'en': 'Summary',
      'nl': '',
    },
    'xmc6bp4y': {
      'en': 'Review your responses before submitting',
      'nl': '',
    },
    'z0ei0fh9': {
      'en': 'Main Question',
      'nl': '',
    },
    'b6cu6ntp': {
      'en': 'TextField',
      'nl': '',
    },
    'mdhe4vg4': {
      'en': 'Probing Questions',
      'nl': '',
    },
    'nh6ktyhz': {
      'en': 'TextField',
      'nl': '',
    },
    '0nxkwnf2': {
      'en': 'TextField',
      'nl': '',
    },
    'f5o9coyc': {
      'en': 'TextField',
      'nl': '',
    },
    'chuyif19': {
      'en': 'Back',
      'nl': '',
    },
    'otm83xrm': {
      'en': 'Finish',
      'nl': '',
    },
  },
  // ProbingQuestionRecordingPage2
  {
    '4lqbied7': {
      'en': 'Probing Question',
      'nl': '',
    },
    '5l74bn8t': {
      'en': 'Let\'s explore your thoughts further',
      'nl': '',
    },
    'xu590sfz': {
      'en': 'Tap to Record',
      'nl': '',
    },
    '838gh2mk': {
      'en': 'Loading ...',
      'nl': '',
    },
    'ugej1j4a': {
      'en': 'Back',
      'nl': '',
    },
    's5io63yv': {
      'en': 'Next',
      'nl': '',
    },
    'lkbidnnn': {
      'en': 'Skip',
      'nl': '',
    },
  },
  // ProbingQuestionRecordingPage3
  {
    '7wp794cn': {
      'en': 'Probing Question',
      'nl': '',
    },
    'ou3sivw8': {
      'en': 'Let\'s explore your thoughts further',
      'nl': '',
    },
    'ie7rvosw': {
      'en': 'Tap to Record',
      'nl': '',
    },
    'oe5do581': {
      'en': 'Loading ...',
      'nl': '',
    },
    'jmenqzkl': {
      'en': 'Back',
      'nl': '',
    },
    'sxxf9p2k': {
      'en': 'Next',
      'nl': '',
    },
    'wv8q5i6g': {
      'en': 'Skip',
      'nl': '',
    },
  },
  // ConcentPopUp
  {
    'p3r7kdx6': {
      'en': 'Consent',
      'nl': '',
    },
    'tbimbb0p': {
      'en':
          'By participating in this survey, you acknowledge that you have read and understood the following information:\n\n\nPurpose of the Survey: data collection for china\n\nData Anonymity: officially yes\n\nData Usage: The data collected will only be used for analytics. It will not be shared with any third parties or used for any other purposes.\n\nBy clicking \"I Agree,\" you consent to participate in this survey under the terms outlined above. If you have any questions, feel free to contact us at [contact information].\n\nI Do Not Agree  |  I Agree',
      'nl': '',
    },
    'o4zhmsib': {
      'en': 'I Do Not Agree',
      'nl': '',
    },
    'njdflukp': {
      'en': 'I Agree',
      'nl': '',
    },
  },
  // Miscellaneous
  {
    '12kd952n': {
      'en': 'To record your answer, this app requires your permission',
      'nl': '',
    },
    '6d5vm7ia': {
      'en': 'This app requires permission to record your voice',
      'nl': '',
    },
    '43uy5db0': {
      'en': '',
      'nl': '',
    },
    'bnhffcgd': {
      'en': '',
      'nl': '',
    },
    'opikjxob': {
      'en': '',
      'nl': '',
    },
    'bslc6tnl': {
      'en': '',
      'nl': '',
    },
    '2mtoolv8': {
      'en': '',
      'nl': '',
    },
    'sed3l9v8': {
      'en': '',
      'nl': '',
    },
    '9q97n1bb': {
      'en': '',
      'nl': '',
    },
    '8txopctc': {
      'en': '',
      'nl': '',
    },
    'j8o6rc7p': {
      'en': '',
      'nl': '',
    },
    '6kl06ffd': {
      'en': '',
      'nl': '',
    },
    'h8aenvm1': {
      'en': '',
      'nl': '',
    },
    'cvxo6b1p': {
      'en': '',
      'nl': '',
    },
    'p2hjacva': {
      'en': '',
      'nl': '',
    },
    '9fpflczq': {
      'en': '',
      'nl': '',
    },
    'b7mb734w': {
      'en': '',
      'nl': '',
    },
    'wqbjm2wj': {
      'en': '',
      'nl': '',
    },
    'shmbuz5r': {
      'en': '',
      'nl': '',
    },
    'qlufx66n': {
      'en': '',
      'nl': '',
    },
    '9klasjp0': {
      'en': '',
      'nl': '',
    },
    'nnbzdijx': {
      'en': '',
      'nl': '',
    },
    'z3hfe4t9': {
      'en': '',
      'nl': '',
    },
    '8hvs6twy': {
      'en': '',
      'nl': '',
    },
    'ugkjqnhp': {
      'en': '',
      'nl': '',
    },
    '3ikpy3fn': {
      'en': '',
      'nl': '',
    },
    'bmutwcb9': {
      'en': '',
      'nl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
