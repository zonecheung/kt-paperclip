module Paperclip
  class HttpUrlProxyAdapter < UriAdapter
    def self.register
      Paperclip.io_adapters.register self do |target|
        String === target && target =~ REGEXP
      end
    end

    REGEXP = /\Ahttps?:\/\//.freeze

    def initialize(target, options = {})
      escaped = CGI.escape(target)
      super(URI(target == CGI.unescape(target) ? escaped : target), options)
    end
  end
end
