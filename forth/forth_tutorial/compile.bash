#!/bin/bash
set -Ceu

function compile() {
  currentIndex="$(basename "$1" | cut -c 1)"

  nextIndex="$(("${currentIndex}" + 1))"
  prevIndex="$(("${currentIndex}" - 1))"

  if [ "$nextIndex" -gt 1 ]; then
    nextFile="$(find -name "${nextIndex}-*.md" | sed -n 1p)"
    if [ -n "${nextFile}" ]; then
      nextFile="$(basename "${nextFile}")"
    else
      nextFile=""
    fi
  else
    nextFile=""
  fi

  if [ "$prevIndex" -gt 1 ]; then
    prevFile="$(find -name "${prevIndex}-*.md" | sed -n 1p)"
    if [ -n "${prevFile}" ]; then
      prevFile="$(basename "${prevFile}")"
    else
      prevFile=""
    fi
  else
    prevFile=""
  fi

  if [ -z "${nextFile}" ]; then
    :
  else
    sed -i -e "s/nextFile/${nextFile}/" "$1"
    nextTitle="$(cat "${nextFile}" | sed -n 1p | sed -e "s/%\ //")"
    sed -i -e "s/nextTitle/${nextTitle}/" "$1"
  fi

  if [ -z "${prevFile}" ]; then
    :
  else
    sed -i -e "s/prevFile/${prevFile}/" "$1"
    prevTitle="$(cat "${prevFile}" | sed -n 1p | sed -e "s/%\ //")"
    sed -i -e "s/prevTitle/${prevTitle}/" "$1"
  fi

  export_file="$(basename "$1" | sed -e s/\.md/\.html/)"

  pandoc -f markdown -t html --template=pandoc_template "$1" >| "./html/${export_file}"
}

for i in md/*-*.md ; do
  compile "$i"
done
