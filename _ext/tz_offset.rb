require 'tzinfo'

module Awestruct::Extensions

  class TzOffset
    def initialize(entries_key = :posts, tz = 'UTC')
      @offset_sec = TZInfo::Timezone.get(tz).period_for_local(Time.now()).utc_total_offset
      @entries_key = entries_key
    end

    def execute(site)
      entries = site.send(@entries_key) || []
      entries.each do |entry|
        entry.date = entry.date - @offset_sec
      end
    end
  end

end
