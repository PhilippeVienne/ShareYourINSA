module ApplicationHelper

  def comments_for(post)
    render partial: 'application/comments', locals: {post:post}
  end

  # Following code come from https://github.com/bootstrap-ruby/bootstrap-navbar

  def navbar_item(text, url = nil, list_item_options = nil, link_options = nil, &block)
    text, url, list_item_options, link_options = capture(&block), text, url, list_item_options if block_given?
    url               ||= '#'
    list_item_options   = list_item_options.nil? ? {} : list_item_options.dup
    link_options        = link_options.nil?      ? {} : link_options.dup
    list_item_css_classes = [].tap do |css_classes|
      css_classes << 'active' if current_url_or_sub_url?(url)
      css_classes << list_item_options.delete(:class) if list_item_options.has_key?(:class)
    end
    list_item_attributes = attributes_for_tag(
        { class: list_item_css_classes.join(' ') }
            .delete_if { |k, v| v.empty? }
            .merge(list_item_options)
    )
    link_attributes = attributes_for_tag(link_options)
    prepare_html <<-HTML.chomp!
<li#{list_item_attributes}>
  <a href="#{url}"#{link_attributes}>
    #{text}
  </a>
</li>
    HTML
  end

  private

  def attributes_for_tag(hash)
    string = hash.map { |k, v| %(#{k}="#{v}") }.join(' ')
    if string.length > 0
      ' ' << string
    else
      string
    end
  end

  def current_url_or_sub_url?(url)
    return false if url == '#'
    uri, current_uri = [url, current_url].map do |url|
      URI.parse(url)
    end
    return false if uri.is_a?(URI::MailTo) || (!uri.host.nil? && uri.host != current_uri.host)
    normalized_path, normalized_current_path = [uri, current_uri].map do |uri|
      uri.path.sub(%r(/\z), '')
    end
    if normalized_path.empty?
      normalized_current_path.empty?
    else
      normalized_current_path =~ %r(\A#{Regexp.escape(normalized_path)}(/.+)?\z)
    end
  end

  def current_url
    request.url
  end

  def prepare_html(html)
    html.html_safe
  end

end
