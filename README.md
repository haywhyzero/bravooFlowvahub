# Bravoo

A cross-platform application built with Flutter.

## Author

*   **Ayomide Aregbe**

## Features

*   **Cross-Platform**: Runs on Android, Windows, and Linux.
*   **Authentication**: Powered by Supabase, supporting:
    *   Email and Password sign-up/sign-in.
    *   Password reset.
    *   OAuth with Google and Apple.

## Getting Started

### Prerequisites

*   [Flutter SDK](https://flutter.dev/docs/get-started/install)
*   An IDE like [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### Installation

1.  Clone the repository:
    ```sh
    git clone <https://github.com/haywhyzero/bravooFlowvahub/>
    cd bravoo
    ```

2.  Install dependencies:
    ```sh
    flutter pub get
    ```

### Supabase Configuration

This project uses Supabase for backend services. You'll need to set it up to run the application.

1.  **Create a Supabase Project**
    *   Go to [supabase.com](https://supabase.com) and create a new project.
    *   Navigate to **Project Settings** > **API**.
    *   Find your **Project URL** and `anon` **public** key.

2.  **Configure Environment Variables**
    *   In the root of the project, create a file named `.env`.
    *   Add your Supabase URL and anon key to the `.env` file like this:
        ```
        SUPABASE_URL=YOUR_SUPABASE_URL
        SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
        ```
    *   This file is already listed in `.gitignore` to prevent committing your keys. You will need to modify `lib/main.dart` to load these variables.

3.  **Configure OAuth Providers**
    *   In your Supabase project dashboard, go to **Authentication** > **Providers**.
    *   Enable and configure Google and any other providers you wish to use.
    *   For Google, you will need to provide a **Client ID** and **Client Secret**. Follow the Supabase documentation to get these from the Google Cloud Console.

4.  **Set Redirect URL**
    *   When configuring OAuth providers, you need to specify the redirect URL. This project uses a deep link for the callback.
    *   Add the following URL to the "Redirect URLs" section in your Supabase dashboard authentication settings:
        ```
        io.supabase.com.ayomide.bravoo://login-callback/
        ```
    *   You also need to configure your Android application to handle this deep link. Add the following to your `android/app/src/main/AndroidManifest.xml` inside the `<activity>` tag for `MainActivity`:
        ```xml
        <intent-filter>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.DEFAULT" />
            <category android:name="android.intent.category.BROWSABLE" />
            <data
                android:scheme="io.supabase.com.ayomide.bravoo"
                android:host="login-callback" />
        </intent-filter>
        ```

### Running the Application

```sh
flutter run
```
