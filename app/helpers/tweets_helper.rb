module TweetsHelper
  def render_with_tags(content)
    content.gsub(/#\w+/){|word| link_to word, "/search?content=#{word.delete('#')}"}.html_safe
  end
end
