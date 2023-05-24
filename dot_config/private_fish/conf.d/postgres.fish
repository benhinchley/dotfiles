set -l postgres /Applications/Postgres.app/Contents/Versions/latest/bin

if test -d $postgres
    fish_add_path $postgres
end
