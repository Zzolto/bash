#!/bin/bash

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --file) files+=("$2"); shift ;;
        --extension) extension="$2"; shift ;;
        --replacement) replacement="$2"; shift ;;
        *) echo "Неизвестный параметр: $1"; exit 1 ;;
    esac
    shift
done

if [[ -z "$extension" || -z "$replacement" || ${#files[@]} -eq 0 ]]; then
    echo "Необходимо указать --file, --extension и --replacement"
    exit 1
fi

for file in "${files[@]}"; do
    if [[ "$file" == *".$extension" ]]; then
        mv "$file" "${file%.$extension}.$replacement"
        echo "Файл $file переименован в ${file%.$extension}.$replacement"
    fi
done
