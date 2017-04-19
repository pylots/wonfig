set -x
won () {
    DEVDIR=${DEVDIR:-/projects}
    export PROJECT=$1
    if ! [ -d $DEVDIR/$PROJECT ]
    then
	echo "Unknown project: $PROJECT"
	return
    fi

    export PRODIR=$DEVDIR/$PROJECT
    cd $PRODIR

    if [ -d $PRODIR/venv ]
    then
        source $PRODIR/venv/bin/activate
    fi

    if [ -f $PRODIR/.proenv ]
    then
        source $PRODIR/.proenv
    fi

    if [ -f $PRODIR/.profun ]
    then
        source $PRODIR/.profun
    fi
}
