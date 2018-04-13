FROM project8/cvmfs-dependencies-common:build-2018-04-12

ENV P8DEPMERMITHIDBUILD=build-2018-04-12

RUN mkdir -p /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}

ADD ./setup.sh /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/setup.sh
ADD ./dependency_urls.txt /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/dependency_urls.txt
ADD ./download_pkg.sh /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/download_pkg.sh
ADD ./install.sh /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/install.sh
ADD ./python_tester.py /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/python_tester.py

RUN source /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/setup.sh && \
    chmod +x /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/download_pkg.sh &&\    
    sleep 1 &&\
    /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/download_pkg.sh && \
    chmod +x /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/install.sh &&\    
    sleep 1 &&\
    /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/install.sh
