#!/bin/bash

echo

while getopts ":r:" arg; do
  case $arg in
    r) repo=$OPTARG;;
  esac
done

if [[ -z "$repo" ]] || [[ -d "$repo" ]];
  then
  echo "\$repo is either unspecified or already exists, use 'bash makeGitCourseRepo.sh -r [REPO_NAME]' to create a new course note Git project";
  exit 0;
else
  mkdir ../$repo;
  cd ../$repo;
  
  # copy this repo into the $repo
  cp -r ../CourseNoteTemplate/* .;
  git init;
  git add .;
  git commit -m "Initialize a note repository for ${repo}";
  git remote add origin git@github.com:mikhaidn/${repo}.git;
  git push -u origin master;
fi
