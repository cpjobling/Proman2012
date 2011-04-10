module ViewHelpers
  def hello(name)
    "Hello #{name}!"
  end
  
  def link_to_with_highlight(name, options = {}, html_options = {}) # same sig as #link_to
    html_options.merge!({ :class => 'active' }) if current_page?(options)
    link_to(name, options, html_options)
  end
  
  # Generate a quotation suitable for a page slogan.
  def quotation_generator(quotation, citation = {})
    born = citation[:born] || '?'
    died = citation[:died] || '?'
    author = citation[:author] || 'Anonymous'
    dates = "#{born}&mdash;#{died}"
    cited_quotation = "&ldquo;#{h(quotation)}&rdquo; &ndash; #{h(author)}"
    if (dates == "?&mdash;?")
      return cited_quotation
    else
      return cited_quotation += " (#{dates})"
    end
  end
  
  # The Proman logo
  def proman
    return "<em>Proman<sup>&beta;</sup></em>"
  end
  
  # Title helper as described in RailsCast 30 (http://asciicasts.com/episodes/30-pretty-page-title)
  # Use as <%= title("Page title") %> in your templates.
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  # Slogan helper: similar to the title helper. Puts a witty slogan on the current page.
  # Use as <%= :slogan "Plagiarism is bad for your grade" %> in your templates.
  def slogan(page_slogan)
    content_for(:slogan) { page_slogan }
  end
  
  def current_page?(options)
    true
  end
  
  def blank?
    respond_to?(:empty?) ? empty? : !self # From rails API
  end
  
  def google_api_key
    return ""
  end
end
