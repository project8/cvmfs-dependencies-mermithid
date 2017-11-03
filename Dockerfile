FROM project8/cvmfs-dependencies:latest

ENV P8DEPPYBUILD=build-2017-10-18

RUN mkdir -p /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} && \
    rm -f /cvmfs/hep.pnnl.gov/project8/dependencies-py/latest && \
    ln -s /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} /cvmfs/hep.pnnl.gov/project8/dependencies-py/latest

ADD ./setup.sh /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}/setup.sh
ADD ./install.sh /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}/install.sh
ADD ./python_tester.py /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}/python_tester.py

RUN source /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}/setup.sh && \
    chmod +x /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}/install.sh && \
    sleep 1s && \
    /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}/install.sh
