# ElektronMC-Backupper
a no takie tam do robienia backupów elektronowego serwera mc, czy coś\
Poszło na gita, bo poprzednia wersja uległa samozniszczeniu, poprzez źle napisany kod usuwający stare archiwa.\
W teorii powinno działać na *prawie* każdym Linuxie.
# Potrzebne rzeczy
- lftp
- tar
- zstd
- curl (opcjonalnie)

# Co to robi?
Backupy robi.
1. Pobiera pliki z sftp
2. Pakuje je do archwium
3. Usuwa archiwa starsze niż 2 dni
4. Wysyła powiadomienie na [ntfy](https://ntfy.sh)
5. życzy miłego dnia i zakańcza pracę.

Archiwa są pakowane z poziomem kompresji 9 do .tar.zst przy użyciu tar i zstd wielowątkowo.\
Być może i nieidealne, ale działa, także super.
# Jak tego używać?
`cp .config-template .config`\
`vim .config` no i zastąpić zmienne przykładowe na takie działające.\
Potem wpakować do crona lub odpalać ręcznie lub przez coś innego.

Jeżeli, ktoś nie chce używać ntfy, to można uciąć linijkę 27 lub zastąpić czymś innym.

Winc nu.\
Pozdrawiam czy coś