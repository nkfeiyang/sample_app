module MicropostsHelper
  
  def display(content)
    auto_link(sanitize(content))
  end
  
  def wrap(content)
    content.split.map{ |s| wrap_long_string(s) }.join(' ')
  end
  
  private
    def wrap_long_string(text, max_width = 46)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text:
                                  text.scan(regex).join(zero_width_space)
    end
end