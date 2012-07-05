module Awestruct::Extensions

  class TzOffset
    def initialize(entries_key = :posts, offset = 0)
      @offset = offset
      @entries_key = entries_key
    end

    def execute(site)
      entries = site.send(@entries_key) || []
      entries.each do |entry|
        entry.date = entry.date - (@offset * 3600)
      end
    end
  end

end
