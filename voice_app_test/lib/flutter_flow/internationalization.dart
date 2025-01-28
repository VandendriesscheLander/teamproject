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
      'nl': 'Deel uw stem',
    },
    't8hifcjb': {
      'en': 'Tap to Record',
      'nl': 'Tik om op te nemen',
    },
    '0vq83vxu': {
      'en': 'Loading ...',
      'nl': 'Bezig met laden...',
    },
    'outov8hp': {
      'en': 'Back',
      'nl': 'Terug',
    },
    'wsm2u9qi': {
      'en': 'Next',
      'nl': 'Volgende',
    },
    '6n9ptg1t': {
      'en': 'Next',
      'nl': 'Volgende',
    },
  },
  // QuestionSpeechToText
  {
    'iayv63oi': {
      'en': 'Review Your Voice',
      'nl': 'Beoordeel uw stem',
    },
    'fjluloda': {
      'en': 'Click the text to edit, or record to add more text',
      'nl': 'Controleer en bewerk de getranscribeerde tekst indien nodig',
    },
    'dt5i27n3': {
      'en': 'Tap to Record',
      'nl': 'Tik om op te nemen',
    },
    'j6595oaz': {
      'en': 'Loading ...',
      'nl': 'Bezig met laden...',
    },
    '9dmk3mnj': {
      'en': 'Back',
      'nl': 'Terug',
    },
    'dalv83d6': {
      'en': 'Next',
      'nl': '',
    },
    'u97wilta': {
      'en': 'Next',
      'nl': '',
    },
    'ib8uyve2': {
      'en': 'Back',
      'nl': '',
    },
  },
  // ProbingQuestionRecordingPage1
  {
    'agohr1wr': {
      'en': 'Probing Question',
      'nl': 'Onderzoekende vraag',
    },
    'ar9t2e7z': {
      'en': 'Let\'s explore your thoughts further',
      'nl': 'Laten we uw gedachten verder onderzoeken',
    },
    'zfyh790f': {
      'en': 'Tap to Record',
      'nl': 'Tik om op te nemen',
    },
    '7fa6ig0n': {
      'en': 'Loading ...',
      'nl': 'Bezig met laden...',
    },
    'e6vef727': {
      'en': 'Back',
      'nl': 'Terug',
    },
    '1mxx1752': {
      'en': 'Next',
      'nl': 'Volgende',
    },
    'rive00as': {
      'en': 'Skip',
      'nl': 'Overslaan',
    },
  },
  // HomePage
  {
    'sfn01k3a': {
      'en': 'Welcome Back!',
      'nl': 'Welkom terug!',
    },
    'w8lo488t': {
      'en': 'Share your thoughts on today\'s community questions',
      'nl': 'Deel uw gedachten over de communityvragen van vandaag',
    },
    'eqwqyv4i': {
      'en': 'Local Education',
      'nl': 'Lokale educatie',
    },
    '0rati7su': {
      'en':
          'How can our schools better prepare students for future challenges?',
      'nl':
          'Hoe kunnen onze scholen leerlingen beter voorbereiden op de uitdagingen van de toekomst?',
    },
    'p3j30ztz': {
      'en': 'Community Safety',
      'nl': 'Veiligheid in de gemeenschap',
    },
    '930ytqev': {
      'en':
          'What initiatives would enhance safety and security in our neighborhood?',
      'nl':
          'Welke initiatieven zouden de veiligheid en beveiliging in onze buurt verbeteren?',
    },
    'xtlonu0u': {
      'en': 'Environmental Impact',
      'nl': 'Milieu-impact',
    },
    '9lo8gdji': {
      'en': 'How can we reduce our community\'s environmental footprint?',
      'nl':
          'Hoe kunnen we de ecologische voetafdruk van onze gemeenschap verkleinen?',
    },
    'vxiculrz': {
      'en': 'Local Business',
      'nl': 'Lokale bedrijven',
    },
    't0o39bmv': {
      'en': 'What support do small businesses need to thrive in our community?',
      'nl':
          'Welke ondersteuning hebben kleine bedrijven nodig om te kunnen floreren in onze gemeenschap?',
    },
  },
  // SummaryPage
  {
    'j0gopu3q': {
      'en': 'Summary',
      'nl': 'Samenvatting',
    },
    'xmc6bp4y': {
      'en': 'Review your responses before submitting',
      'nl': 'Controleer uw antwoorden voordat u ze indient',
    },
    'z0ei0fh9': {
      'en': 'Main Question',
      'nl': 'Hoofdvraag',
    },
    'b6cu6ntp': {
      'en': 'TextField',
      'nl': 'Tekstveld',
    },
    'f50r6nts': {
      'en': 'Button',
      'nl': '',
    },
    'mdhe4vg4': {
      'en': 'Probing Questions',
      'nl': 'Onderzoekende vragen',
    },
    'sxpukre3': {
      'en': '',
      'nl': '',
    },
    '76vgvkdj': {
      'en': 'No Answer Recorded',
      'nl': '',
    },
    'ocys503v': {
      'en': 'Button',
      'nl': '',
    },
    'gi9axzy3': {
      'en': '',
      'nl': '',
    },
    '0nxkwnf2': {
      'en': 'No Answer Recorded',
      'nl': 'Tekstveld',
    },
    'oazyy5w7': {
      'en': 'Button',
      'nl': '',
    },
    '7qieowx7': {
      'en': '',
      'nl': '',
    },
    'f5o9coyc': {
      'en': 'No Answer Recorded',
      'nl': 'Tekstveld',
    },
    'qyxtqro4': {
      'en': 'Button',
      'nl': '',
    },
    'chuyif19': {
      'en': 'Back',
      'nl': 'Terug',
    },
    'otm83xrm': {
      'en': 'Submit',
      'nl': 'Verzenden',
    },
  },
  // ProbingQuestionRecordingPage2
  {
    '4lqbied7': {
      'en': 'Probing Question',
      'nl': 'Onderzoekende vraag',
    },
    '5l74bn8t': {
      'en': 'Let\'s explore your thoughts further',
      'nl': 'Laten we uw gedachten verder onderzoeken',
    },
    'xu590sfz': {
      'en': 'Tap to Record',
      'nl': 'Tik om op te nemen',
    },
    '838gh2mk': {
      'en': 'Loading ...',
      'nl': 'Bezig met laden...',
    },
    'ugej1j4a': {
      'en': 'Back',
      'nl': 'Terug',
    },
    's5io63yv': {
      'en': 'Next',
      'nl': 'Volgende',
    },
    'lkbidnnn': {
      'en': 'Skip',
      'nl': 'Overslaan',
    },
  },
  // ProbingQuestionRecordingPage3
  {
    '7wp794cn': {
      'en': 'Probing Question',
      'nl': 'Onderzoekende vraag',
    },
    'ou3sivw8': {
      'en': 'Let\'s explore your thoughts further',
      'nl': 'Laten we uw gedachten verder onderzoeken',
    },
    'ie7rvosw': {
      'en': 'Tap to Record',
      'nl': 'Tik om op te nemen',
    },
    'oe5do581': {
      'en': 'Loading ...',
      'nl': 'Bezig met laden...',
    },
    'jmenqzkl': {
      'en': 'Back',
      'nl': 'Terug',
    },
    'sxxf9p2k': {
      'en': 'Next',
      'nl': 'Volgende',
    },
    'wv8q5i6g': {
      'en': 'Skip',
      'nl': 'Overslaan',
    },
  },
  // ConcentPopUp
  {
    'p3r7kdx6': {
      'en': 'Consent',
      'nl': 'Toestemming',
    },
    'tbimbb0p': {
      'en':
          'Thank you for considering participation in our survey. Before proceeding, please review the following information:\n\nPurpose of the Survey:\nThe data collected will be analyzed by experts to provide valuable insights.\n\nData Privacy:\nYour responses will be anonymized using advanced AI techniques, ensuring your privacy. Information such as your name or location will be redacted to [NAME] and [LOCATION].\n\nData Usage:\nThe collected data will be used solely for analytics purposes and will not be shared with third parties or used beyond the scope of this survey.\n\nBy clicking \"I Agree\", you confirm that you have read, understood, and consent to the terms outlined above. If you have any questions, feel free to contact us at [contact information].\n\n[I Do Not Agree] | [I Agree]',
      'nl':
          'Bedankt dat u overweegt deel te nemen aan onze enquête. Lees de volgende informatie door voordat u verdergaat:\n\nDoel van de enquête:\nDe verzamelde gegevens worden geanalyseerd door experts om waardevolle inzichten te bieden.\n\nGegevensprivacy:\nUw antwoorden worden geanonimiseerd met behulp van geavanceerde AI-technieken, waardoor uw privacy wordt gewaarborgd. Informatie zoals uw naam en locatie worden verborgen naar [NAAM] en [LOCATIE].\n\nGegevensgebruik:\nDe verzamelde gegevens worden uitsluitend gebruikt voor analysedoeleinden en worden niet gedeeld met derden of gebruikt buiten het bereik van deze enquête.\n\nDoor op \"Ik ga akkoord\" te klikken, bevestigt u dat u de hierboven beschreven voorwaarden hebt gelezen, begrepen en ermee instemt. Als u vragen hebt, kunt u contact met ons opnemen via [contactgegevens].\n\n[Ik ga niet akkoord] | [Ik ga akkoord]',
    },
    'o4zhmsib': {
      'en': 'I Do Not Agree',
      'nl': 'Ik ben er niet mee eens',
    },
    'njdflukp': {
      'en': 'I Agree',
      'nl': 'Ik ga akkoord',
    },
  },
  // Miscellaneous
  {
    '12kd952n': {
      'en': 'To record your answer, this app requires your permission',
      'nl': 'Om uw antwoord op te nemen, heeft deze app uw toestemming nodig',
    },
    '6d5vm7ia': {
      'en': 'This app requires permission to record your voice',
      'nl': 'Deze app heeft toestemming nodig om uw stem op te nemen',
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
