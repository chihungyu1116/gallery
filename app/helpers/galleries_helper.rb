module GalleriesHelper
  def get_fake_id
    num = DateTime.now.strftime('%Q') + rand(1000).to_s
    Digest::MD5.hexdigest num
  end

  def get_fake_galleries
    galleries = []

    (1..16).each do |i|
      gallery = {
        title:        'cool dog',
        img:          'dog/Cool-Dog-480x640.jpg',
        link_like:    'path/facebook',
        link_twit:    'path/twit',
        link_profile: '/gallery/Cool-Dog-480x640',
        id:            get_fake_id
      }

      galleries << gallery
    end

    galleries
  end
end
