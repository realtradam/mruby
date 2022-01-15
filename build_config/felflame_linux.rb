MRuby::Build.new do |conf|
  # load specific toolchain settings
  conf.toolchain :clang
  #conf.toolchain

  disable_lock # disables being stuck on a single commit

  # include the GEM box
  conf.gembox 'felflame'

  # C compiler settings
  conf.cc do |cc|
    cc.command = 'zig cc -target native -O2'
    cc.include_paths = ["#{root}/include", '../vendor/include/raylib']
  end

  # Linker settings
  conf.linker do |linker|
    #linker.command = ENV['LD'] || 'gcc'
    linker.command = 'zig cc -target native -O2'
    linker.flags = ['-lraylib -lGL -lm -lpthread -ldl -lrt -lX11']
    linker.library_paths = ['../vendor/lib/tux/raylib']
  end

  conf.cxx.command = 'zig c++ -target native -O2'

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
=begin
MRuby::CrossBuild.new("win") do |conf|
  conf.toolchain :clang

  disable_lock # disables being stuck on a single commit

  # include the GEM box
  conf.gembox 'felflame'

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
=end
MRuby::CrossBuild.new("web") do |conf|
  @project_root = '../'
  conf.toolchain :clang

  # Use mrbgems
  disable_lock # disables being stuck on a single commit
  conf.gem :git => 'git@github.com:realtradam/sample-mruby-gem.git', :branch => 'test', :options => '-v'

  # include the GEM box
  conf.gembox 'felflame'

  conf.cc do |cc|
    cc.command = 'emcc'
    cc.include_paths = ["#{root}/include", "#{@project_root}/vendor/include/raylib"]
    cc.flags = ['-Wall', '-std=c99', '-D_DEFAULT_SOURCE', '-Wno-missing-braces', '-Os', '-DPLATFORM_WEB']
  end

  conf.linker do |linker|
    linker.command = 'emcc'
    linker.flags = ["-lraylib -Wall -std=c99 -D_DEFAULT_SOURCE -Wno-missing-braces -Os -s USE_GLFW=3 -s TOTAL_MEMORY=67108864 -s FORCE_FILESYSTEM=1  --shell-file #{@project_root}/raylib/src/shell.html"]
    linker.library_paths = ['.', "#{@project_root}/raylib/src", "#{@project_root}/vendor/lib/web/raylib"]
  end

  conf.archiver do |archiver|
    archiver.command = 'emar'
  end

  conf.cxx do |cxx|
    cxx.command = "em++"
  end
end
