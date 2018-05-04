
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# ADDED 2018-04-16 -

# ADDED 2018-04-25 -

# ADDED 2018-04-16 -\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#


#
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/- ADDED 2018-04-16

# ADDED 2018-04-25 -\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#


#
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/- ADDED 2018-04-25

# MODIFIED 2018-04-16 -

# MODIFIED 2018-04-25 -

# MODIFIED 2018-04-16 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#


#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-04-16

# MODIFIED 2018-04-25 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#


#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-04-25

# REMOVED 2018-04-25 -

# REMOVED 2018-04-25 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ REMOVED 2018-04-25


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# ADDED 2018-04-16 -

# -------------------------------------------------------------------------------------------------
# Main Operational repeated proceedure - ExportObjectsToJSONviaJQ
# -------------------------------------------------------------------------------------------------

# -------------------------------------------------------------------------------------------------
# SetupExportObjectsToJSONviaJQ
# -------------------------------------------------------------------------------------------------

# ADDED 2018-04-16 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#


# The SetupExportObjectsToJSONviaJQ is the setup actions for the script's repeated actions.
#

SetupExportObjectsToJSONviaJQ () {
    #
    # Screen width template for sizing, default width of 80 characters assumed
    #
    #              1111111111222222222233333333334444444444555555555566666666667777777777888888888899999999990
    #    01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
    
    echo
    
    export APICLIJSONfilename=$APICLIobjectstype
    if [ x"$APICLIexportnameaddon" != x"" ] ; then
        export APICLIJSONfilename=$APICLIJSONfilename'_'$APICLIexportnameaddon
    fi
    export APICLIJSONfilename=$APICLIJSONfilename'_'$APICLIdetaillvl'_'$APICLIJSONfileexportext$APICLIJSONfileexportsuffix
    export APICLIJSONfile=$APICLIpathexport/$APICLIJSONfilename
    export APICLIJSONfilewip=$APICLIpathexportwip/$APICLIJSONfilename
    export APICLIJSONfileheader=$APICLIJSONfilewip.$APICLIJSONheaderfilesuffix
    export APICLIJSONfiledata=$APICLIJSONfilewip.data
    export APICLIJSONfilesort=$APICLIJSONfilewip.sort
    export APICLIJSONfileoriginal=$APICLIJSONfilewip.original
    export APICLIJSONfilefooter=$APICLIJSONfilewip.$APICLIJSONfooterfilesuffix
    
    
    if [ ! -r $APICLIpathexportwip ] ; then
        mkdir $APICLIpathexportwip
    fi

    if [ -r $APICLIJSONfile ] ; then
        rm $APICLIJSONfile
    fi
    if [ -r $APICLIJSONfileheader ] ; then
        rm $APICLIJSONfileheader
    fi
    if [ -r $APICLIJSONfilefooter ] ; then
        rm $APICLIJSONfilefooter
    fi
    if [ -r $APICLIJSONfiledata ] ; then
        rm $APICLIJSONfiledata
    fi
    if [ -r $APICLIJSONfilesort ] ; then
        rm $APICLIJSONfilesort
    fi
    if [ -r $APICLIJSONfileoriginal ] ; then
        rm $APICLIJSONfileoriginal
    fi
    
    echo
    echo "Creat $APICLIobjectstype JSON File : $APICLIJSONfile"
    echo
    
    export JSONFileHeader=
    export JSONFileHeader=$JSONFileHeader'{'
    export JSONFileHeader=$JSONFileHeader"\n"
    export JSONFileHeader=$JSONFileHeader"\"objects\" : [ "

    #
    # Troubleshooting output
    #
    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
        # Verbose mode ON
        echo
        echo '$JSONFileHeader' - $JSONFileHeader
        echo
    
    fi
    
    echo -e $JSONFileHeader > $APICLIJSONfileheader
    echo
    
    export JSONFileFooter=
    export JSONFileFooter=$JSONFileFooter"],\n"
    export JSONFileFooter=$JSONFileFooter"\"from\" : 1,\n"
    export JSONFileFooter=$JSONFileFooter"\"to\" : '$number_of_objects',\n"
    export JSONFileFooter=$JSONFileFooter"\"total\" : '$number_of_objects'\n"
    export JSONFileFooter=$JSONFileFooter'}'

    #
    # Troubleshooting output
    #
    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
        # Verbose mode ON
        echo
        echo '$JSONFileFooter' - $JSONFileFooter
        echo
    
    fi
    
    echo -e $JSONFileFooter > $APICLIJSONfilefooter
    echo
    
    echo
    return 0
    
    #
}

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ADDED 2018-04-16


# -------------------------------------------------------------------------------------------------

# ADDED 2018-04-16 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#


# The FinalizeExportObjectsToJSONviaJQ is the finaling actions for the script's repeated actions.
#

FinalizeExportObjectsToJSONviaJQ () {
    #
    # Screen width template for sizing, default width of 80 characters assumed
    #
    #              1111111111222222222233333333334444444444555555555566666666667777777777888888888899999999990
    #    01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

    if [ ! -r $APICLIJSONfileheader ] ; then
        # Uh, Oh, something went wrong, no header file
        echo
        echo '!!!! Error header file missing : '$APICLIJSONfileheader
        echo 'Terminating!'
        echo
        exit 254
        
    elif [ ! -r $APICLIJSONfilefooter ] ; then
        # Uh, Oh, something went wrong, no footer file
        echo
        echo '!!!! Error footer file missing : '$APICLIJSONfilefooter
        echo 'Terminating!'
        echo
        exit 254
        
    elif [ ! -r $APICLIJSONfiledata ] ; then
        # Uh, Oh, something went wrong, no data file
        echo
        echo '!!!! Error data file missing : '$APICLIJSONfiledata
        echo 'Terminating!'
        echo
        exit 253
        
    elif [ ! -s $APICLIJSONfiledata ] ; then
        # data file is empty, nothing was found
        echo
        echo '!! data file is empty : '$APICLIJSONfiledata
        echo 'Skipping JSON creation!'
        echo
        return 0
        
    fi

    echo
    echo "Build JSON export file"
    echo
    
    cat $APICLIJSONfileheader > $APICLIJSONfile
    cat $APICLIJSONfiledata >> $APICLIJSONfile
    cat $APICLIJSONfilefooter >> $APICLIJSONfile
    
    echo
    echo "Done creating $APICLIobjectstype JSON File : $APICLIJSONfile"
    echo
    
    head $APICLIJSONfile
    echo
    tail $APICLIJSONfile
    echo
    echo
   
    
    #              1111111111222222222233333333334444444444555555555566666666667777777777888888888899999999990
    #    01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

    echo
    return 0
    
    #
}

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ADDED 2018-04-16


# -------------------------------------------------------------------------------------------------

# ADDED 2018-04-16 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#


# The ExportObjectsToCSVviaJQ is the meat of the script's repeated actions.
#
# For this script the $APICLIobjectstype item's name is exported to a CSV file and sorted.
# The original exported data and raw sorted data are retained in separate files, as is the header
# for the CSV file generated.

ExportObjectsToJSONviaJQ () {
    #
    
    if [[ $number_of_objects -le 1 ]] ; then
        # no objects of this type
 
        echo "No objects of type $APICLIobjecttype to process, skipping..."

        return 0
       
    else
        # we have objects to handle
        echo "Processing $number_of_objects $APICLIobjecttype objects..."
        echo
   fi

    SetupExportObjectsToJSONviaJQ
    
    #
    # Troubleshooting output
    #
    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
        # Verbose mode ON
        echo
        echo '$CSVJQparms' - $CSVJQparms
        echo
    fi
    
    export MgmtCLI_Base_OpParms="--format json -s $APICLIsessionfile"
    export MgmtCLI_IgnoreErr_OpParms="ignore-warnings true ignore-errors true --ignore-errors true"
    
    export MgmtCLI_Show_OpParms="details-level \"full\" $MgmtCLI_Base_OpParms"
    
    # System Object selection operands
    # export systemobjectselector='select(."meta-info"."creator" != "System")'
    export systemobjectselector='select(."meta-info"."creator" | contains ("System") | not)'

    objectstotal=$(mgmt_cli show $APICLIobjectstype limit 1 offset 0 details-level "standard" --format json -s $APICLIsessionfile | $JQ ".total")

    objectstoshow=$objectstotal

    echo "Processing $objectstoshow $APICLIobjecttype objects in $APICLIObjectLimit object chunks:"

    objectslefttoshow=$objectstoshow
    currentoffset=0

    echo
    echo "Export $APICLIobjectstype to JSON File"
    echo "  mgmt_cli parameters : $MgmtCLI_Show_OpParms"
    echo "  and dump to $APICLIJSONfile"
    echo
    
    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
        echo "  System Object Selector : "$systemobjectselector
    fi

    while [ $objectslefttoshow -ge 1 ] ; do
        # we have objects to process
        echo "  Now processing up to next $APICLIObjectLimit $APICLIobjecttype objects starting with object $currentoffset of $objectslefttoshow remaining!"

        #mgmt_cli show $APICLIobjectstype limit $APICLIObjectLimit offset $currentoffset $MgmtCLI_Show_OpParms | $JQ '.objects[] | select(."read-only"==false)' >> $APICLIJSONfiledata
        #mgmt_cli show $APICLIobjectstype limit $APICLIObjectLimit offset $currentoffset $MgmtCLI_Show_OpParms | $JQ '.objects[] | select(."read-only"==false) | join(", ")' >> $APICLIJSONfiledata
        mgmt_cli show $APICLIobjectstype limit $APICLIObjectLimit offset $currentoffset $MgmtCLI_Show_OpParms | $JQ '.objects[] | select(."read-only"==false)' -r >> $APICLIJSONfiledata
        errorreturn=$?

        if [ $errorreturn != 0 ] ; then
            # Something went wrong, terminate
            exit $errorreturn
        fi

        objectslefttoshow=`expr $objectslefttoshow - $APICLIObjectLimit`
        currentoffset=`expr $currentoffset + $APICLIObjectLimit`
    done

    echo
    
    FinalizeExportObjectsToJSONviaJQ
    errorreturn=$?
    if [ $errorreturn != 0 ] ; then
        # Something went wrong, terminate
        exit $errorreturn
    fi
    
    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
        echo
        echo "Done with Exporting $APICLIobjectstype to JSON File : $APICLIJSONfile"
    
        read -t $WAITTIME -n 1 -p "Any key to continue : " anykey
    
    fi
    
    echo
    return 0
    
    #
}

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ADDED 2018-04-16

# -------------------------------------------------------------------------------------------------


# -------------------------------------------------------------------------------------------------
# Main Operational repeated proceedure - ExportObjectsToCSVviaJQ
# -------------------------------------------------------------------------------------------------


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

