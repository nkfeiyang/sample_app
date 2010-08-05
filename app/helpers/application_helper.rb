# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title
    base_title = "Ruby on Rails Tutor Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{h(@title)}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end
end
