## Installation Guide

1. **Copy the Folder**  
   Copy the `Precision-Timing-Skill-Check-main` directory into the root folder of your Godot project (`res://`).

2. **Configure Global Autoload (Singleton)**  
   To enable global event routing, set up the singleton event bus:
   - Go to **Project -> Project Settings -> Autoload**.
   - In the **Path** field, select:  
	 `res://addons/Precision-Timing-Skill-Check-main/Globals/SingletonSkillCheck.gd`
   - In the **Node Name** field, type exactly: **`SingletonSkillCheck`**
   - Click **Add** and close the window.

3. **Ready to Use!**  
   You can now drag and drop demo scenes or instantiate the components directly into your game.
