require 'kintama'
require 'yaml'
require_relative '../lib/objectification'

hash_fixture = Hash[YAML.load_file('fixtures/hash.yaml').sort]

context Objectification::FromHash do
  setup do
    @object = Objectification::FromHash.new hash_fixture
  end

  should 'not deform the original data' do
    assert_equal @object.to_h, hash_fixture
  end
end
