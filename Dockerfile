FROM node:18-buster

# تثبيت الأدوات الأساسية مثل bash و curl وتثبيت TypeScript بشكل عالمي
RUN apt-get update && apt-get install -y bash curl && npm install -g typescript

# تعيين دليل العمل داخل الحاوية
WORKDIR /app

# نسخ ملفات package.json و package-lock.json
COPY package*.json ./

# تثبيت الاعتماديات
RUN npm install

# نسخ جميع الملفات من الجهاز المضيف إلى الحاوية
COPY . .

# بناء المشروع باستخدام الأمر المحدد في package.json
RUN npm run build

# تحديد المنفذ الذي سيعمل عليه التطبيق
EXPOSE 4000

# تشغيل التطبيق
CMD ["npm", "start"]
