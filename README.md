# Automatic Godot SpriteFrames Generator

A **Godot** tool to automate the entire process of creating **Godot SpriteFrames** resources with **Blender** renders made from 3D models.

## Content
[1. Tool Description](#1-tool-description)  
[2. Tool Requirements](#2-tool-requirements)  
[3. Project Development](#3-project-development)  
&nbsp;&nbsp;&nbsp;&nbsp;[3.1. Summary](#31-summary)  
&nbsp;&nbsp;&nbsp;&nbsp;[3.2. Requirements Model](#32-requirements-model)

## 1. Tool Description

The tool is focused on easing the entire process of creating **Godot SpriteFrames** resources in **Godot**. To do this, it is considered that the process starts with rendering 3D models with **Blender**. Then the resulting renders can be optionally scaled to reduce their size. Later, all the renders are organized according to the parameters given by the user. Finally, the organized renders are used to create a complete **SpriteFrame** resource that is exported as a **.tres** file.

## 2. Tool Requirements

The Automatic Godot SpriteFrames Generator needs a runnable version of **Blender**. Specifically, **Blender 3.2** version was used during the development process. Portable versions of Blender are admitted too. It is only necessary to provided the **Blender path** to execute its commands.

## 3. Project Development

### 3.1. Summary

A pseudo *Cascade Process* was used to implement the tool. For this reason, the obtained models during the process are presented below. In this context, the entire process has been made as a *practical exercise* of a traditional methodology.

### 3.2. Requirements Model

Four functional requirements have been identified for the tool. These requirements are included in the corresponding Use Case Diagram.

<details>
<summary>Use Case Diagram - Automatic Godot SpriteFrames Generator</summary>

![Use Case Diagram - Automatic Godot SpriteFrames Generator](./documentation/models/requirements/use-case-diagram_automatic-godot-spriteframes-generator.jpg)
</details>

For each use case identified, the respective Activity Diagram has been made, showing the normal flow of actions that are executed.

<details>
<summary>Activity Diagram - Render Blender Models</summary>

![Activity Diagram - Render Blender Models](./documentation/models/requirements/activity-diagram_render-blender-models.jpg)
</details>

<details>
<summary>Activity Diagram - Scale Renders</summary>

![Activity Diagram - Scale Renders](./documentation/models/requirements/activity-diagram_scale-renders.jpg)
</details>

<details>
<summary>Activity Diagram - Organize Renders</summary>

![Activity Diagram - Organize Renders](./documentation/models/requirements/activity-diagram_organize-renders.jpg)
</details>

<details>
<summary>Activity Diagram - Create Godot SpriteFrame</summary>

![Activity Diagram - Create Godot SpriteFrame](./documentation/models/requirements/activity-diagram_create-godot-spriteframes.jpg)
</details>
