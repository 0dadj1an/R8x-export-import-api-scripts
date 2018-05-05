# -------------------------------------------------------------------------------------------------
# Main Operational repeated proceedure
# -------------------------------------------------------------------------------------------------

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
        echo "Processing $objectstoshow $APICLIobjecttype objects in $APICLIObjectLimit object historychunks:"
        echo 'Dump '$APICLIobjectstype' to '$APICLIfileexport

        objectslefttoshow=$objectstoshow
        currentoffset=0
    
        while [ $objectslefttoshow -ge 1 ] ; do
            # we have objects to process
    
            if [ $currentoffset -gt 0 ] ; then
                # Export file for the next $APICLIObjectLimit objects
                export APICLIfileexport=$APICLIpathexport/$APICLIfileexportpre$APICLIobjecttype'_'$currentoffset'_'$APICLIfileexportpost
            fi
    
            echo "  Now processing up to next $APICLIObjectLimit $APICLIobjecttype objects starting with object $currentoffset of $objectslefttoshow remaining!"
    
            mgmt_cli show $APICLIobjectstype limit $APICLIObjectLimit offset $currentoffset $MgmtCLI_Show_OpParms > $APICLIfileexport
    
            objectslefttoshow=`expr $objectslefttoshow - $APICLIObjectLimit`
            currentoffset=`expr $currentoffset + $APICLIObjectLimit`
    
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

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

