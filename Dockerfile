# Gunakan image Python 3 sebagai dasar
FROM python:3

# Set direktori kerja (working directory) ke /app
WORKDIR /app

# Salin berkas requirements.txt ke dalam image
COPY requirements.txt .

# Instal dependensi dari requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Salin seluruh konten dari direktori proyek ke dalam image
COPY . .

# Expose port 5000 untuk Flask
EXPOSE 5001

# Jalankan aplikasi Flask menggunakan Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5001", "app:app"]