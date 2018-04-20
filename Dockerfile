FROM project8/cvmfs-dependencies-common:build-2018-04-17

# Adding a clean tmp folder for containing the bash scripts
RUN mkdir -p tmp_install

ADD ./setup.sh /tmp_install/setup.sh
ADD ./dependency_urls.txt /tmp_install/dependency_urls.txt
ADD ./download_pkg.sh /tmp_install/download_pkg.sh
ADD ./install.sh /tmp_install/install.sh
ADD ./python_tester.py /tmp_install/python_tester.py
ADD ./run-cvmfs-install.sh /tmp_install/run-cvmfs-install.sh

RUN cd /tmp_install && \
    ls && \
    source /opt/rh/devtoolset-3/enable && \
    source /tmp_install/run-cvmfs-install.sh && \
    rm -rf /tmp_install