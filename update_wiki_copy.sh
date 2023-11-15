#!/bin/bash

# Nazwa pliku Markdown
FILE="update_wiki.md"

# Funkcja do dodawania danych do tabeli dla wybranego HUB_STAGE
update_table() {
    local hub_stage="$1"
    local current_version="$2"
    local previous_version="$3"

    # Dodajemy dane do pliku, używając sed do znalezienia odpowiedniego miejsca
    # Uwaga: tutaj zakładamy, że plik istnieje i ma już odpowiednie nagłówki oraz stałe wartości HUB_STAGE
    sed -i "/^| $hub_stage /{s|Current version[^|]*|Current version |;s|Previous version[^|]*|Previous version |;s|\$current_version|$current_version|;s|\$previous_version|$previous_version|}" $FILE
}

# Sprawdzenie, czy plik istnieje i inicjalizacja nagłówków, jeśli to konieczne
if [ ! -f "$FILE" ]; then
    echo "| Hub_Stage | Current version | Previous version |" > $FILE
    echo "|------------|-----------------|------------------|" >> $FILE
    echo "| EMEA_E2E   | \$current_version | \$previous_version |" >> $FILE
    echo "| EMEA_PROD  | \$current_version | \$previous_version |" >> $FILE
    echo "| US_E2E     | \$current_version | \$previous_version |" >> $FILE
    echo "| US_PROD    | \$current_version | \$previous_version |" >> $FILE
    echo "| CN_E2E     | \$current_version | \$previous_version |" >> $FILE
    echo "| CN_PROD    | \$current_version | \$previous_version |" >> $FILE
fi

# Wyświetl użytkownikowi możliwe opcje do wyboru
echo "Wybierz HUB_STAGE:"
echo "1) EMEA_E2E"
echo "2) EMEA_PROD"
echo "3) US_E2E"
echo "4) US_PROD"
echo "5) CN_E2E"
echo "6) CN_PROD"
read -p "Wpisz numer opcji: " option

# Przypisz wybraną opcję do zmiennej hub_stage
case $option in
    1) hub_stage="EMEA_E2E" ;;
    2) hub_stage="EMEA_PROD" ;;
    3) hub_stage="US_E2E" ;;
    4) hub_stage="US_PROD" ;;
    5) hub_stage="CN_E2E" ;;
    6) hub_stage="CN_PROD" ;;
    *) echo "Nieprawidłowa opcja"; exit 1 ;;
esac

# Zapytaj użytkownika o dane do aktualizacji
read -p "Podaj aktualną wersję dla $hub_stage: " current_version
read -p "Podaj poprzednią wersję dla $hub_stage: " previous_version

# Zaktualizuj tabelę dla wybranej opcji
update_table "$hub_stage" "$current_version" "$previous_version"

echo "Tabela została zaktualizowana."
