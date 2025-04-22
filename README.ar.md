<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# WTFlutter Component Browser

🌐 **Available Languages**:
- [English](README.md)
- [العربية (Arabic)](README.ar.md)

# متصفح مكونات WTFlutter

**متصفح مكونات WTFlutter** هو تطبيق مبني باستخدام Flutter يهدف إلى عرض المكونات القابلة لإعادة الاستخدام وتوثيقها. يقوم بتحميل التوثيق الخاص بالمكونات ديناميكيًا ويوفر معاينات تفاعلية للمطورين لاستكشاف وفهم كيفية استخدام المكونات بشكل فعال.

---

## **الميزات**
- **توثيق ديناميكي**: 
  - يتم تحميل التوثيق من ملفات Markdown (`.md`) المخزنة في دليل `lib/docs`.
  - يحتوي كل مكون على توثيق مفصل خاص به، بما في ذلك أمثلة الاستخدام وخيارات التكوين.
  
- **معاينات تفاعلية**:
  - يتم عرض المكونات بتكوينات متعددة لإظهار مرونتها وكيفية استخدامها.

- **تنقل عبر شجرة العرض**:
  - يتم تنظيم المكونات والصفحات في هيكل شجري هرمي لتسهيل التنقل.

- **مكونات قابلة لإعادة الاستخدام**:
  - يتضمن مكونات قابلة لإعادة الاستخدام مثل `CustomLoginForm` مع تكوينات ديناميكية.

---

## **هيكل المجلدات**
يتم تنظيم المشروع كالتالي:

```
lib/
  browser/
    component_detail_page.dart   # يعرض التوثيق والمعاينات للمكونات
    tree_view_page.dart          # يعرض شجرة العرض للمكونات والصفحات
  docs/
    components/
      authentication/
        login_form.md            # التوثيق الخاص بمكون نموذج تسجيل الدخول
  src/
    components/
      authentication/
        login_form.dart          # الكود المصدري لمكون نموذج تسجيل الدخول
    services/
      http_service.dart          # خدمة الخلفية لمعالجة طلبات HTTP
```

---

## **كيف يعمل**

### **1. تحميل التوثيق**
- يتم تخزين التوثيق الخاص بكل مكون في ملفات Markdown (`.md`) داخل دليل `lib/docs`.
- يقوم `ComponentDetailPage` بتحميل ملف Markdown الخاص بالمكون المحدد ديناميكيًا باستخدام `rootBundle`.

### **2. معاينات المكونات**
- يقوم الأسلوب `_buildPreview` في `ComponentDetailPage` بعرض المكون المحدد بتكوينات متعددة لإظهار كيفية استخدامه.

### **3. التنقل عبر شجرة العرض**
- يعرض `TreeViewPage` عرضًا هرميًا لجميع المكونات والصفحات، مما يسمح للمستخدمين بالتنقل وتحديد مكون لعرض تفاصيله.

---

## **البدء**

### **1. المتطلبات الأساسية**
- تثبيت Flutter SDK على جهازك.
- محرر كود مثل Visual Studio Code أو Android Studio.

### **2. استنساخ المستودع**
```bash
git clone <repository-url>
cd WTFlutter
```

### **3. تثبيت التبعيات**
قم بتشغيل الأمر التالي لتثبيت التبعيات المطلوبة:
```bash
flutter pub get
```

### **4. تشغيل التطبيق**
لتشغيل التطبيق على المنصة المطلوبة:
```bash
flutter run -d chrome
```

---

## **إضافة مكون جديد**

### **1. إنشاء المكون**
أضف ملف Dart الخاص بالمكون ضمن المجلد المناسب في `lib/src/components`.

مثال:
```dart
// filepath: lib/src/components/authentication/signup_form.dart
class SignupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Signup Form');
  }
}
```

### **2. إضافة التوثيق**
قم بإنشاء ملف Markdown للمكون في دليل `lib/docs`.

مثال:
```markdown
# نموذج التسجيل

## الوصف
يوفر مكون `SignupForm` نموذج تسجيل قابل لإعادة الاستخدام.

## الاستخدام
```dart
SignupForm()
```
```

### **3. تحديث شجرة العرض**
تأكد من إدراج المكون في ملف `generate_structure.dart` ليظهر في شجرة العرض.

---

## **النشر**

### **النشر على cPanel**
1. قم ببناء تطبيق Flutter للويب:
   ```bash
   flutter build web
   ```
2. قم برفع محتويات مجلد `build/web` إلى استضافة cPanel ضمن دليل `public_html`.
3. قم بتكوين ملف `.htaccess` للتوجيه الصحيح:
   ```apache
   <IfModule mod_rewrite.c>
     RewriteEngine On
     RewriteCond %{REQUEST_FILENAME} !-f
     RewriteCond %{REQUEST_FILENAME} !-د
     RewriteRule ^ index.html [L]
   </IfModule>
   ```

---

## **المساهمة**
المساهمات مرحب بها! للمساهمة:
1. قم بعمل Fork للمستودع.
2. أنشئ فرعًا جديدًا لميزتك أو إصلاح الخطأ.
3. أرسل طلب سحب مع وصف مفصل للتغييرات التي أجريتها.

---

## **الترخيص**
هذا المشروع مرخص بموجب ترخيص Apache 2.0. راجع ملف `LICENSE` للحصول على التفاصيل.

---
