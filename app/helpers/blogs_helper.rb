module BlogsHelper
  def url_confirm
    if action_name == 'new' || action_name == 'create'
      confirm_blogs_path
    elsif action_name == 'edit'
      confirm_blog_path
    end
  end

  def method_confirm
    if action_name == 'new' || action_name == 'create'
      "post"
    elsif action_name == 'edit'
      "patch"
    end
  end
end