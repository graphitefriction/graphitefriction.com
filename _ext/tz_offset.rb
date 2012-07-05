require 'tzinfo'

module Awestruct::Extensions

  class TzOffset
    def initialize(entries_key = :posts, tz = 'UTC', supplamental_offset = 0)
      @tz_offset_sec = TZInfo::Timezone.get(tz).period_for_local(Time.now()).utc_total_offset
      @supplamental_offset_sec = supplamental_offset * 3600
      @entries_key = entries_key
    end

    def execute(site)
      entries = site.send(@entries_key) || []
      entries.each do |entry|
        entry.date = entry.date - @tz_offset_sec + @supplamental_offset_sec
      end
    end
  end

end
