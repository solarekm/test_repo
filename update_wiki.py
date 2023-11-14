import os

user_id = os.environ['USER_ID']
current_date = os.environ['CURRENT_DATE']
numer_id = os.environ['NUMER_ID']

wiki_file = 'test_repo.wiki/wiki-update.md'

# Tworzenie nowego pliku, jeśli nie istnieje
if not os.path.exists(wiki_file):
    with open(wiki_file, 'w') as file:
        file.write("## Workflow Log\n\n")
        file.write("| User ID | Date | Numer ID |\n")
        file.write("| --- | --- | --- |\n")

# Dodawanie nowego wpisu
with open(wiki_file, 'a') as file:
    file.write(f"| {user_id} | {current_date} | {numer_id} |\n")
