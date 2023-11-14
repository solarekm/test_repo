import os

user_id = os.environ['USER_ID']
current_date = os.environ.get('CURRENT_DATE')  # Użyj os.environ.get dla bezpieczeństwa
numer_id = os.environ['NUMER_ID']
github_actor = os.environ['GITHUB_ACTOR']

wiki_file = 'test_repo.wiki/wiki-update.md'

new_entry = f"| {user_id} | {current_date} | {numer_id} | {github_actor} |\n"

# Sprawdzanie istnienia pliku i odczytywanie zawartości
if os.path.exists(wiki_file):
    with open(wiki_file, 'r') as file:
        content = file.readlines()
else:
    content = ["## Workflow Log\n\n", "| User ID | Date | Numer ID | GitHub Actor |\n", "| --- | --- | --- | --- |\n"]

# Dodawanie nowego wpisu na początku tabeli (po nagłówkach)
content.insert(3, new_entry)

# Zapisywanie zaktualizowanej zawartości do pliku
with open(wiki_file, 'w') as file:
    file.writelines(content)
