class Dashboard::MusicsController < ApplicationController

  def index
    begin
      music_service = Firebase::Firestore::MusicService.new(user_id: current_user[:id])
      all_songs = music_service.load_all_songs
      @singles = all_songs[:singles]
      @albuns = all_songs[:albuns]
    rescue =>  error
      flash[:danger] = error.message
    end
  end

  def new
  end

  def create
    begin
      allowed_parameters = filter_params
      allowed_parameters.merge!(user_id: current_user[:id])
      music_service = Firebase::Firestore::MusicService.new(allowed_parameters)
      music_service.process_creation

      flash[:success] = I18n.t('dashboard.musics.messages.success_on_create')
    rescue =>  error
      flash[:danger] = error.message
    end

    redirect_to dashboard_musics_url
  end

  def edit
    begin
      music_params = { music_id: params[:id], user_id: current_user[:id] }
      music_service = Firebase::Firestore::MusicService.new(music_params)
      @song = music_service.load_song

      flash[:warning] = I18n.t('dashboard.musics.messages.alert_edit_music')
    rescue =>  error
      flash[:danger] = error.message
    end
  end

  def update
    begin
      allowed_parameters = filter_params
      allowed_parameters.merge!(user_id: current_user[:id])
      music_service = Firebase::Firestore::MusicService.new(allowed_parameters)
      music_service.process_update

      flash[:success] = I18n.t('dashboard.musics.messages.success_on_update')
    rescue =>  error
      flash[:danger] = error.message
    end

    redirect_to dashboard_musics_url
  end

  private

  def filter_params
    params.permit(:music_title, :music_file, :number_track, :image_cover, :music_id)
  end

end
