# 1. Alap image kiválasztása
# Egy karcsú, előre telepített Python 3.9 környezetből indulunk ki.
FROM python:3.9-slim

# 2. Munkakönyvtár beállítása a konténeren belül
# A további parancsok ebben a könyvtárban fognak lefutni.
WORKDIR /app

# 3. Függőségek telepítése
# Először csak a requirements fájlt másoljuk be és telepítjük.
# Így a Docker gyorsítótárazza ezt a réteget, és nem telepít feleslegesen minden kódmódosításnál.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Az alkalmazás kódjának bemásolása
COPY . .

# 5. Port megadása
# Jelezzük, hogy a konténer az 5000-es porton fog figyelni.
EXPOSE 5000

# 6. A konténer indítási parancsa
# Ez a parancs fut le, amikor a konténer elindul.
CMD ["python", "app.py"]
