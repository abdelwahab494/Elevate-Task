# Elevate Task

Welcome to the Elevate Task project! This is a Flutter application developed by Abdelwahab, a 23-year-old Electrical Engineering student from Kafr El-Sheikh, Egypt, specializing in Computer Engineering. This project showcases a product listing app with features like category filtering, cart management, and a liked products section.

## Project Overview

This app is designed to fetch products from a public API, display them in a grid view, and allow users to interact with them by adding to cart or marking as liked. It follows the **MVVM (Model-View-ViewModel)** architecture pattern to ensure clean code and maintainability.

## Features

- **Product Listing**: Displays a grid of products fetched from the [Fake Store API](https://fakestoreapi.com/products).
- **Category Filtering**: Allows users to filter products by categories (All, Men's Clothing, Women's Clothing, Electronics, Jewelery).
- **Cart Management**: Users can add products to a cart with a badge showing the cart item count.
- **Liked Products**: Users can like/unlike products, with a dedicated screen to view liked items.
- **Responsive Design**: Utilizes Flutter widgets for a clean and user-friendly interface.

## Technologies Used

- **Flutter**: The core framework for building the cross-platform app.
- **Dart**: The programming language used for app logic and UI.
- **Provider**: State management library to implement MVVM.
- **HTTP**: For making API calls to fetch product data.
- **Gap**: A package for adding consistent spacing between widgets.
- **MVVM Architecture**: Structured the app into Models, ViewModels, and Views for better organization.

## Project Structure

The `lib` folder is organized as follows:

- **`models/`**: Contains data models.
  - `product_model.dart`: Defines `ProductModel` classe for product data parsing from JSON.
  - `rating_model.dart`: Defines `Rating` classe for rating data parsing from JSON.
- **`viewmodels/`**: Holds ViewModel classes for state management.
  - `cart_viewmodel.dart`: Manages the cart list and notifies UI changes.
  - `likes_viewmodel.dart`: Handles the liked products list with toggle functionality.
  - `product_viewmodel.dart`: Manages product fetching, category filtering, and state.
- **`views/`**: Contains the UI screens.
  - `product_list_screen.dart`: The main screen displaying products with filtering and interaction options.
  - `liked_screen.dart`: A screen to view and manage liked products.
  - `cart_screen.dart`: A screen to view and manage products that added to cart.
- **`services/`**: Includes API service logic.
  - `product_service.dart`: Fetches product data from the Fake Store API.
- **`main.dart`**: The entry point of the app, setting up providers and the root widget.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/abdelwahab494/Elevate-Task.git
   ```
2. Navigate to the project directory:
   ```bash
   cd Elevate-Task
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Usage
- Open the app to see a list of products.
- Use the category row at the top to filter products.
- Tap the heart icon to like/unlike a product, and navigate to the "Liked Products" screen via the app bar.
- Add products to the cart using the "+" icon, and check the cart badge in the app bar.

## Screenshots

<p float="left">
  <img src="assets\screenshots\homescreen1.png" width="200"/>
  &nbsp;&nbsp;
  <img src="assets\screenshots\homescreen2.png" width="200"/>
  &nbsp;&nbsp;
  <img src="assets\screenshots\filteredscreen.png" width="200"/>
  &nbsp;&nbsp;
  <img src="assets\screenshots\cartscreen.png" width="200"/>
  &nbsp;&nbsp;
  <img src="assets\screenshots\likesscreen.png" width="200"/>
</p>

## Future Improvements
- Add a search functionality to filter products by name.
- Implement a detailed product view screen.
- Enhance the UI with animations or custom themes.
- Add offline support for product data.

## Contributing
Feel free to fork this repository, submit issues, or send pull requests. Any suggestions to improve the project are welcome!

## Acknowledgements
- Thanks to the [Fake Store API](https://fakestoreapi.com/products) for providing sample product data.
- Special thanks to the Flutter community for the amazing tools and packages!
- Thanks to Elevate Flutter Team for giving me this challenging task.

#### Made with ❤️ by Abdelwahab from Kafr El-Sheikh, Egypt.