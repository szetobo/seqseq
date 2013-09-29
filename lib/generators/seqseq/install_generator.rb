module Seqseq
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)
      argument :model_name, :type => :string, :default => 'AutoSequence'

      desc 'Install seqseq migration & model files'

      def self.next_migration_number(path)
        Time.now.utc.strftime('%Y%m%d%H%M%S')
      end

      def create_files
        template "seqseq.rb", "app/models/#{file_name}.rb"
        migration_template 'install_seqseq.rb', 'db/migrate/install_seqseq.rb'
      end

      private

      def file_name
        model_name.underscore
      end

      def model_class
        model_name.classify
      end

      def table_name
        model_name.tableize
      end
    end
  end
end
