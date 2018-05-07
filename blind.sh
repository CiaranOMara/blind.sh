#!/usr/bin/env bash

WILD="*"
ALPHA=4
NUMERIC=4
RECORDS="key.txt"

echo "Enter input directory: "
read SRC
echo "Enter output directory: "
read DEST

# Check that SRC is a valid directory.
if [[ ! -d $SRC ]]; then
    echo "$SRC is not a valid directory!"
    exit 1
fi

# Create destination
mkdir -p $DEST

#FILES=( $(find $SRC -type f) )
FILES=($SRC/$WILD) #TODO: ls *.{tif,tiff} > $FILES

COUNT=${#FILES[@]}

echo "Blinding $COUNT files."




# Check if the array has a certain key: inArray "myKey" ${!myArray[@]}"
# Check if the array contains a certain value: inArray "myValue" "${myArray[@]}"
function inArray # ( keyOrValue, arrayKeysOrValues )
{
  local e
  for e in "${@:2}"; do
    [[ "$e" == "$1" ]] && return 0;
  done
  return 1
}

BLINDS=()

# Generate array of random unique strings.
until [[ ${#BLINDS[@]} -ge $(($COUNT)) ]]; do

    #6^$ALPHA combinations.
	str1=`cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f' | head -c $ALPHA`
	#10^$NUMERIC combinations.
	str2=`cat /dev/urandom | env LC_CTYPE=C tr -cd '0-9' | head -c $NUMERIC`

	str="$str1-$str2"

	if [[ ! `inArray $str "${BLINDS[@]}"` ]]; then
	    idx=(${#BLINDS[@]})
	    BLINDS[$idx]=$str
	fi

done

# Print each line in the array.
for idx in $(seq 0 $((${#FILES[@]} - 1))); do
    src="${FILES[$idx]}"
    dest="${DEST}/${BLINDS[$idx]}.${src##*.}"

    # Record rename.
    echo "$src    $dest" >> $RECORDS

    # Copy rename.
    cp "$src" "$dest"
done