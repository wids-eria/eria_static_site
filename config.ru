require 'rack/rewrite'
use Rack::Rewrite do
  r301 %r{^([^\.]*[^\/])$}, '$1/' 
  r301 %r{^(.*\/)$}, '$1index.html'
end

use Rack::Static, 
  :urls => ["/", "/stylesheets", "/images"],
  :root => "public"

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    File.open('public/index.html', File::RDONLY)
  ]
}

