Summary
-------

Strips the extension from the requested path (`env['PATH_INFO']`), casts it to
media type, and prepends it to `env['HTTP_ACCEPT']`. This allows dealing with path
information separately from format information, which are often different
concerns.

This is especially useful when dealing with routes as it allows a resource to
always point to the same action independently of the requested format.

Usage
-----

    require 'rack'
    require 'rack/abstract_format'

    use Rack::AbstractFormat
    run app

The request:

    GET /path/resource.xml
    Accept: text/html

will become:

    GET /path/resource
    env['HTTP_ACCEPT'] #=> 'application/xml,text/html'

AbstractFormat also accepts an optional argument, used to set the default
format that should be assumed when none is specified on the URL:

    use Rack::AbstractFormat, 'text/html'
    #=> GET /path/resource      # requested
    #=> GET /path/resource.html # assumed

Tip
---

The abstracted media type can then be easily retrieved with the
[Rack::AcceptMediaTypes][1] convenience middleware, which parses `env['HTTP_ACCEPT']`.

    request.accept_media_types          #=> ['application/xml', 'text/html']
    request.accept_media_types.prefered #=>  'application/xml'

See Also
--------

* [rack-accept-media-types][1]
* [simple_router][2]
* [rack-respond_to][3]

Links
-----

* code: <http://github.com/mynyml/rack-abstract-format>
* docs: <http://rdoc.info/projects/mynyml/rack-abstract-format>
* wiki: <http://wiki.github.com/mynyml/rack-abstract-format>
* bugs: <http://github.com/mynyml/rack-abstract-format/issues>


[1]: http://github.com/mynyml/rack-accept-media-types
[2]: http://github.com/mynyml/simple_router
[3]: http://github.com/mynyml/rack-respond_to

