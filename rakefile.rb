desc "install gcc 4.8.2 in centos6.5"
task :install do
    sh "wget http://people.centos.org/tru/devtools-2/devtools-2.repo -O /etc/yum.repos.d/devtools-2.repo"
    sh "yum -y install devtoolset-2-gcc devtoolset-2-binutils devtoolset-2-gcc-c++"
end

task :default => :install