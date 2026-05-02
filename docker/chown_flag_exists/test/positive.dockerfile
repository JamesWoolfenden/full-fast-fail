FROM python:3.7@sha256:eedf63967cdb57d8214db38ce21f105003ed4e4d0358f02bedc057341bcf92a0 # 3.7
RUN pip install Flask==0.11.1
RUN useradd -ms /bin/bash patrick
COPY --chown=patrick:patrick app /app
WORKDIR /app
USER patrick
CMD ["python", "app.py"]
