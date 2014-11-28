namespace :gcc do
    desc "yum install gcc in centos6.5"
    task :yum do
        sh "wget http://people.centos.org/tru/devtools-2/devtools-2.repo -O /etc/yum.repos.d/devtools-2.repo"
        sh "yum -y devtoolset-2-toolchain"
    end

    desc "install from tarball such as gcc[4.9.0]"
    task :compile ,[:version] do |t,argv|
        sh 'wget http://ftp.gnu.org/gnu/gcc/gcc-#{argv.version}/gcc-#{argv.version}.tar.bz2'
        sh 'tar -xf gcc-#{argv.version}.tar.gz'
        cd "gcc-#{argv.version}.tar.gz}"
        sh "./contrib/download_prerequisites"
        makedirs "gcc_temp"
        cd "gcc_temp"
        sh "../configure –enable-checking=release –enable-languages=c,c++ –disable-multilib"

        # if you have 4 core in cpu
        sh "make -j4"
        sh "make install"
    end 
end
