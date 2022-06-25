# Automatic Godot SpriteFrames Generator

A **Godot** tool to automate the entire process of creating **Godot SpriteFrames** resources with **Blender** renders as animation frames.

## Content
[1. Description](#1-description)  
[2. Requirements](#2-requirements)  
[3. Project Development](#3-project-development)  
&nbsp;&nbsp;&nbsp;&nbsp;[3.1. Summary](#31-summary)  
&nbsp;&nbsp;&nbsp;&nbsp;[3.2. Requirements Model](#32-requirements-model)  
&nbsp;&nbsp;&nbsp;&nbsp;[3.3. Analysis Model](#33-analysis-model)

## 1. Description

The tool is focused on easing the entire process of creating **Godot SpriteFrames** resources in **Godot**. To do this, it is considered that the process starts with rendering 3D models with **Blender**. Then the resulting renders can be optionally scaled to reduce their size. Later, all the renders are organized according to the parameters given by the user. Finally, the organized renders are used to create a complete **SpriteFrame** resource that is exported as a **.tres** file.

## 2. Requirements

The Automatic Godot SpriteFrames Generator needs a runnable version of **Blender**. Specifically, **Blender 3.2** version was used during the development process. Portable versions of Blender are admitted too. It is only necessary to provided the **Blender path** to execute its commands.

## 3. Project Development

### 3.1. Summary

A pseudo *Cascade Process* was used to implement the tool. For this reason, the obtained models during the process are presented below. In this context, the entire process has been made as a *practical exercise* of a traditional methodology.

### 3.2. Requirements Model

<!-- use case diagram -->

Four functional requirements were identified for the tool. The first one is related to the **scenes rendering process** done with Blender engine. The second one corresponds to the optional **process of scaling renders**. The third one is related to the **renders organizing process**, in which folders are created to organize renders by animation. Finally, the fourth one corresponds to the **process of creating SpriteFrames** resources by adding animations with renders as animation frames.

These requirements are included in the corresponding *Use Case Diagram*.

<details>
<summary>Use Case Diagram - Automatic Godot SpriteFrames Generator</summary>

![Use Case Diagram - Automatic Godot SpriteFrames Generator](./documentation/models/requirements/use-case-diagram_automatic-godot-spriteframes-generator.jpg)
</details>

<!-- activity diagrams -->

For each use case identified, the respective *Activity Diagram* was made, showing the normal flow of actions that are executed.

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

### 3.3. Analysis Model

<!-- robustness diagram -->

To conceptualize the workflow of the Automatic Godot SpriteFrames Generator, a *Robustness Diagram* was made to show all the entities that collaborate in the realization of the functional requirements.

<details>
<summary>Robustness Diagram - Automatic Godot SpriteFrames Generator</summary>

![Robustness Diagram - Automatic Godot SpriteFrames Generator](./documentation/models/analysis/robustness-diagram_automatic-godot-spriteframes-generator.jpg)
</details>

The specific workflow used to satisfy each functional requirement is outlined in the created *Collaboration Diagrams*. It is important to mention that the diagrams show conceptual representations of the processes used to satisfy the requirements.

<!-- collaboration diagrams -->

<details>
<summary>Collaboration Diagram - Render Blender Models</summary>

![Collaboration Diagram - Render Blender Models](./documentation/models/analysis/collaboration-diagram_render-blender-models.jpg)
</details>

<details>
<summary>Collaboration Diagram - Scale Renders</summary>

![Collaboration Diagram - Scale Renders](./documentation/models/analysis/collaboration-diagram_scale-renders.jpg)
</details>

<details>
<summary>Collaboration Diagram - Organize Renders</summary>

![Collaboration Diagram - Organize Renders](./documentation/models/analysis/collaboration-diagram_organize-renders.jpg)
</details>

<details>
<summary>Collaboration Diagram - Create Godot SpriteFrames</summary>

![Collaboration Diagram - Create Godot SpriteFrames](./documentation/models/analysis/collaboration-diagram_create-godot-spriteframes.jpg)
</details>
