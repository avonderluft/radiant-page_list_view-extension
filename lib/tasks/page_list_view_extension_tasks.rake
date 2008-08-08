namespace :radiant do
  namespace :extensions do
    namespace :page_list_view do
      
      desc "Runs the migration of the Page List View extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          PageListViewExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          PageListViewExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Page List View to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[PageListViewExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(PageListViewExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
