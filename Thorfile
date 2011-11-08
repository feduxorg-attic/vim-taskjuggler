require 'rugged'

module Vim::TaskJuggler

  syntax_path=File.expand_path('syntax' , File.dirname(__FILE__))

  class Repository
    attr_accessor :remote_path, :local_path

    def initialize(remote_path = 'https://github.com/taskjuggler/TaskJuggler.git' ,
                   local_path='.' 
                  )
      @remote_path = remote_path
      @local_path  = local_path
    end

    def fetch
      repo = Rugged::Repository.new(@local_path)
      rem = Rugged::Remote.new(repo)
      summry = rem.fetch([refs])

    end


  end

  class Default < Thor

    desc 'fetch', 'Fetch syntax file from taskjuggler repository'
    def fetch
    end
  end

  Vim::TaskJuggler::Default.register(
   Vim::TaskJuggler::Install, 
    'install',
    'install [subcommand]',
    'install various things, e.g. gem, vim-extension'
  )

  class Install < Thor
    desc "extension [PATH]" , "Install vim extension to path (Default ~/.vim/bundle.available/vim-taskjuggler)"
    def extension(path=File.expand_path'(~/.vim/bundle.available/vim-taskjuggler')

    end

    desc "gem" , 
    def gem

    end
  end

  class Fetch < Thor
  end
end
