require 'awestruct_ext'
require 'bootstrap-sass'

Awestruct::Extensions::Pipeline.new do
  engine = Engine.instance

  helper Awestruct::Extensions::Partial
  helper Awestruct::Extensions::GoogleAnalytics

  extension Awestruct::Extensions::Posts.new '/blog', :posts, nil, nil, :default_layout => 'post'
#  extension Awestruct::Extensions::TzOffset.new :posts, 'America/New_York', 9.5
  extension Awestruct::Extensions::Paginator.new :posts, '/index', :per_page => (engine.development? ? 50 : 5)
  unless engine.development?
    extension Awestruct::Extensions::Tagger.new :posts, '/index', '/blog/tags', :per_page => 5
  end
  #extension Awestruct::Extensions::TagCloud.new :posts, 'blog/tags/index.html'
  # Indexifier *must* come before Atomizer
  extension Awestruct::Extensions::Indexifier.new
  unless engine.development?
    extension Awestruct::Extensions::Atomizer.new :posts, '/feed.atom', :template => '_layouts/feed.atom.haml'
    extension Awestruct::Extensions::Disqus.new
  end

  #transformer Awestruct::Extensions::Minify.new( [:js] )
end
