require 'tz_offset'

Awestruct::Extensions::Pipeline.new do
  extension Awestruct::Extensions::Posts.new( '/blog' )
  extension Awestruct::Extensions::TzOffset.new( :posts, -5 )
  extension Awestruct::Extensions::Paginator.new( :posts, '/index', :per_page => 5 )
  extension Awestruct::Extensions::Tagger.new( :posts, '/index', '/blog/tags', :per_page => 5 )
  #extension Awestruct::Extensions::TagCloud.new( :posts, 'blog/tags/index.html')
  extension Awestruct::Extensions::Atomizer.new( :posts, '/feed.atom' )
  extension Awestruct::Extensions::Disqus.new
  extension Awestruct::Extensions::Indexifier.new

  helper Awestruct::Extensions::Partial
  helper Awestruct::Extensions::GoogleAnalytics
end

