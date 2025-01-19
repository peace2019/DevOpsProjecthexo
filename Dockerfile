FROM node:16

# إعداد المجلد الأساسي داخل الحاوية
WORKDIR /usr/src/app

# نسخ ملفات الحزم
COPY package*.json ./

# تثبيت التبعيات
RUN npm install

# نسخ باقي الملفات
COPY . .

# بناء المشروع
RUN hexo generate

# تعريض البورت 4000
EXPOSE 4000

# تشغيل الخادم
CMD ["hexo", "server"]
