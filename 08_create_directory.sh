
echo "Enter directory name:"
read dir

if [ -d "$dir" ]
then
    echo "Directory already exists"
else
    mkdir -p "$dir"
    echo "Directory created successfully"
fi
