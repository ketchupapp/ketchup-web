module ApplicationHelper
  def cdn_image_tag(url, **kwargs)
    if Rails.env.production?
      cl_image_tag url, **kwargs.merge(type: "fetch")
    else
      image_tag url, **kwargs
    end
  end

  def nav_link(*args, **kwargs, &block)
    kwargs[:class] ||= ""
    kwargs[:class] += "f6 f5-ns display-inlineblock marginleft-small marginright-none"
    link_to *args, **kwargs, &block
  end
end
