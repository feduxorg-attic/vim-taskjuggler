module Vim::TaskJuggler

  syntax_path=File.expand_path('syntax' , File.dirname(__FILE__))

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
    def extension(remote_path = 'https://github.com/taskjuggler/TaskJuggler.git' , 
                  local_path = File.expand_path'(~/.vim/bundle.available/vim-taskjuggler')
                 )
      sh "git clone #{remote_path} #{local_path}"
    end

    desc "gem" ,  "Install taskjuggler gem"
    def gem
      sh "gem install taskjuggler"
    end
  end

  class Fetch < Thor
  end
end

Vim::TaskJuggler::Default.start
