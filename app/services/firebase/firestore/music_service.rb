module Firebase
  module Firestore
    class MusicService

      include RepositoryBase

      attr_reader :music_repository, :data

      def initialize(args)
        @data = args
        @music_repository = MusicRepository.new
      end

      def load_all_songs
        firestore_response = music_repository.load_all_songs(data[:user_id])
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response
      end

      private

      def format_data_to_update
        {

        }
      end
    end
  end
end