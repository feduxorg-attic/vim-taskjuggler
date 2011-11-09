#!/usr/bin/env ruby
# encoding: utf-8

require 'thor'
require 'thor/group'
require 'open4'
require 'tmpdir'
require 'fileutils'
require 'find'


module Vim
  module TaskJuggler
    module Cli

      # Runs a command 
      def run(command, options = {})
        command.gsub!(/^\s+/, "")

        process_data = Hash.new
        pid, stdin, stdout, stderr = Open4::popen4(command)
        ignored, process_data[:status] = Process::waitpid2(pid)
        process_data[:stdout] = stdout.read
        process_data[:stderr] = stderr.read
        process_data[:ignore_exit_codes] = ((options[:ignore_exit_codes] || Array.new) << 0).uniq

        raise_if_command_failed!(command_name(command), process_data)
      end

      # checks if command exited with an error code -eq 0
      def raise_if_command_failed!(utility, process_data)
        unless process_data[:ignore_exit_codes].include?(process_data[:status].to_i)
          exception_string = "Failed to run \"#{ utility }\" on \"#{ RUBY_PLATFORM }\".\n\n" +
            "Exit code was:\n\n\s\s#{ process_data[:status].to_i }\n\n"
          exception_string << "STDOUT was:\n\n\s\s#{ process_data[:stdout].gsub("\n", "\n\s\s") }" unless process_data[:stdout].empty?
          exception_string << "STDERR was:\n\n\s\s#{ process_data[:stderr].gsub("\n", "\n\s\s") }" unless process_data[:stderr].empty?

          raise RuntimeError, exception_string
#        else
#          info_string = "Everything ran fine!\n\n"
#          info_string << "STDOUT was:\n\n\s\s#{ process_data[:stdout].gsub("\n", "\n\s\s") }" unless process_data[:stdout].empty?
#          puts info_string
        end
      end

      #normalize command name
      def command_name(command)
        command.slice(0, command.index(/\s/)).split('/')[-1]
      end
    end

  end
end

module Vim
  module TaskJuggler

    syntax_path=File.expand_path('syntax' , File.dirname(__FILE__))

    class Default < Thor
    end

    class Install < Thor
      include Cli

      desc "extension [PATH]" , "Install vim extension to path (Default ~/.vim/bundle.available/vim-taskjuggler)"
      def extension(remote_path = 'https://github.com/maxmeyer/vim-taskjuggler' , 
                    local_path = '~/.vim/bundle.available/vim-taskjuggler'
                   )
        local_path = File.expand_path(local_path)

        unless Dir.exists?(local_path)
          run("git clone #{remote_path} #{local_path}")
        else
          run("cd #{local_path}; git pull")
        end

      end

      desc "gem" ,  "Install taskjuggler gem"
      def gem
        run("gem install taskjuggler")
      end

      desc "syntax_file" , "Install new version of the vim syntax-file for taskjuggler"
      def syntax_file(extension_path = '~/.vim/bundle.available/vim-taskjuggler')

        extension_path = File.expand_path(extension_path)

        tmpdir = Dir.mktmpdir
        run("cd #{tmpdir}; gem fetch taskjuggler")

        result = Array.new
        Find.find(tmpdir) do |path|
          result << path if File.fnmatch('*.gem', path)
        end
        syntax_file = 'data/tjp.vim'

        run(%Q[tar -O -xf "#{result[0]}" data.tar.gz | tar -xz -C "#{tmpdir}" "#{syntax_file}"])

        unless Dir.exists?(extension_path)
          FileUtils.mkdir_p extension_path
        end

        FileUtils.cp "#{tmpdir}/#{syntax_file}" , File.join(extension_path,'syntax')
      end
    end

    Default.register(
      Install, 
      'install',
      'install [subcommand]',
      'install various things, e.g. gem, vim-extension, vim syntax file'
    )

  end
end
Vim::TaskJuggler::Default.start
