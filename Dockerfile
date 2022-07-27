FROM python:3

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir mkdocs

COPY scripts/mkdocs.sh /usr/local/bin

RUN chmod +x /usr/local/bin/mkdocs.sh

ENTRYPOINT [ "/usr/local/bin/mkdocs.sh" ]