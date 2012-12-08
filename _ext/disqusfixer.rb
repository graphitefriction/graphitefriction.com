require 'digest/sha1'

module Awestruct::Extensions
  class DisqusFixer
    def execute(site)
      site.pages.each{ |p| p.extend DisqusFixer }
    end
    module DisqusFixer
      def resolve_disqus_identifier()
        self.disqus_identifier ? self.disqus_identifier : Digest::SHA1.hexdigest(self.date.strftime('%Y-%m-%d-') + self.slug)
      end
    end
  end
end
