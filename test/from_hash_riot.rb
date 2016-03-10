require 'riot'
require 'yaml'
require_relative '../lib/objectification'

hash_fixture = Hash[YAML.load_file('fixtures/hash.yaml').sort]

context Objectification::FromHash do
  setup { Objectification::FromHash.new hash_fixture }
  asserts(:to_h).equals(hash_fixture)
end
