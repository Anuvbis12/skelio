---
name: skelio-biomechanics
description: >-
  Analyze, calibrate, and troubleshoot biomechanical fitness tracking in SKELIO, including YOLOv11-Pose keypoints, homography perspective correction, kinematic joint angle calculation, and repetition counting state machines for push-ups and squats.
---

# SKELIO Biomechanical Analytics Skill

This skill provides operational knowledge and procedures for evaluating, calibrating, and extending the biomechanical analysis pipeline in SKELIO.

## 1. Keypoint Mapping (COCO-17 via YOLOv11-Pose)

YOLOv11-Pose outputs 17 keypoints with $(x, y, \text{confidence})$:
- 0: Nose, 1: Left Eye, 2: Right Eye, 3: Left Ear, 4: Right Ear
- 5: Left Shoulder, 6: Right Shoulder
- 7: Left Elbow, 8: Right Elbow
- 9: Left Wrist, 10: Right Wrist
- 11: Left Hip, 12: Right Hip
- 13: Left Knee, 14: Right Knee
- 15: Left Ankle, 16: Right Ankle

## 2. 2D & 3D Kinematic Angle Calculation

Joint angle between three consecutive keypoints $A$, $B$ (vertex), and $C$:
$$\mathbf{u} = A - B, \quad \mathbf{v} = C - B$$
$$\theta = \arccos\left(\frac{\mathbf{u} \cdot \mathbf{v}}{\|\mathbf{u}\| \|\mathbf{v}\|}\right) \times \frac{180}{\pi}$$

### Angle Targets by Exercise Type:
- **Push-up**:
  - `primary_angle`: Elbow joint ($A = \text{Shoulder}$, $B = \text{Elbow}$, $C = \text{Wrist}$).
    - Extension / Up: $\ge 150^\circ$
    - Full Flexion / Down: $\le 90^\circ$ (Inflection depth threshold)
  - `posture_angle`: Spine line ($A = \text{Shoulder}$, $B = \text{Hip}$, $C = \text{Ankle}$).
    - Correct: $\ge 160^\circ$ (Straight plank)
    - Sagging / Pike penalty: $< 160^\circ$
- **Squat**:
  - `primary_angle`: Knee joint ($A = \text{Hip}$, $B = \text{Knee}$, $C = \text{Ankle}$).
    - Extension / Up: $\ge 160^\circ$
    - Full Squat / Down: $\le 95^\circ$
  - `posture_angle`: Torso uprightness ($A = \text{Shoulder}$, $B = \text{Hip}$, $C = \text{Knee}$).

## 3. Homography Perspective Correction

To remove optical distortion caused by camera tilt angle $\alpha$ and height $h$:
- Homography matrix $H \in \mathbb{R}^{3 \times 3}$ projects pixel points $(u, v, 1)^T$ to metric ground-plane coordinates $(X, Y, 1)^T$:
  $$\begin{bmatrix} X' \\ Y' \\ W \end{bmatrix} = H \begin{bmatrix} u \\ v \\ 1 \end{bmatrix}, \quad X = \frac{X'}{W}, \quad Y = \frac{Y'}{W}$$
- Real-world depth calculation prevents false rep detection caused by distance to lens.

## 4. Repetition State Machine Logic

```
   [STATE_UP] (Angle > 150°)
       │
       ▼ (User descends: Angle < 120°)
  [STATE_TRANSITION_DOWN]
       │
       ▼ (Inflection reached: Angle <= 90°)
  [STATE_DOWN] (Flag: valid_depth = True)
       │
       ▼ (User ascends: Angle > 120°)
  [STATE_TRANSITION_UP]
       │
       ▼ (Lockout reached: Angle >= 150°)
  [STATE_REP_COMPLETE]
       │
       ├── Check: min_duration >= 0.8s (Debounce)
       ├── Check: posture_angle >= 160° throughout rep
       └── Increment: valid_reps += 1 (or invalid_reps += 1)
```

## 5. Verification & Testing Commands

To run single video evaluation in terminal:
```powershell
py -3.11 core/biomechanical_pipeline.py --source dataset/pushup_sample.mp4 --exercise pushup --output output_demo/pushup_result.mp4
```
