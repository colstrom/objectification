module Hash_hmap
  refine Hash do
    def hmap(&block)
      Hash[self.map { |k,v| block.call k,v }]
    end
  end
end
