FROM python:3.9-bookworm

RUN pip install --user pipenv

WORKDIR /app
COPY .
RUN /root/.local/bin/pipenv install
RUN /root/.local/bin/pipenv run alembic upgrade head
RUN cp config-example.json config.json

CMD ["/root/.local/bin/pipenv", "run", "python", "-m", "monitor"]