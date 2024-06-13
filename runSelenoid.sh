#!/bin/bash

# Чтение параметров
properties_file="application.properties"


if [ ! -f "$properties_file" ]; then
    echo "Ошибка: Файл $properties_file не найден."
    exit 1
fi

# Функция для чтения значений из application.properties
get_property() {
    local property_name=$1
    grep "^${property_name}=" "$properties_file" | cut -d'=' -f2
}

stand_url=$(get_property "stand.url")
browser_name=$(get_property "browser.name")
browser_version=$(get_property "browser.version")
selenoid_url=$(get_property "selenoid.url")

if [ -z "$stand_url" ] || [ -z "$browser_name" ] || [ -z "$browser_version" ] || [ -z "$selenoid_url" ]; then
    echo "Ошибка: Один или несколько параметров не найдены в файле $properties_file."
    exit 1
fi

echo "URL стенда: $stand_url"
echo "Браузер: $browser_name"
echo "Версия браузера: $browser_version"
echo "URL Selenoid: $selenoid_url"

export STAND_URL=$stand_url

mvn clean test -Dbrowser.name="$browser_name" -Dbrowser.version="$browser_version" -Dgrid.url="$selenoid_url"

echo "Тесты завершены."
