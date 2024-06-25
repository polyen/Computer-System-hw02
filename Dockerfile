FROM python
ENV APP_NAME /app
WORKDIR $APP_NAME
COPY . .
RUN pip install -r requirements.txt 
EXPOSE 8000
ENTRYPOINT [ "python", "main.py"]