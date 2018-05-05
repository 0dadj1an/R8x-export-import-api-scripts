# MODIFIED 2017-11-09 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# The GetNumberOfObjectsviaJQ is the obtains the number of objects for that type indicated.
#

GetNumberOfObjectsviaJQ () {

    export objectstotal=
    export objectsfrom=
    export objectsto=
    
    #
    # Troubleshooting output
    #
    if [ x"$APISCRIPTVERBOSE" = x"TRUE" ] ; then
        # Verbose mode ON
        echo
        echo '$CSVJQparms' - $CSVJQparms
        echo
    fi
    
    objectstotal=$(mgmt_cli show $APICLIobjectstype limit 1 offset 0 details-level "standard" --format json -s $APICLIsessionfile | $JQ ".total")
    errorreturn=$?

    if [ $errorreturn != 0 ] ; then
        # Something went wrong, terminate
        exit $errorreturn
    fi
    
    echo
    return 0
    
    #
}

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2017-11-09

