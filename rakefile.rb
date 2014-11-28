desc "install gcc 4.8.2 in centos6.5"
task :install do
    sh "wget http://people.centos.org/tru/devtools-2/devtools-2.repo -O /etc/yum.repos.d/devtools-2.repo"
    sh "yum -y devtoolset-2-toolchain"
end

desc "install from tarball such as gcc[4.9.0]"
task :gcc ,[:version] do |t,argv|
    sh "wget http://ftp.gnu.org/gnu/gcc/gcc-#{argv[0]}/gcc-#{argv[0]}.tar.bz2"
    sh "tar -xf gcc-#{argv[0].tar.gz}"
    cd "gcc-#{argv[0].tar.gz}"
    sh "./contrib/download_prerequisites"
    makedirs "gcc_temp"
    cd "gcc_temp"
    sh "../configure –enable-checking=release –enable-languages=c,c++ –disable-multilib"

    # if you have 4 core in cpu
    sh "make -j4"
    sh "make install"
end

task :default => :install