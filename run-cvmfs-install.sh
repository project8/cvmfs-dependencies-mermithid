# FROM project8/cvmfs-dependencies:latest

export P8DEPMERMITHIDBUILD=build-2018-04-12

# get the location of this script
export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# make the dependencies build directory
mkdir -p /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}
# rm -f /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/latest 
# ln -s /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD} /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/latest

cp ./setup.sh /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/setup.sh
cp ./dependency_urls.txt /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/dependency_urls.txt
cp ./download_pkg.sh /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/download_pkg.sh
cp ./install.sh /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/install.sh
cp ./python_tester.py /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/python_tester.py

source /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/setup.sh
chmod +x /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/download_pkg.sh
chmod +x /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/install.sh
/cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/download_pkg.sh
/cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/install.sh
