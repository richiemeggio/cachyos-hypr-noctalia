cp -r ~/.config/hypr ~/.config/noctalia ./etc/skel/.config/
git remote set-url origin git@github.com:richiemeggio/cachyos-hypr-noctalia.git
git add ./etc/skel/.config/hypr ./etc/skel/.config/noctalia
git commit -m "push custom settings"
git push origin custom