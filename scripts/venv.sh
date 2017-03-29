env(){
    if [ ! -z $1 ] ; then
	ENV_FOLDER=$1
    else
	ENV_FOLDER=env
    fi
    if [ -d ./${ENV_FOLDER} ] ; then
        source ${ENV_FOLDER}/bin/activate
    else
	echo No ${ENV_FOLDER} folder present
    fi
}
