CREATE TABLE IF NOT EXISTS students (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL COLLATE NOCASE,
    age_in_months INT NOT NULL,
    dual_language_learner INT,
    analyzed_on INT,
    created INT NOT NULL,
    modified INT NOT NULL);

CREATE TABLE IF NOT EXISTS observations (
    id TEXT PRIMARY KEY,
    note TEXT NOT NULL COLLATE NOCASE,
    observed_on INT NOT NULL,
    created INT NOT NULL,
    modified INT NOT NULL);

CREATE TABLE IF NOT EXISTS file_attachments (
    id TEXT PRIMARY KEY,
    file_name TEXT NOT NULL COLLATE NOCASE,
    file_content BLOB NOT NULL,
    mime_type TEXT NOT NULL COLLATE NOCASE,
    created INT NOT NULL,

    modified INT NOT NULL);

CREATE TABLE IF NOT EXISTS observations_students (
    observation_id TEXT,
    student_id TEXT,
    PRIMARY KEY (observation_id, student_id),
    FOREIGN KEY (observation_id) REFERENCES observations(id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS file_attachments_observations (
    observation_id TEXT,
    file_attachment_id TEXT,
    PRIMARY KEY (observation_id, file_attachment_id),
    FOREIGN KEY (observation_id) REFERENCES observations(id) ON DELETE CASCADE,
    FOREIGN KEY (file_attachment_id) REFERENCES file_attachments(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS drdp_ratings (
    id TEXT PRIMARY KEY,
    measure TEXT NOT NULL,
    level TEXT NOT NULL,
    reason TEXT,
    student_id NOT NULL,
    observation_id NOT NULL,
    created INT NOT NULL,
    modified INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (observation_id) REFERENCES observations(id) ON DELETE CASCADE

);