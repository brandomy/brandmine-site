#!/bin/bash

echo "🔍 Comparing translation keys across en.yml, ru.yml, zh.yml..."

flatten_yaml_keys() {
  ruby -ryaml -e '
    def flatten(hash, prefix = "")
      flat = {}
      hash.each do |k, v|
        key = prefix.empty? ? k : "#{prefix}.#{k}"
        if v.is_a?(Hash)
          flat.merge!(flatten(v, key))
        else
          flat[key] = v
        end
      end
      flat
    end

    file = ARGV[0]
    data = YAML.load_file(file)
    flatten(data).each { |k, _| puts k }
  ' "$1"
}

EN_KEYS=$(flatten_yaml_keys _data/translations/en.yml)
RU_KEYS=$(flatten_yaml_keys _data/translations/ru.yml)
ZH_KEYS=$(flatten_yaml_keys _data/translations/zh.yml)

echo "$EN_KEYS" | sort > /tmp/en_keys.txt
echo "$RU_KEYS" | sort > /tmp/ru_keys.txt
echo "$ZH_KEYS" | sort > /tmp/zh_keys.txt

echo ""
echo "❗ Keys missing from ru.yml:"
comm -23 /tmp/en_keys.txt /tmp/ru_keys.txt

echo ""
echo "❗ Keys missing from zh.yml:"
comm -23 /tmp/en_keys.txt /tmp/zh_keys.txt

echo ""
echo "❗ Extra keys in ru.yml (not in en.yml):"
comm -13 /tmp/en_keys.txt /tmp/ru_keys.txt

echo ""
echo "❗ Extra keys in zh.yml (not in en.yml):"
comm -13 /tmp/en_keys.txt /tmp/zh_keys.txt

rm /tmp/en_keys.txt /tmp/ru_keys.txt /tmp/zh_keys.txt

echo ""
echo "✅ Translation comparison complete."
