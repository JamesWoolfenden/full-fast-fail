FROM python:3@sha256:0ba001803c72c128063cfa88863755f905cefabe73c026c66a5a86d8f1d63e98 # 3
RUN pip install --upgrade pip && \
    pip install nibabel pydicom matplotlib pillow && \
    pip install med2image
CMD ["cat", "/etc/os-release"]

FROM python:3.1
RUN pip install --upgrade pip
RUN python -m pip install nibabel pydicom matplotlib pillow
RUN pip3 install requests=2.7.0
RUN ["pip3", "install", "requests=2.7.0"]
CMD ["cat", "/etc/os-release"]
