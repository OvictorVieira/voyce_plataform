module ApplicationHelper

  STATUSES = {
    success: 'Sucesso!',
    danger: 'Erro!',
    warning: 'Atenção!',
  }

  SOCIAL_MEDIA = [:facebook_url, :instagram_url, :twitter_url]
  INITIAL_NUMBER = 0

  def flash_message
    messages = ""
    [:success, :danger, :warning].each do |type|
      if flash[type]
        messages << "<div class=\"alert alert-#{type}\" role=\"alert\">
                       <strong>#{STATUSES[type]}</strong> #{flash[type]}
                     </div>"
      end
    end

    messages.html_safe
  end

  def select_background_header
    "team-#{rand(0..13)}.jpg"
  end

  def current_user_name
    current_user[:name].titleize
  end

  def current_user_complete_name
    current_user[:complete_name].titleize if current_user[:complete_name].present?
  end

  def current_user_email
    current_user[:email]
  end

  def current_user_phone
    current_user[:phone_number]
  end

  def current_user_age
    #current_user[:date_of_birth_timestamp].present?
  end

  def current_user_city
    current_user[:city].titleize if current_user[:city].present?
  end

  def current_user_state
    current_user[:state].titleize if current_user[:state].present?
  end

  def current_user_location
    current_user_city << ', ' << current_user_state
  end

  def current_user_biography
    current_user[:biography] if current_user[:biography].present?
  end

  def current_user_contact
    "#{I18n.t('dashboard.user_to_artist.fields.contact')}: #{current_user[:email]}"
  end

  def current_user_facebook_link
    current_user[:facebook_url] if current_user[:facebook_url].present?
  end

  def current_user_instagram_link
    current_user[:instagram_url] if current_user[:instagram_url].present?
  end

  def current_user_twitter_link
    current_user[:twitter_url] if current_user[:twitter_url].present?
  end

  def mount_data_target_modal(index)
    "data-toggle=modal data-target=#social-media-modal" unless current_user[SOCIAL_MEDIA[index]].present?
  end

  def current_user_image
    return current_user[:image] if current_user[:image].present?

    'new-user.jpg'
  end

  def quantity_followers
    return current_user[:followers] if current_user[:followers].present?

    INITIAL_NUMBER
  end

  def quantity_following
    return current_user[:following] if current_user[:following].present?

    INITIAL_NUMBER
  end

  def quantity_sponsors
    return current_user[:sponsors] if current_user[:sponsors].present?

    INITIAL_NUMBER
  end

  def quantity_sponsoring
    return current_user[:sponsoring] if current_user[:sponsoring].present?

    INITIAL_NUMBER
  end

  def quantity_listeners
    return current_user[:listeners] if current_user[:listeners].present?

    INITIAL_NUMBER
  end

  def current_user_gender
    current_user[:gender]
  end

end
