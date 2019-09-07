module UsersHelper

  def generate_gender_options
    genders = Firebase::Firestore::UserRepository::GENDERS
    options = ''
    genders.each_with_index do |gender, index|
      if current_user_gender == index
        options << "<option selected value='#{index}'>#{gender}</option>"
      else
        options << "<option value='#{index}'>#{gender}</option>"
      end
    end

    options.html_safe
  end
end
