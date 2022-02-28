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
