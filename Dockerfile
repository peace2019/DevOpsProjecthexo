# استخدام صورة Node.js 18
FROM node:18-alpine

# تثبيت الأدوات الأساسية مثل bash و curl
RUN apk add --no-cache bash curl

# تعيين دليل العمل داخل الحاوية
WORKDIR /app

# نسخ ملفات package.json و package-lock.json
COPY package*.json ./

# تثبيت الاعتماديات
RUN npm install

# تثبيت TypeScript بشكل عالمي
RUN npm install -g typescript

# نسخ جميع الملفات من الجهاز المضيف إلى الحاوية
COPY . .

# بناء المشروع باستخدام الأمر المحدد في package.json
RUN npm run build

# تحديد المنفذ الذي سيعمل عليه التطبيق
EXPOSE 4000

# تشغيل التطبيق
CMD ["npm", "start"]
