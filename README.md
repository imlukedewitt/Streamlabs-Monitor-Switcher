# Streamlabs-Multi-Monitor-Switcher
Autohotkey script to switch displays in Streamlabs based on mouse position. This script is intended for usage with Cubase and Streamlabs, but can be easily edited for use in other applications. Streamlabs can't identify secondary Cubase windows, so a focus-check is needed to switch between display capture and window capture. This prevents accidental streaming of applications outside Cubase.

# Script flow
1. Set up 3 scenes in Streamlabs: Display 1, display 2, and Cubase main window. 
2. If Cubase is in focus, follow mouse position. If mouse moves to Display n, send hotkey for corresponding Streamlabs scene.
3. If Cubase looses focus, send hotkey for Streamlabs Cubase window scene and stop tracking mouse.
