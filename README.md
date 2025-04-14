# 📱 Mobile App User Experience Analysis

This project focuses on analyzing user experience data from a mobile application. It uses SQL, Power BI, and Excel to uncover patterns related to app crashes, session duration, feedback types, device differences, and user satisfaction across states.

---

## 📌 Project Objectives

- Identify which app sections perform best and worst in terms of user ratings.
- Analyze the impact of crashes on user experience.
- Explore differences in experience between Android and iOS users.
- Investigate regional trends in app usage and satisfaction.
- Derive actionable insights to improve mobile UX and reduce crash rates.

---

## 🧾 Dataset Overview

The dataset contains **5,000 user sessions** with the following columns:

| Column Name            | Description                                      |
|------------------------|--------------------------------------------------|
| `user_id`              | Unique identifier for each user                  |
| `state`                | User's state (location)                          |
| `device_type`          | Android or iOS                                   |
| `app_section`          | Section of the app used (e.g., Home, Search)     |
| `experience_rating`    | User rating for the session (1–5 scale)          |
| `feedback_tag`         | Feedback type (e.g., Slow Loading, Great UI)     |
| `session_duration_sec` | Duration of session in seconds                   |
| `is_crash`             | Indicates whether a crash occurred (1 = Yes)     |

---

## ❓ Business Questions Answered

- Which app section has the highest and lowest ratings?
- Which app section has the most sessions?
- How does average rating vary by state?
- Do crashes correlate with lower ratings?
- Which device type experiences more crashes?
- Are there rating differences between Android and iOS users?
- Which feedback tags are most associated with crashes or low ratings?
- Which state has the happiest users?
- What are the session duration trends by section and device?

---

## 🛠️ Tools Used

- **SQL** – For querying and slicing the dataset based on analysis needs.
- **Power BI** – For building interactive dashboards and visualizing insights.
- **Excel** – For initial data inspection and supporting calculations.

---

## 📊 Power BI Dashboard Features

The interactive Power BI report (`New_MobileappUX.pbix`) includes:

- KPI Cards: Crash Rate, Avg Rating, Avg Session Duration
- Bar Charts: App Section vs. Avg Rating, Crash Count by State
- Pie Charts: Device Type Usage, Crash Distribution
- Slicers/Filters: App Section, Device, State, Rating Range

---


