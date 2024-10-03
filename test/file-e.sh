file_path="/Users/utkarshsingh/Documents/learnedinDITISS/python-docs/"

if [ -d $file_path ]; then
  echo "$file_path"
  ls "$file_path"
else
  echo -n "Seems like file doesn't exist"
fi

echo -n "It ends here!"
