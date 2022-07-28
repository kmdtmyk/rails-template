# frozen_string_literal: true

if defined? Autodoc
  Autodoc.configuration.path = 'docs'
  # Autodoc.configuration.toc = true
  # Autodoc.configuration.toc_html = true
  # Autodoc.configuration.template = File.read(File.expand_path("../autodoc/templates/document.md.erb", __FILE__))
  Autodoc.configuration.template = File.read(Rails.root.join('config/autodoc/document.md.erb'))
  # Autodoc.configuration.document_path_from_example = -> (example) do
  #   example.file_path.gsub(%r<\./spec/requests/api/(.+)_spec\.rb>, '\1.md')
  # end
  Autodoc.configuration.suppressed_request_header = %w(
    Accept
    Content-Length
    Host
    User-Agent
    Version
  )
  Autodoc.configuration.suppressed_response_header = %w(
    Cache-Control
    ETag
    Referrer-Policy
    X-Content-Type-Options
    X-Download-Options
    X-Frame-Options
    X-Permitted-Cross-Domain-Policies
    X-Rack-Dev-Mark-Env
    X-Request-Id
    X-Runtime
    X-XSS-Protection
  )
end
