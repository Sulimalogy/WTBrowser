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

The **WTFlutter Component Browser** is a Flutter-based application designed to showcase reusable components and their documentation. It dynamically loads component documentation and provides interactive previews for developers to explore and understand how to use the components effectively.

---

## **Features**
- **Dynamic Documentation**: 
  - Documentation is loaded from Markdown files (`.md`) stored in the `lib/docs` directory.
  - Each component has its own detailed documentation, including usage examples and configuration options.
  
- **Interactive Previews**:
  - Components are showcased with multiple configurations to demonstrate their flexibility and usage.

- **Tree View Navigation**:
  - Components and pages are organized in a hierarchical tree structure for easy navigation.

- **Reusable Widgets**:
  - Includes reusable widgets like `CustomLoginForm` with dynamic configurations.

---

## **Folder Structure**
The project is organized as follows:

```
lib/
  browser/
    component_detail_page.dart   # Displays documentation and previews for components
    tree_view_page.dart          # Displays the tree view of components and pages
  docs/
    components/
      authentication/
        login_form.md            # Documentation for the Login Form component
  src/
    components/
      authentication/
        login_form.dart          # Source code for the Login Form component
    services/
      http_service.dart          # Backend service for handling HTTP requests
```

---

## **How It Works**

### **1. Documentation Loading**
- Documentation for each component is stored in Markdown files (`.md`) under the `lib/docs` directory.
- The `ComponentDetailPage` dynamically loads the Markdown file for the selected component using `rootBundle`.

### **2. Component Previews**
- The `_buildPreview` method in `ComponentDetailPage` renders the selected component with multiple configurations to demonstrate its usage.

### **3. Tree View Navigation**
- The `TreeViewPage` displays a hierarchical view of all components and pages, allowing users to navigate and select a component to view its details.

---

## **Getting Started**

### **1. Prerequisites**
- Flutter SDK installed on your machine.
- A code editor like Visual Studio Code or Android Studio.

### **2. Clone the Repository**
```bash
git clone <repository-url>
cd WTFlutter
```

### **3. Install Dependencies**
Run the following command to install the required dependencies:
```bash
flutter pub get
```

### **4. Run the Application**
To run the application on your desired platform:
```bash
flutter run -d chrome
```

---

## **Adding a New Component**

### **1. Create the Component**
Add the component's Dart file under the appropriate folder in `lib/src/components`.

Example:
```dart
// filepath: lib/src/components/authentication/signup_form.dart
class SignupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Signup Form');
  }
}
```

### **2. Add Documentation**
Create a Markdown file for the component in the `lib/docs` directory.

Example:
```markdown
# Signup Form

## Description
The `SignupForm` widget provides a reusable signup form.

## Usage
```dart
SignupForm()
```
```

### **3. Update the Tree View**
Ensure the component is listed in the `generate_structure.dart` file so it appears in the tree view.

---

## **Deployment**

### **Deploy to cPanel**
1. Build the Flutter web app:
   ```bash
   flutter build web
   ```
2. Upload the contents of the `build/web` folder to your cPanel hosting under the `public_html` directory.
3. Configure the `.htaccess` file for proper routing:
   ```apache
   <IfModule mod_rewrite.c>
     RewriteEngine On
     RewriteCond %{REQUEST_FILENAME} !-f
     RewriteCond %{REQUEST_FILENAME} !-d
     RewriteRule ^ index.html [L]
   </IfModule>
   ```

---

## **Contributing**
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with a detailed description of your changes.

---

## **License**
This project is licensed under the Apache 2.0 License. See the `LICENSE` file for details.
