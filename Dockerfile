FROM python:3.6.8-slim-stretch

WORKDIR /usr/src/app

RUN apt update && apt install -y bash-completion xvfb imagemagick
RUN wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin

COPY requirements.txt .

RUN python -m pip install --target vendor -r requirements.txt

COPY . .

EXPOSE 8083
CMD python cps.py
