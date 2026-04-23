# Lab 1: Setup the Environment

## Introduction
Prepare your local machine with the core tools needed to build and enhance the CRM application.

### Objectives
- Install Visual Studio Code on the local machine.
- Install the Codex and SQL Developer extensions required for APEX development.

Estimated Time: 15 minutes

## Task 1: Install VS Code on your local machine
1. Open a browser and go to the Visual Studio Code download page at `https://code.visualstudio.com/Download`.
    ![Visual Studio Code download page highlighting platform options](images/vscode-download-page.png)
2. Choose the installer that matches your operating system (Windows, macOS, or Linux) and start the download.
    ![Visual Studio Code platform-specific installer options](images/vscode-select-installer.png)
3. Run the downloaded installer and accept the default prompts to complete the installation.
    ![Visual Studio Code installer prompts displaying default settings](images/vscode-installer-options.png)
4. Launch Visual Studio Code to confirm it opens successfully and pin it to your taskbar or dock for quick access.
    ![Visual Studio Code first launch window with welcome screen](images/vscode-first-launch.png)

## Task 2: Install the extensions
1. In Visual Studio Code, open the Extensions view (`View` > `Extensions`) and search for `Codex`.
    ![Visual Studio Code Extensions view focused on search bar](images/vscode-open-extensions-view.png)
2. Select the Codex extension, click `Install`, then press `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (macOS) and run `Codex: Set API Key` to paste your API key.
    ![Codex extension page showing install button and API key command palette entry](images/codex-set-api-key.png)
3. While still in the Extensions view, search for the SQL Developer extension and install it.
    ![Visual Studio Code Extensions view displaying SQL Developer extension listing](images/vscode-sql-developer-extension.png)
4. After installation, use the SQL Developer extension command palette entries to add a new connection, supplying the credentials for your APEX Workspace schema so the extension can reach the correct tenancy workspace.
    ![SQL Developer extension new connection dialog with APEX workspace fields](images/sql-developer-new-connection.png)

## Acknowledgements
- **Author** - Apoorva Srinivas, Prinicpal Product Manager
- **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, April 2026
