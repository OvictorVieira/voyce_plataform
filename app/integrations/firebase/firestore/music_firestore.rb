module Firebase
  module Firestore
    class MusicFirestore

      include Formatters::ResponseFormatter

      END_POINT = 'musics'.freeze
      SINGLES_COLLECTION_TYPE = 'singles'.freeze
      ALBUNS_COLLECTION_TYPE = 'albuns'.freeze

      attr_reader :firestore_base

      def initialize
        @firestore_base = FirestoreBase.new.firestore
      end

      def load_all_songs(user_id)
        begin
          songs = firestore_base.col(END_POINT).doc(user_id)
          singles = get_singles(songs)
          albuns = get_albuns(songs)
          success.merge!(singles_and_albuns(singles, albuns))
        rescue => error
          fail(message: GetMusicsError)
        end
      end

      def load_song(user_id, music_id)
        begin
          song = firestore_base.col(END_POINT).doc(user_id).col(SINGLES_COLLECTION_TYPE).doc(music_id)
          success.merge!(music: song.get)
        rescue => error
          fail(message: GetMusicsError)
        end
      end

      def create_music(user_id, data)
        begin
          songs = firestore_base.col(END_POINT).doc(user_id).col(SINGLES_COLLECTION_TYPE)
          songs.add(data)

          success
        rescue => error 
          fail(message: CreateMusicsError)
        end
      end

      def update_music(user_id, music_id, data)
        begin
          song = firestore_base.col(END_POINT).doc(user_id).col(SINGLES_COLLECTION_TYPE).doc(music_id)
          song.update(data)

          success
        rescue => error
          fail(message: UpdateMusicError)
        end
      end

      private

      def get_singles(user_songs)
        user_songs.col(SINGLES_COLLECTION_TYPE).order("sequence").get
      end

      def get_albuns(user_songs)
        user_songs.col(ALBUNS_COLLECTION_TYPE).order("sequence").get
      end

      def singles_and_albuns(singles, albuns)
        {
          singles: singles,
          albuns: albuns
        }
      end

    end
  end
end