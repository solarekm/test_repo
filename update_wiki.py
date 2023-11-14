import os

# Pobierz zmienne środowiskowe
user_id = os.environ['USER_ID']
current_date = os.environ['CURRENT_DATE']
numer_id = os.environ['NUMER_ID']  # Nowa zmienna środowiskowa

wiki_file = 'wiki-update.md'
new_entry = f"| {user_id} | {current_date} | {numer_id} |\n"

# Twórz lub aktualizuj plik Wiki
if not os.path.exists(wiki_file):
    with open(wiki_file, 'w') as file:
        file.write("## Workflow Log\n\n")
        file.write("| User ID | Date | Numer ID |\n")  # Nagłówek tabeli z trzema kolumnami
        file.write("| --- | --- | --- |\n")
        file.write(new_entry)
else:
    with open(wiki_file, 'r+') as file:
        content = file.readlines()
        content.insert(3, new_entry)  # Wstaw nowy wpis pod nagłówkami
        file.seek(0)
        file.writelines(content)
