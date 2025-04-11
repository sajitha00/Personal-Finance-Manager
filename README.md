# Personal Finance Manager

A comprehensive mobile application built with Flutter for managing personal finances, tracking expenses, monitoring budgets, and maintaining credit scores.

## Features

### 🔐 Authentication
- Secure sign-in with PIN protection
- Biometric authentication support

### 💰 Financial Management
- **Home Dashboard**: Overview of financial status and quick actions
- **Expense Tracking**: Monitor and categorize daily expenses
- **Income vs Expenses**: Visual comparison through interactive charts
- **Budget Planning**: Set and track budgets for different categories
- **Debt Management**: Track and manage various debts
- **Credit Score**: Monitor and improve credit score

### 📊 Reports & Analytics
- Interactive bar charts for income vs expenses
- Pie charts for expense categorization
- Detailed financial reports and insights

### 🎨 User Interface
- Modern and intuitive design
- Custom splash screen
- Responsive layout
- Material Design implementation

## Technical Requirements

### Prerequisites
- Flutter SDK >=3.2.6 <4.0.0
- Dart SDK >=3.3.0 <4.0.0

### Dependencies
```yaml
flutter_local_notifications: ^17.0.0
fl_chart: ^0.66.2
syncfusion_flutter_charts: ^25.1.35
another_flutter_splash_screen: ^1.2.0
flutter_launcher_icons: ^0.13.1
sqflite: ^2.0.0+4
path_provider: ^2.0.1
local_auth: ^2.2.0
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/Personal-Finance-Manager.git
```

2. Navigate to project directory:
```bash
cd Personal-Finance-Manager
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the application:
```bash
flutter run
```

## Platform Support

- ✅ Android
- ✅ iOS
- ✅ Linux
- ✅ macOS
- ✅ Windows
- ✅ Web

## Project Structure

```
lib/
├── components/
│   ├── BarChart.dart
│   ├── PieChart.dart
│   └── ...
├── screens/
│   ├── home.dart
│   ├── details.dart
│   └── ...
├── data/
│   ├── myExpenses.dart
│   └── ...
└── main.dart
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for the amazing framework
- Contributors and maintainers
- [Syncfusion](https://www.syncfusion.com/) for chart components
- [FL Chart](https://pub.dev/packages/fl_chart) for additional charting capabilities

## Screenshots

### Sign In Screens
![Sign In Screen](https://github.com/sajitha00/Personal-Finance-Manager/assets/115799454/1d050fe3-633c-4d20-85b4-6b6bb2595a65)
![Sign In Screen pin](https://github.com/sajitha00/Personal-Finance-Manager/assets/115799454/2cfd1a9f-95b4-4141-a291-60dc9492af0a)

### Home Screen
![Home V2](https://github.com/sajitha00/Personal-Finance-Manager/assets/115799454/dbe8c7e8-ea53-4bc5-bc90-62bef6d22dad)

### Reports & Budget
![Report](https://github.com/sajitha00/Personal-Finance-Manager/assets/115799454/0421a8bf-38ee-4542-a85f-64105730cff1)
![Budget](https://github.com/sajitha00/Personal-Finance-Manager/assets/115799454/84ec0eac-2a22-4bc9-8697-bc89a207e11e)

### Additional Features
![Debts](https://github.com/sajitha00/Personal-Finance-Manager/assets/115799454/54ad39a0-89cd-4292-93bd-3b0c40218d81)
![Credit Score](https://github.com/sajitha00/Personal-Finance-Manager/assets/115799454/c20de120-2290-456a-8842-83d0d13e0caa)
