module ApplicationHelper
  def cdn_image_tag(url, **kwargs)
    if Rails.env.production?
      cl_image_tag url, **kwargs.merge(type: "fetch")
    else
      image_tag url, **kwargs
    end
  end
end
