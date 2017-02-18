module MarkdownHelper
  require 'redcarpet'
  require 'coderay'
  require 'diffy'

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      lang = case language.to_s
             when 'rb' then 'ruby'
             when 'yml' then 'yaml'
             when 'css' then 'css'
             when 'html' then 'html'
             when '' then 'md'
             else language
             end
      CodeRay.scan(code, lang).div
    end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true,
      hard_wrap: true,
      xhtml: true,
      lax_html_blocks: true,
      strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text).html_safe # rubocop:disable Rails/OutputSafety
  end

  def diff_for(before, after)
    Diffy::SplitDiff.new(before, after, format: :html, :include_plus_and_minus_in_html => true).right.html_safe
    #Diffy::Diff.new(before, after, :include_plus_and_minus_in_html => true).to_s(:html_simple).html_safe
  end
end
