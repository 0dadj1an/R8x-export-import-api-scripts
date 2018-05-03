# -------------------------------------------------------------------------------------------------
# group members
# -------------------------------------------------------------------------------------------------

export APICLIobjecttype=group-members

#
# APICLICSVsortparms can change due to the nature of the object
#
export APICLICSVsortparms='-f -t , -k 1,2'

export CSVFileHeader='"name","members.add"'

SetupExportObjectsToCSVviaJQ

#
# APICLICSVsortparms can change due to the nature of the object
#
export APICLIobjecttype=groups

echo
echo 'Generate array of groups'
echo

# MGMT_CLI_GROUPS_STRING is a string with multiple lines. Each line contains a name of a group members.
# in this example the output of mgmt_cli is not sent to a file, instead it is passed to jq directly using a pipe.

MGMT_CLI_GROUPS_STRING="`mgmt_cli show groups limit $APICLIObjectLimit details-level full -s $APICLIsessionfile --format json | $JQ ".objects[].name | @sh" -r`"

# break the string into an array - each element of the array is a line in the original string
# there are simpler ways, but this way allows the names to contain spaces. Gaia's bash version is 3.x so readarray is not available

ARR=()
while read -r line; do
    ARR+=("$line")
    echo -n '.'
done <<< "$MGMT_CLI_GROUPS_STRING"
echo

# print the elements in the array
echo
echo Groups
echo

for i in "${ARR[@]}"
do
    echo "$i, ${i//\'/}"
done

 

#
# using bash variables in a jq expression
#

echo
echo 'Use array of groups to generate group members CSV'
echo

for i in "${ARR[@]}"
do
    echo
    echo Group "${i//\'/}"

    MEMBERS_COUNT=$(mgmt_cli show group name "${i//\'/}" -s $APICLIsessionfile --format json | $JQ ".members | length")

    echo "number of members in the group ${i//\'/} : $MEMBERS_COUNT"

    COUNTER=0
    
    while [ $COUNTER -lt $MEMBERS_COUNT ]; do

        MEMBER_NAME=$(mgmt_cli show group name ${i//\'/} -s $APICLIsessionfile --format json | $JQ ".members[$COUNTER].name")
        

        echo -n '.'
        echo ${i//\'/},$MEMBER_NAME >> $APICLICSVfiledata

        let COUNTER=COUNTER+1

    done

done


FinalizeExportObjectsToCSVviaJQ
errorreturn=$?
if [ $errorreturn != 0 ] ; then
    # Something went wrong, terminate
    exit $errorreturn
fi


