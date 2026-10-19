FROM docker.io/cachyos/cachyos-v4:latest

RUN sed -i 's/-v4]/-znver4]/' /etc/pacman.conf && \
    pacman -Sy --noconfirm && \
    yes | pacman -Scc --noconfirm && \
    rm -rf /var/lib/pacman/sync/* && \
    find /var/cache/pacman/ -type f -delete && \
    pacman -Sy && \
    pacman -Qqn | pacman -S --noconfirm - && \
    pacman -Suuyy --noconfirm && \
    pacman -Syu --noconfirm && \
    yes | pacman -Scc --noconfirm && \
    rm -rf /var/lib/pacman/sync/* && \
    find /var/cache/pacman/ -type f -delete
