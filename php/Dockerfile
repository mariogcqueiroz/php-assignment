FROM dmstr/latest-nginx


RUN composer install
RUN pip install -r /tmp/requirements.txt

EXPOSE 8000
CMD python index.py
