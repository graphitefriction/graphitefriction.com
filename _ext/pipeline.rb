require 'erubis'

Awestruct::Extensions::Pipeline.new do
  extension Awestruct::Extensions::Posts.new( '/blog' )
#  extension Awestruct::Extensions::TzOffset.new( :posts, 'America/New_York', 9.5 )
  extension Awestruct::Extensions::Paginator.new( :posts, '/index', :per_page => 5 )
  extension Awestruct::Extensions::Tagger.new( :posts, '/index', '/blog/tags', :per_page => 5 )
  #extension Awestruct::Extensions::TagCloud.new( :posts, 'blog/tags/index.html')
  # Indexifier *must* come before Atomizer
  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Atomizer.new( :posts, '/feed.atom', :template => '_layouts/feed.atom.haml' )
  extension Awestruct::Extensions::Disqus.new

  #transformer Awestruct::Extensions::Minify.new( [:js] )

  helper Awestruct::Extensions::Partial
  helper Awestruct::Extensions::GoogleAnalytics
end
