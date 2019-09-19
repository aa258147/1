CREATE TABLE migration_versions (id integer PRIMARY KEY AUTOINCREMENT, version text NOT NULL);
CREATE TABLE IF NOT EXISTS "votes"(id integer PRIMARY KEY, author_id integer NOT NULL, type integer NOT NULL, weight integer NOT NULL, report_id integer, created_at text NOT NULL, updated_at text NOT NULL,FOREIGN KEY (report_id) REFERENCES reports(id));
CREATE TABLE clean_modes (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, delete_target integer NOT NULL, delay_sec integer, status integer NOT NULL, created_at text NOT NULL, updated_at text NOT NULL);
CREATE TABLE subfunctions (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, type integer NOT NULL, status integer NOT NULL, created_at text NOT NULL, updated_at text NOT NULL);
CREATE TABLE true_indices (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, msg_id integer NOT NULL, indices text, created_at text NOT NULL, updated_at text NOT NULL);
CREATE TABLE IF NOT EXISTS "reports"(id integer PRIMARY KEY, author_id integer NOT NULL, reason integer NOT NULL, status integer NOT NULL, created_at text NOT NULL, updated_at text NOT NULL, role integer NOT NULL DEFAULT 0, target_user_id integer NOT NULL DEFAULT 0, target_msg_id integer NOT NULL DEFAULT 0, from_chat_id integer NOT NULL DEFAULT 0, target_snapshot_id integer NOT NULL DEFAULT 0, post_id integer NOT NULL DEFAULT 0, detail text, appeal_post_id integer);
CREATE TABLE error_counts (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, user_id integer NOT NULL, count integer NOT NULL, created_at text NOT NULL, updated_at text NOT NULL);
CREATE TABLE max_lengths (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, total integer, rows integer, created_at text NOT NULL, updated_at text NOT NULL);
CREATE TABLE block_contents (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, version text NOT NULL, expression text NOT NULL, created_at text NOT NULL, updated_at text NOT NULL, is_enabled integer NOT NULL DEFAULT false);
CREATE TABLE private_menus (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, msg_id integer NOT NULL, group_id integer NOT NULL, created_at text NOT NULL, updated_at text NOT NULL, group_name text);
CREATE TABLE languages (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, code integer NOT NULL, auto integer NOT NULL, created_at text NOT NULL, updated_at text NOT NULL);
CREATE TABLE anti_messages (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, delete_target integer NOT NULL, created_at text NOT NULL, updated_at text NOT NULL, status integer NOT NULL DEFAULT 2);
CREATE TABLE format_limits (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, list text NOT NULL, created_at text NOT NULL, updated_at text NOT NULL);
CREATE TABLE IF NOT EXISTS "appeals"(id integer PRIMARY KEY, author_id integer NOT NULL, done integer NOT NULL, report_id integer, created_at text NOT NULL, updated_at text NOT NULL,FOREIGN KEY (report_id) REFERENCES reports(id));
CREATE TABLE templates (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, content text NOT NULL, enabled integer NOT NULL, created_at text NOT NULL, updated_at text NOT NULL);
CREATE TABLE toggles (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, target integer NOT NULL, enabled integer NOT NULL, created_at text NOT NULL, updated_at text NOT NULL);
CREATE TABLE questions (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, title text NOT NULL, desc text, note text, use_for integer NOT NULL, enabled integer NOT NULL, created_at text NOT NULL, updated_at text NOT NULL);
CREATE TABLE IF NOT EXISTS "answers"(id integer PRIMARY KEY, name text NOT NULL, corrected integer NOT NULL, question_id integer, created_at text NOT NULL, updated_at text NOT NULL,FOREIGN KEY (question_id) REFERENCES questions(id));
CREATE TABLE groups (id integer PRIMARY KEY AUTOINCREMENT, chat_id integer NOT NULL, title text NOT NULL, link text, created_at text NOT NULL, updated_at text NOT NULL, managed integer NOT NULL DEFAULT false);
CREATE TABLE admins_groups (group_id integer, admin_id integer);
CREATE TABLE admins (id integer PRIMARY KEY AUTOINCREMENT, user_id integer NOT NULL, fullname text, created_at text NOT NULL, updated_at text NOT NULL);
