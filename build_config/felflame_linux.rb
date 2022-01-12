MRuby::Build.new do |conf|
  # load specific toolchain settings
  #conf.toolchain
  conf.toolchain :clang

  # Use mrbgems
  disable_lock # disables being stuck on a single commit
  # conf.gem 'examples/mrbgems/ruby_extension_example'
  # conf.gem 'examples/mrbgems/c_extension_example' do |g|
  #   g.cc.flags << '-g' # append cflags in this gem
  # end
  # conf.gem 'examples/mrbgems/c_and_ruby_extension_example'
  # conf.gem :core => 'mruby-eval'
  # conf.gem :mgem => 'mruby-onig-regexp'
  # conf.gem :github => 'mattn/mruby-onig-regexp'
  conf.gem :core => 'mruby-bin-mirb'
  conf.gem :git => 'git@github.com:realtradam/sample-mruby-gem.git', :branch => 'test', :options => '-v'

  # include the GEM box
  conf.gembox 'default'

  # C compiler settings
  conf.cc do |cc|
    cc.command = 'zig cc -target native'
    cc.include_paths = ["#{root}/include", '../raylib/src']
    #   cc.command = ENV['CC'] || 'gcc'
    #   cc.flags = [ENV['CFLAGS'] || %w()]
    #   cc.include_paths = ["#{root}/include"]
    #   cc.defines = %w()
    #   cc.option_include_path = %q[-I"%s"]
    #   cc.option_define = '-D%s'
    #   cc.compile_options = %Q[%{flags} -MMD -o "%{outfile}" -c "%{infile}"]
  end

  # mrbc settings
  # conf.mrbc do |mrbc|
  #   mrbc.compile_options = "-g -B%{funcname} -o-" # The -g option is required for line numbers
  # end



  # Linker settings
  conf.linker do |linker|
    #  linker.command = ENV['LD'] || 'gcc'
    linker.command = 'zig cc -target native'
    linker.flags = ['-lraylib -lGL -lm -lpthread -ldl -lrt -lX11']
    linker.library_paths = ['../raylib_lib_files']
    #   linker.flags_before_libraries = []
    #   linker.libraries = %w()
    #   linker.flags_after_libraries = []
    #   linker.library_paths = []
    #   linker.option_library = '-l%s'
    #   linker.option_library_path = '-L%s'
    #   linker.link_options = %Q[%{flags} -o "%{outfile}" %{objs} %{libs}]
  end

  conf.cxx.command = 'zig c++ -target native'

  # Archiver settings
  # conf.archiver do |archiver|
  #   archiver.command = ENV['AR'] || 'ar'
  #   archiver.archive_options = 'rs "%{outfile}" %{objs}'
  # end

  # Parser generator settings
  # conf.yacc do |yacc|
  #   yacc.command = ENV['YACC'] || 'bison'
  #   yacc.compile_options = %q[-o "%{outfile}" "%{infile}"]
  # end

  # gperf settings
  # conf.gperf do |gperf|
  #   gperf.command = 'gperf'
  #   gperf.compile_options = %q[-L ANSI-C -C -p -j1 -i 1 -g -o -t -N mrb_reserved_word -k"1,3,$" "%{infile}" > "%{outfile}"]
  # end

  # file extensions
  # conf.exts do |exts|
  #   exts.object = '.o'
  #   exts.executable = '' # '.exe' if Windows
  #   exts.library = '.a'
  # end

  # file separator
  # conf.file_separator = '/'

  # Turn on `enable_debug` for better debugging
  # conf.enable_debug
  conf.enable_bintest
  conf.enable_test
end
=begin
MRuby::CrossBuild.new("tux") do |conf|
  conf.toolchain :clang

  # Use mrbgems
  disable_lock # disables being stuck on a single commit
  # conf.gem 'examples/mrbgems/ruby_extension_example'
  # conf.gem 'examples/mrbgems/c_extension_example' do |g|
  #   g.cc.flags << '-g' # append cflags in this gem
  # end
  # conf.gem 'examples/mrbgems/c_and_ruby_extension_example'
  # conf.gem :core => 'mruby-eval'
  # conf.gem :mgem => 'mruby-onig-regexp'
  # conf.gem :github => 'mattn/mruby-onig-regexp'
  conf.gem :core => 'mruby-bin-mirb'
  conf.gem :git => 'git@github.com:realtradam/sample-mruby-gem.git', :branch => 'test', :options => '-v'

  # include the GEM box
  #conf.gembox 'default'
  conf.gembox "stdlib"
  conf.gembox "stdlib-ext"

  #conf.gembox "stdlib-io"
  # Use standard print/puts/p
  conf.gem :core => "mruby-print"
  # Use standard IO/File class
  conf.gem :core => "mruby-socket"
  # Use standard IO/File class
  conf.gem :core => "mruby-io"

  conf.gembox "math"
  conf.gembox "metaprog"
  # Generate mrbc command
  conf.gem :core => "mruby-bin-mrbc"
  # Generate mirb command
  conf.gem :core => "mruby-bin-mirb"
  # Generate mruby command
  conf.gem :core => "mruby-bin-mruby"
  # Generate mruby-strip command
  conf.gem :core => "mruby-bin-strip"
  # Generate mruby-config command
  conf.gem :core => "mruby-bin-config"


  conf.cc do |cc|
    cc.command = 'zig cc -target x86_64-linux-gnu'
    cc.include_paths = ["#{root}/include", '../raylib/src']
  end


  conf.linker do |linker|
    linker.command = 'zig cc -target x86_64-linux-gnu'
    linker.flags = ['-lraylib -lOpenGL -lrt -ldl -lm -X11 -lpthread' ]
    linker.library_paths = ['../raylib_lib_files']
  end

  conf.cxx.command = "zig c++ -target x86_64-linux-gnu"
end
=end
MRuby::CrossBuild.new("win") do |conf|
  conf.toolchain :clang

  # Use mrbgems
  disable_lock # disables being stuck on a single commit
  # conf.gem 'examples/mrbgems/ruby_extension_example'
  # conf.gem 'examples/mrbgems/c_extension_example' do |g|
  #   g.cc.flags << '-g' # append cflags in this gem
  # end
  # conf.gem 'examples/mrbgems/c_and_ruby_extension_example'
  # conf.gem :core => 'mruby-eval'
  # conf.gem :mgem => 'mruby-onig-regexp'
  # conf.gem :github => 'mattn/mruby-onig-regexp'
  conf.gem :core => 'mruby-bin-mirb'
  conf.gem :git => 'git@github.com:realtradam/sample-mruby-gem.git', :branch => 'test', :options => '-v'

  # include the GEM box
  #conf.gembox 'default'
  conf.gembox "stdlib"
  conf.gembox "stdlib-ext"

  #conf.gembox "stdlib-io"
  # Use standard print/puts/p
  conf.gem :core => "mruby-print"
  # Use standard IO/File class
  #conf.gem :core => "mruby-socket"
  # Use standard IO/File class
  conf.gem :core => "mruby-io"

  conf.gembox "math"
  conf.gembox "metaprog"
  # Generate mrbc command
  conf.gem :core => "mruby-bin-mrbc"
  # Generate mirb command
  conf.gem :core => "mruby-bin-mirb"
  # Generate mruby command
  conf.gem :core => "mruby-bin-mruby"
  # Generate mruby-strip command
  conf.gem :core => "mruby-bin-strip"
  # Generate mruby-config command
  conf.gem :core => "mruby-bin-config"


  conf.host_target = "x86_64-w64-mingw32"

  conf.cc do |cc|
    cc.command = 'zig cc -target x86_64-windows-gnu'
    cc.include_paths = ["#{root}/include", '../raylib/src']
  end


  conf.linker do |linker|
    linker.command = 'zig cc -target x86_64-windows-gnu'
    linker.flags = ['-lraylib -lwinmm -lgdi32 -lopengl32' ]
    linker.library_paths = ['../raylib_lib_files']
  end

  conf.cxx.command = "zig c++ -target x86_64-windows-gnu"
end
MRuby::CrossBuild.new("web") do |conf|
  @project_root = '/home/tradam/Documents/FelFlameEngine'
  conf.toolchain :clang

  # Use mrbgems
  disable_lock # disables being stuck on a single commit
  # conf.gem 'examples/mrbgems/ruby_extension_example'
  # conf.gem 'examples/mrbgems/c_extension_example' do |g|
  #   g.cc.flags << '-g' # append cflags in this gem
  # end
  # conf.gem 'examples/mrbgems/c_and_ruby_extension_example'
  # conf.gem :core => 'mruby-eval'
  # conf.gem :mgem => 'mruby-onig-regexp'
  # conf.gem :github => 'mattn/mruby-onig-regexp'
  #conf.gem :core => 'mruby-bin-mirb'
  conf.gem :git => 'git@github.com:realtradam/sample-mruby-gem.git', :branch => 'test', :options => '-v'

  # include the GEM box
  conf.gembox 'default'
  #conf.gembox "stdlib"
  #conf.gembox "stdlib-ext"

  #conf.gembox "stdlib-io"
  # Use standard print/puts/p
  #conf.gem :core => "mruby-print"
  # Use standard IO/File class
  #conf.gem :core => "mruby-socket"
  # Use standard IO/File class
  #conf.gem :core => "mruby-io"

  #conf.gembox "math"
  #conf.gembox "metaprog"
  ## Generate mrbc command
  #conf.gem :core => "mruby-bin-mrbc"
  ## Generate mirb command
  #conf.gem :core => "mruby-bin-mirb"
  ## Generate mruby command
  #conf.gem :core => "mruby-bin-mruby"
  ## Generate mruby-strip command
  #conf.gem :core => "mruby-bin-strip"
  ## Generate mruby-config command
  #conf.gem :core => "mruby-bin-config"


  #conf.host_target = "x86_64-w64-mingw32"

  conf.cc do |cc|
    cc.command = 'emcc'
    cc.include_paths = ["#{root}/include", "#{@project_root}/raylib/src", "#{@project_root}/raylib/src/external"]
    cc.flags = ['-Wall', '-std=c99', '-D_DEFAULT_SOURCE', '-Wno-missing-braces', '-Os', '-s USE_GLFW=3', '-s TOTAL_MEMORY=67108864', '-s FORCE_FILESYSTEM=1',  "--shell-file #{@project_root}/raylib/src/shell.html", '-DPLATFORM_WEB']
  end
  #emcc -c raylib_game.c -o raylib_game.o -Wall -std=c99 -D_DEFAULT_SOURCE -Wno-missing-braces -Os -s USE_GLFW=3 -s TOTAL_MEMORY=67108864 -s FORCE_FILESYSTEM=1  --shell-file #{@project_root}/raylib/src/shell.html -I. -I#{@project_root}/raylib/src -I#{@project_root}/raylib/src/external -DPLATFORM_WEB

  conf.linker do |linker|
    linker.command = 'emcc'
    linker.flags = ["-lraylib -Wall -std=c99 -D_DEFAULT_SOURCE -Wno-missing-braces -Os -s USE_GLFW=3 -s TOTAL_MEMORY=67108864 -s FORCE_FILESYSTEM=1  --shell-file #{@project_root}/raylib/src/shell.html"]
    linker.library_paths = ['.', "#{@project_root}/raylib/src", "#{@project_root}/raylib/src/external", "#{@project_root}/raylib_lib_files/web/"]
  end

  #emcc -o raylib_game.html  raylib_game.o -Wall -std=c99 -D_DEFAULT_SOURCE -Wno-missing-braces -Os -s USE_GLFW=3 -s TOTAL_MEMORY=67108864 -s FORCE_FILESYSTEM=1  --shell-file #{@project_root}/raylib/src/shell.html -I. -I#{@project_root}/raylib/src -I#{@project_root}/raylib/src/external -L. -L#{@project_root}/raylib/src -L#{@project_root}/raylib/src #{@project_root}/raylib/src/libraylib.a -DPLATFORM_WEB

  conf.archiver do |archiver|
    archiver.command = 'emar'
  end


  conf.cxx do |cxx|
    cxx.command = "em++"
  end
end
