#
# --NOWAIT
#
# --CLEANUPWIP
# --NODOMAINFOLDERS
# --ADDERRIGNORECSVEXPORT
#

NOWAIT
$NOWAIT

CLEANUPWIP
$CLEANUPWIP

NODOMAINFOLDERS
$NODOMAINFOLDERS

ADDERRIGNORECSVEXPORT
$ADDERRIGNORECSVEXPORT

CLIparm_NOWAIT
CLIparm_CLEANUPWIP
CLIparm_NODOMAINFOLDERS
CLIparm_ADDERRIGNORECSVEXPORT

export CLIparm_NOWAIT=
export CLIparm_CLEANUPWIP=
export CLIparm_NODOMAINFOLDERS=
export CLIparm_ADDERRIGNORECSVEXPORT=


export CLIparm_NOWAIT=`echo "$CLIparm_NOWAIT" | tr '[:upper:]' '[:lower:]'`
export CLIparm_CLEANUPWIP=`echo "$CLIparm_CLEANUPWIP" | tr '[:upper:]' '[:lower:]'`
export CLIparm_NODOMAINFOLDERS=`echo "$CLIparm_NODOMAINFOLDERS" | tr '[:upper:]' '[:lower:]'`
export CLIparm_ADDERRIGNORECSVEXPORT=`echo "$CLIparm_ADDERRIGNORECSVEXPORT" | tr '[:upper:]' '[:lower:]'`

# --NOWAIT
#
if [ -z "$NOWAIT" ]; then
    # NOWAIT mode not set from shell level
    export CLIparm_NOWAIT=false
elif [ x"`echo "$NOWAIT" | tr '[:upper:]' '[:lower:]'`" = x"false" ] ; then
    # NOWAIT mode set OFF from shell level
    export CLIparm_NOWAIT=false
elif [ x"`echo "$NOWAIT" | tr '[:upper:]' '[:lower:]'`" = x"true" ] ; then
    # NOWAIT mode set ON from shell level
    export CLIparm_NOWAIT=true
else
    # NOWAIT mode set to wrong value from shell level
    export CLIparm_NOWAIT=false
fi

# --CLEANUPWIP
#
if [ -z "$CLEANUPWIP" ]; then
    # CLEANUPWIP mode not set from shell level
    export CLIparm_CLEANUPWIP=false
elif [ x"`echo "$CLEANUPWIP" | tr '[:upper:]' '[:lower:]'`" = x"false" ] ; then
    # CLEANUPWIP mode set OFF from shell level
    export CLIparm_CLEANUPWIP=false
elif [ x"`echo "$CLEANUPWIP" | tr '[:upper:]' '[:lower:]'`" = x"true" ] ; then
    # CLEANUPWIP mode set ON from shell level
    export CLIparm_CLEANUPWIP=true
else
    # CLEANUPWIP mode set to wrong value from shell level
    export CLIparm_CLEANUPWIP=false
fi

# --NODOMAINFOLDERS
#
if [ -z "$NODOMAINFOLDERS" ]; then
    # NODOMAINFOLDERS mode not set from shell level
    export CLIparm_NODOMAINFOLDERS=false
elif [ x"`echo "$NODOMAINFOLDERS" | tr '[:upper:]' '[:lower:]'`" = x"false" ] ; then
    # NODOMAINFOLDERS mode set OFF from shell level
    export CLIparm_NODOMAINFOLDERS=false
elif [ x"`echo "$NODOMAINFOLDERS" | tr '[:upper:]' '[:lower:]'`" = x"true" ] ; then
    # NODOMAINFOLDERS mode set ON from shell level
    export CLIparm_NODOMAINFOLDERS=true
else
    # NODOMAINFOLDERS mode set to wrong value from shell level
    export CLIparm_NODOMAINFOLDERS=false
fi

# --ADDERRIGNORECSVEXPORT
#
if [ -z "$ADDERRIGNORECSVEXPORT" ]; then
    # ADDERRIGNORECSVEXPORT mode not set from shell level
    export CLIparm_ADDERRIGNORECSVEXPORT=false
elif [ x"`echo "$ADDERRIGNORECSVEXPORT" | tr '[:upper:]' '[:lower:]'`" = x"false" ] ; then
    # ADDERRIGNORECSVEXPORT mode set OFF from shell level
    export CLIparm_ADDERRIGNORECSVEXPORT=false
elif [ x"`echo "$ADDERRIGNORECSVEXPORT" | tr '[:upper:]' '[:lower:]'`" = x"true" ] ; then
    # ADDERRIGNORECSVEXPORT mode set ON from shell level
    export CLIparm_ADDERRIGNORECSVEXPORT=true
else
    # CLEANUPWIP mode set to wrong value from shell level
    export CLIparm_ADDERRIGNORECSVEXPORT=false
fi
