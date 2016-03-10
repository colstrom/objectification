module Hash_hmap
  refine Hash do
    def hmap(&block)
      Hash[self.map { |k,v| block.call k,v }]
    end
  end
end

module Hash_types
  refine Hash do
    using Hash_hmap

    def types
      self.hmap { |k, v| [k, v.class.name] }
    end
  end
end
