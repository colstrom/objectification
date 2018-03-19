
# -*- ruby -*-

module Objectification
  VERSION = $LOADED_FEATURES
              .map { |f| f.match %r{/objectification-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+(\.pre)?)} }
              .compact
              .map { |gem| gem['version'] }
              .uniq
              .first
end
