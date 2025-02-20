# Watch Todo App

## Project Description
The **Watch Todo App** is an iOS smartwatch application designed to manage and display notes in a simple and intuitive way. It allows users to create, view, and delete notes, with a flexible line count for displaying notes, making it suitable for small screen devices such as the Apple Watch. This app also includes settings for customizing the note display and credits for the developer.

## Features
- **Create Notes**: Add new notes quickly with a simple input field and save them locally.
- **View Notes**: List all created notes with an option to view their details in a separate view.
- **Delete Notes**: Delete any note by swiping it off the list.
- **Settings**: Customize the number of lines per note that are displayed in the list.
- **Credits**: View credits for the developer with a profile image and name.
- **Persistent Storage**: The app saves and loads notes locally using JSON encoding and decoding, ensuring that notes persist between app launches.

## Files and Structure
- **`Note.swift`**: Defines the structure of a note with a unique identifier (`UUID`) and a `text` property.
- **`HeaderView.swift`**: Displays a header with a title and a separator, used across multiple views.
- **`ContentView.swift`**: Main screen of the app where users can add and view notes.
- **`CreditsView.swift`**: Displays the developer's information and image.
- **`DetailView.swift`**: View showing the detailed content of a selected note.
- **`SettingsView.swift`**: Allows users to adjust settings such as the number of lines shown for each note.

## Installation

### Prerequisites
To run the **Watch Todo App**, you will need:

- **Xcode** (Latest version recommended)
  - Xcode is available for free on the Mac App Store.
- A **Mac machine** or **macOS Virtual Machine** (since Xcode can only run on macOS).

### Steps to Run the App
1. Clone this repository:
   ```bash
   git clone https://github.com/Queen-Sarah21/Watch-Todo-App.git

