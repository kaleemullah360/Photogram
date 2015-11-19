class Post < ActiveRecord::Base  
  include Rails.application.routes.url_helpers

    validates :image, presence: true

      has_attached_file :image, styles: { :medium => "640x", thumb: "100x100#" } # # means crop the image
        validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def image_url
   relative_path =  image.url(:medium)
   self.add_host_prefix relative_path
  end

 def thumb_url
   relative_path = image.url(:thumb)
   self.add_host_prefix relative_path
 end

  def add_host_prefix(url)
    URI.join(root_url, url).to_s
  end
end  
