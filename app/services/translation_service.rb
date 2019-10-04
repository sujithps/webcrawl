require "google/cloud/translate"
require "google/cloud/language"

class TranslationService

  def translate(text, lang)
    translate = Google::Cloud::Translate.new

    translation = translate.translate text, to: lang

    translation.text
  end

  def tokenize_text(translated_text)
    language = Google::Cloud::Language.new

    response = language.analyze_entities content: translated_text, type: :PLAIN_TEXT

    entities = response.entities

    entities.group_by(&:type).map { |k, v| [k, v.map { |h| h['name'] }] }
  end
end
