# استخدام صورة Node.js
FROM node:18-alpine

# تعيين مجلد العمل في الحاوية
WORKDIR /app

# نسخ package.json و package-lock.json إلى المجلد
COPY package*.json ./

# تثبيت التبعيات
# RUN npm install

# نسخ باقي الملفات إلى الحاوية
COPY . .

# بناء المشروع
RUN npm run build

# فتح المنفذ الذي سيعمل عليه التطبيق
EXPOSE 4000

# تشغيل الخادم
CMD ["npm", "start"]
