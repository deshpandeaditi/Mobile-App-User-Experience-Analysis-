CREATE TABLE mobileapp_ux (
    user_id VARCHAR(50),
    state VARCHAR(100),
    device_type VARCHAR(20),
    app_section VARCHAR(50),
    experience_rating INT,
    feedback_tag VARCHAR(100),
    session_duration_sec INT,
    is_crash TINYINT(1)
);

-- 1. Which app section receives the highest and lowest average ratings overall? 
-- highest
select app_section , ROUND(AVG(experience_rating),2) AS avg_rating from mobileapp_ux
group by app_section
order by avg_rating DESC
LIMIT 1;

-- lowest
select app_section , ROUND(AVG(experience_rating),2) AS avg_rating from mobileapp_ux
group by app_section
order by avg_rating 
LIMIT 1;

-- 2. Which app section has the highest number of user interactions (count of sessions)?
SELECT app_section, 
       COUNT(*) AS session_count
FROM mobileapp_ux
GROUP BY app_section
ORDER BY session_count DESC
LIMIT 1;

-- 3.How does the average rating vary by state?
select state , avg(experience_rating) as avg_rating from mobileapp_ux
group by state
order by avg_rating desc;

-- 4.Do users who experience crashes leave lower ratings consistently across all states?
SELECT 
    state,
    is_crash,
    AVG(experience_rating) AS avg_rating
FROM mobileapp_ux
GROUP BY state, is_crash
ORDER BY state, is_crash;

-- 5. Which device type tends to experience more crashes?
SELECT device_type, 
       SUM(is_crash) AS total_crashes
FROM mobileapp_ux
GROUP BY device_type
ORDER BY total_crashes DESC;

-- 6.Is there a significant rating difference for the same app section between Android and iOS users?
select app_section, device_type , COUNT(*) from mobileapp_ux
group by app_section,device_type
ORDER BY app_section, device_type;

    
-- 7. Are there differences in ratings between Android and iOS users?
select device_type , avg(experience_rating) from mobileapp_ux
group by device_type;

-- 8.Is there any relationship between app crashes and low ratings? 
SELECT 
    CASE 
        WHEN is_crash = 1 THEN 'Crash'
        ELSE 'No Crash'
    END AS crash_status,
    AVG(experience_rating) AS avg_rating
FROM mobileapp_ux
GROUP BY is_crash;

-- 9 .Which state has the most satisfied users?
select state , ROUND(AVG(experience_rating),2)as rating from mobileapp_ux
group by state
ORDER BY rating DESC
LIMIT 1;

-- 10.Which states experience the most crashes

SELECT 
    state,
    SUM(is_crash) AS total_crashes
FROM mobileapp_ux
GROUP BY state
ORDER BY total_crashes DESC;

-- 11. Which app section has the most crashes on iOS vs. Android?
SELECT 
    device_type,
    app_section,
    SUM(is_crash) AS total_crashes
FROM mobileapp_ux
GROUP BY device_type, app_section
ORDER BY device_type, total_crashes DESC;


-- 12. Which feedback tags are most frequently associated with crashes?
SELECT 
    feedback_tag,
    COUNT(*) AS crash_count
FROM mobileapp_ux
WHERE is_crash = 1
GROUP BY feedback_tag
ORDER BY crash_count DESC;


-- 13. What feedback tags are most associated with high vs. low ratings?
-- Top 5
SELECT feedback_tag, 
       AVG(experience_rating) AS avg_rating,
       COUNT(*) AS total_feedbacks
FROM mobileapp_ux
GROUP BY feedback_tag
ORDER BY avg_rating DESC
LIMIT 5;

-- Bottom 5
SELECT feedback_tag, 
       AVG(experience_rating) AS avg_rating,
       COUNT(*) AS total_feedbacks
FROM mobileapp_ux
GROUP BY feedback_tag
ORDER BY avg_rating ASC
LIMIT 5;

-- 14. Analyze session duration trends by app section and device. 
SELECT 
    app_section,
    device_type,
    AVG(session_duration_sec) AS avg_session_duration,
    COUNT(*) AS session_count
FROM mobileapp_ux
GROUP BY app_section, device_type
ORDER BY app_section, device_type;

-- 15. Are crashes concentrated in certain states for specific app sections?
SELECT 
    state,
    app_section,
    COUNT(*) AS total_crashes
FROM mobileapp_ux
WHERE is_crash = 1
GROUP BY state, app_section
ORDER BY total_crashes DESC;


