if [ $# -eq 2 ]
then
    repo="$2"
    curl -L -o $repo.zip https://github.com/$1/$2/zipball/master/
else
    url="$1"
    repo="$(cut -d'/' -f5 <<<"$url")"
    curl -L -o $repo.zip $url/zipball/master/
fi
unzip $repo.zip
rm -rf $repo.zip
mv *$repo* $repo