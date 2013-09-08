Pod::Spec.new do |s|
  s.name         =  'Objective-LevelDB'
  s.version      =  '1.4.2'
  s.license      =  'MIT'
  s.summary      =  'A feature-complete wrapper for LevelDB in Objective-C.'
  s.description  =  'This is a feature-complete wrapper for Google\'s LevelDB. LevelDB is a fast key-value store written by Google.'
  s.homepage     =  'https://github.com/matehat/Objective-LevelDB'
  s.authors      =  'Michael Hoisie', 'Mathieu D\'Amours', 'Chien Kuo'

  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'

  s.source       =  { :git => 'https://github.com/chien/Objective-LevelDB.git', :tag => 'v1.4.2', :submodules => true }
  s.source_files =  'Classes/*.{h,m,mm}'
  s.library      =  'leveldb'

  s.preserve_paths = 'leveldb-library'
  s.xcconfig = {
    'LIBRARY_SEARCH_PATHS'    => '"$(PODS_ROOT)/Objective-LevelDB/leveldb-library"',
    'HEADER_SEARCH_PATHS'     => '"$(PODS_ROOT)/Objective-LevelDB/leveldb-library/include"',
    'OTHER_LDFLAGS'           => '-lstdc++',
    'CC'                      => 'clang',
    'CXX'                     => 'clang++'
  }
  s.prepare_command = <<-CMD
    cd leveldb-library
    make PLATFORM=IOS CC=clang CXX=clang++ libleveldb.a
  CMD
end
