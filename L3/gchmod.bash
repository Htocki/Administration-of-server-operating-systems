# !/bin/bash

# Требуется создать сценарий оболочки с именем gchmod, 
# который позволяет искать в заданной директории файлы с
# заданными правами и менять эти права на другие.

# Входные данные:
# -- каталог, в котором нужно производить поиск;
# -- права для поиска; 
# -- целевые права.

parameter_count=$#
echo "Параметры:"
if [[ $parameter_count = 3 ]]
then
  directory=$1
  if [[ -e $directory ]]
  then
    echo " Директория: ОК"
  else 
    echo " Директория: Ошибка">&2
    exit
  fi

  permissions='^[0-7]+$'
  find_permissions=$2
  if [[ $find_permissions =~ $permissions ]]
  then
    echo " Искомые права доступа: ОК"
  else 
    echo " Искомые права доступа: Ошибка">&2
    exit
  fi
  
  target_permissions=$3
  if [[ $target_permissions =~ $permissions ]]
  then
    echo " Целевые права доступа: ОК"
  else
    echo " Целевые права доступа: Ошибка">&2
    exit
  fi
  
  echo ""
  files=$(find ./$directory -type f -perm $find_permissions)
  if [[ $files != "" ]]
  then 
    echo "Найденные файлы:"
    echo "$files"
    chmod $target_permissions $files

    echo ""
    echo "Исходные права доступа: $find_permissions"
    echo "Текущие права доступа: $target_permissions" 
  else
    echo "Файлы с указанными правами доступа не найдены"
  fi
else
  echo "Указано неверное число параметров" >&2
  exit
fi