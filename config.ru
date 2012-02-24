use Rack::Static, 
  :urls => ["/", "/stylesheets", "/images"],
  :root => ""
run lambda{ |env| [ 404, { 'Content-Type'  => 'text/html' }, ['404 - page not found'] ] }
