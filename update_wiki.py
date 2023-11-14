import os

user_id = os.environ['USER_ID']
current_date = os.environ.get('CURRENT_DATE')  # Zmieniono na os.environ.get dla lepszej obsługi błędów
numer_id = os.environ['NUMER_ID']
github_actor = os.environ['GITHUB_ACTOR']  # Użytkownik, który uruchomił workflow

wiki_file = 'test_repo.wiki/wiki-update.md'

# Tworzenie nowego pliku, jeśli nie istnieje
if not os.path.exists(wiki_file):
    with open(wiki_file, 'w') as file:
        file.write("## Workflow Log\n\n")
        file.write("| Date | GitHub Actor | Numer ID | User ID |\n")
        file.write("| --- | --- | --- | --- |\n")

# Dodawanie nowego wpisu
with open(wiki_file, 'a') as file:
    file.write(f"| {current_date} | {github_actor} | {numer_id} | {user_id} |\n")

