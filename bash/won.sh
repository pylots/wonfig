won () {
    if [ "$1" = "" ]
    then
        deactivate
        unset PRODIR
        echo "]0;"
        PS1="\w >>"
        cd
        return
    fi

    DEVDIR=${DEVDIR:-/projects}
    export PROJECT=$1
    if ! [ -d $DEVDIR/$PROJECT ]
    then
	echo "Unknown project: $PROJECT"
	return
    fi

    export PRODIR=$DEVDIR/$PROJECT
    echo "]0;$1"

    cd $PRODIR

    if [ -d $PRODIR/venv ]
    then
        source $PRODIR/venv/bin/activate
    fi

    if [ -f $PRODIR/.proenv ]
    then
        source $PRODIR/.proenv
    fi

    blue=$(tput setaf 4)
    reset=$(tput sgr0)
    PS1="\[$reset\]\[$blue\][$PROJECT:$ENV] $PS1\[$reset\]"

    if [ -f $PRODIR/.profun ]
    then
        source $PRODIR/.profun
    fi
}
