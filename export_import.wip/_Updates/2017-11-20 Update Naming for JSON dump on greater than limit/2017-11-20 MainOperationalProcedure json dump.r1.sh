# -------------------------------------------------------------------------------------------------
# Main Operational repeated proceedure
# -------------------------------------------------------------------------------------------------

# MODIFIED 2017-11-20 -\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# The Main Operational Procedure is the meat of the script's repeated actions.
#
# For this script the $APICLIobjecttype details is exported to a json at the $APICLIdetaillvl.

MainOperationalProcedure () {
    #
    # Screen width template for sizing, default width of 80 characters assumed
    #
    #              1111111111222222222233333333334444444444555555555566666666667777777777888888888899999999990
    #    01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

    export APICLIfilename=$APICLIobjectstype
    if [ x"$APICLIexportnameaddon" != x"" ] ; then
        export APICLIfilename=$APICLIfilename'_'$APICLIexportnameaddon
    fi

    export APICLIfileexport=$APICLIpathexport/$APICLIfileexportpre$APICLIfilename$APICLIfileexportpost

    export MgmtCLI_Base_OpParms="--format json -s $APICLIsessionfile"
    export MgmtCLI_IgnoreErr_OpParms="ignore-warnings true ignore-errors true --ignore-errors true"
    
    export MgmtCLI_Show_OpParms="details-level \"$APICLIdetaillvl\" $MgmtCLI_Base_OpParms"
    
    objectstotal=$(mgmt_cli show $APICLIobjectstype limit 1 offset 0 details-level "standard" $MgmtCLI_Base_OpParms | $JQ ".total")

    objectstoshow=$objectstotal

    if [ $objectstoshow -le 0 ] ; then
        echo "Found $objectstoshow $APICLIobjecttype objects.  No objects found!  Skipping!..."
    else
    
        echo
        echo "Processing $objectstoshow $APICLIobjecttype objects in $APICLIObjectLimit object chunks:"

        objectslefttoshow=$objectstoshow
        currentoffset=0
    
        while [ $objectslefttoshow -ge 1 ] ; do
            # we have objects to process
    
            nextoffset=`expr $currentoffset + $APICLIObjectLimit`

            #if [ $currentoffset -gt 0 ] ; then
            #    # Export file for the next $APICLIObjectLimit objects
            #    export APICLIfileexport=$APICLIpathexport/$APICLIfileexportpre$APICLIobjectstype'_'$currentoffset'_'$APICLIfileexportpost
            #fi
    
            # 2017-11-20 Updating naming of files for multiple $APICLIObjectLimit chunks to clean-up name listing
            if [ $objectstotal -gt $APICLIObjectLimit ] ; then
                # Export file for the next $APICLIObjectLimit objects
                export APICLIfilename=$APICLIobjectstype
                if [ x"$APICLIexportnameaddon" != x"" ] ; then
                    export APICLIfilename=$APICLIfilename'_'$APICLIexportnameaddon
                fi

                #export APICLIfilename=$APICLIfilename'_'$currentoffset'-'$nextoffset'_of_'$objectstotal

                currentoffsetformatted=`printf "%05d" $currentoffset`
                nextoffsetformatted=`printf "%05d" $nextoffset`
                objectstotalformatted=`printf "%05d" $objectstotal`
                export APICLIfilename=$APICLIfilename'_'$currentoffsetformatted'-'$nextoffsetformatted'_of_'$objectstotalformatted

                #export APICLIfileexport=$APICLIpathexport/$APICLIfileexportpre$APICLIobjectstype'_'$currentoffset'_'$APICLIfileexportpost
                export APICLIfileexport=$APICLIpathexport/$APICLIfileexportpre$APICLIfilename$APICLIfileexportpost
            fi
    
            echo "  Now processing up to next $APICLIObjectLimit $APICLIobjecttype objects starting with object $currentoffset to $nextoffset of $objectslefttoshow remaining!"
            echo '    Dump to '$APICLIfileexport

            mgmt_cli show $APICLIobjectstype limit $APICLIObjectLimit offset $currentoffset $MgmtCLI_Show_OpParms > $APICLIfileexport
    
            objectslefttoshow=`expr $objectslefttoshow - $APICLIObjectLimit`
            #currentoffset=`expr $currentoffset + $APICLIObjectLimit`
            currentoffset=$nextoffset
    
        done
    
    
        echo
        tail $APICLIfileexport
        echo
    fi
    
    #              1111111111222222222233333333334444444444555555555566666666667777777777888888888899999999990
    #    01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

    echo
    return 0
}

#
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/-  MODIFIED 2017-11-20

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

