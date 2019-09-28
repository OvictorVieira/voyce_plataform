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
          fail(message: GetMusicError)
        end
      end

      def create_music(user_id, data)
        begin
          songs = firestore_base.col(END_POINT).doc(user_id).col(SINGLES_COLLECTION_TYPE)
          songs.add(data)

          success
        rescue => error
          fail
        end
      end

      private

      def get_singles(user_songs)
        user_songs.col(SINGLES_COLLECTION_TYPE).get
      end

      def get_albuns(user_songs)
        user_songs.col(ALBUNS_COLLECTION_TYPE).get
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