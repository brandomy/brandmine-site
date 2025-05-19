require 'yaml'

def extract_keys_with_lines(file_path)
  lines = File.readlines(file_path)
  keys = {}
  stack = []

  lines.each_with_index do |line, idx|
    next unless line.is_a?(String)
    line = line.rstrip
    next if line.start_with?('#') || line.empty?

    if line =~ /^([^\s#][^:]*):/
      indent = line[/^\s*/].size
      key = $1.strip

      while !stack.empty? && stack.last[:indent] >= indent
        stack.pop
      end

      parent = stack.map { |s| s[:key] }.join('.')
      full_key = parent.empty? ? key : "#{parent}.#{key}"
      keys[full_key] = idx + 1

      stack.push({ key: key, indent: indent })
    end
  end

  keys
end

files = {
  en: "_data/translations/en.yml",
  ru: "_data/translations/ru.yml",
  zh: "_data/translations/zh.yml"
}

keys_by_file = files.transform_values { |path| extract_keys_with_lines(path) }
all_keys = keys_by_file.values.map(&:keys).flatten.uniq.sort

puts "key,en.yml,ru.yml,zh.yml"
all_keys.each do |key|
  row = [key]
  files.each_key do |lang|
    row << (keys_by_file[lang][key] ? keys_by_file[lang][key] : "❌ missing")
  end
  puts row.join(",")
end
