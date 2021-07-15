module ApplicationHelper
  def ex_image_tag(source, options={})
    if source.is_a? ActiveStorage::Attached
      if Rails.application.config.active_storage.service == :cloudinary
        # key is public_id of cloudinary
        return cl_image_tag(source.key, **options)
      end
    end
      
    image_tag(source, **options)
  end
end
