#!/bin/bash

# Nazwa pliku Markdown
FILE="Home.md"

# Sprawdzenie, czy plik istnieje
if [ ! -f "$FILE" ]; then
    # Tworzenie nagłówków tabeli, jeśli plik nie istnieje
    echo "| Data | Użytkownik | Aktualny obraz | Poprzedni obraz | Numer CRQ | Komentarz |" > $FILE
    echo "|------|------------|----------------|----------------|-----------|-----------|" >> $FILE
fi

# Odczyt danych od użytkownika
read -p "Podaj datę: " data
read -p "Podaj użytkownika: " uzytkownik
read -p "Podaj aktualny obraz: " aktualny_obraz
read -p "Podaj poprzedni obraz: " poprzedni_obraz
read -p "Podaj numer CRQ: " numer_crq
read -p "Podaj komentarz: " komentarz

# Zapisanie nowego wiersza pod nagłówkami
sed -i "3i| $data | $uzytkownik | $aktualny_obraz | $poprzedni_obraz | $numer_crq | $komentarz |" $FILE
