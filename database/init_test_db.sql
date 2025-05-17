BEGIN;

-- Table definitions
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    role TEXT CHECK (role IN ('Employee', 'Division Manager')),
    hire_date DATE NOT NULL,
    end_date DATE
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);

CREATE TABLE technologies (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE project_assignments (
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    assigned_on DATE NOT NULL,
    PRIMARY KEY (employee_id, project_id)
);

CREATE TABLE project_technologies (
    project_id INT NOT NULL,
    technology_id INT NOT NULL,
    PRIMARY KEY (project_id, technology_id)
);

CREATE TABLE employee_technologies (
    employee_id INT NOT NULL,
    technology_id INT NOT NULL,
    proficiency_level TEXT CHECK (proficiency_level IN ('Beginner', 'Intermediate', 'Expert')),
    known_since DATE NOT NULL,
    PRIMARY KEY (employee_id, technology_id)
);

-- Foreign key constraints
ALTER TABLE project_assignments
    ADD CONSTRAINT fk_project_assignments_employee
    FOREIGN KEY (employee_id) REFERENCES employees(id);

ALTER TABLE project_assignments
    ADD CONSTRAINT fk_project_assignments_project
    FOREIGN KEY (project_id) REFERENCES projects(id);

ALTER TABLE project_technologies
    ADD CONSTRAINT fk_project_technologies_project
    FOREIGN KEY (project_id) REFERENCES projects(id);

ALTER TABLE project_technologies
    ADD CONSTRAINT fk_project_technologies_technology
    FOREIGN KEY (technology_id) REFERENCES technologies(id);

ALTER TABLE employee_technologies
    ADD CONSTRAINT fk_employee_technologies_employee
    FOREIGN KEY (employee_id) REFERENCES employees(id);

ALTER TABLE employee_technologies
    ADD CONSTRAINT fk_employee_technologies_technology
    FOREIGN KEY (technology_id) REFERENCES technologies(id);

-- Sample data: Technologies
INSERT INTO technologies (name, category) VALUES
    ('React', 'Frontend'),
    ('Angular', 'Frontend'),
    ('Vue.js', 'Frontend'),
    ('TypeScript', 'Frontend'),
    ('JavaScript', 'Frontend'),
    ('HTML5', 'Frontend'),
    ('CSS3', 'Frontend'),
    ('Node.js', 'Backend'),
    ('Python', 'Backend'),
    ('Java', 'Backend'),
    ('Spring Boot', 'Backend'),
    ('Django', 'Backend'),
    ('Flask', 'Backend'),
    ('PostgreSQL', 'Database'),
    ('MySQL', 'Database'),
    ('MongoDB', 'Database'),
    ('Redis', 'Database'),
    ('Docker', 'DevOps'),
    ('Kubernetes', 'DevOps'),
    ('AWS', 'Cloud'),
    ('Azure', 'Cloud'),
    ('GCP', 'Cloud'),
    ('Terraform', 'DevOps'),
    ('Jenkins', 'DevOps'),
    ('Git', 'DevOps'),
    ('GraphQL', 'API'),
    ('REST', 'API'),
    ('gRPC', 'API'),
    ('Elasticsearch', 'Search'),
    ('Kafka', 'Messaging');

-- Sample data: Projects
INSERT INTO projects (name, start_date, end_date) VALUES
    ('E-commerce Platform', '2023-01-01', '2023-12-31'),
    ('Mobile Banking App', '2023-03-01', NULL),
    ('AI-Powered Analytics', '2023-02-15', NULL),
    ('Cloud Migration', '2023-01-15', '2023-06-30'),
    ('Security Enhancement', '2023-04-01', '2023-09-30'),
    ('Customer Portal', '2023-05-01', NULL),
    ('Payment Gateway', '2023-06-01', NULL),
    ('Data Warehouse', '2023-03-15', '2023-12-31'),
    ('API Gateway', '2023-07-01', NULL),
    ('DevOps Pipeline', '2023-02-01', '2023-08-31');

-- Sample data: Employees (first 10 employees shown, total 100)
INSERT INTO employees (first_name, last_name, role, hire_date, end_date) VALUES
    ('John', 'Smith', 'Division Manager', '2020-01-15', NULL),
    ('Sarah', 'Johnson', 'Employee', '2021-03-01', NULL),
    ('Michael', 'Brown', 'Employee', '2020-06-15', '2023-02-28'),
    ('Emily', 'Davis', 'Division Manager', '2019-11-01', NULL),
    ('David', 'Wilson', 'Employee', '2021-09-01', NULL),
    ('Lisa', 'Anderson', 'Employee', '2022-01-15', NULL),
    ('Robert', 'Taylor', 'Division Manager', '2020-03-15', NULL),
    ('Jennifer', 'Thomas', 'Employee', '2021-12-01', NULL),
    ('William', 'Jackson', 'Employee', '2022-03-01', NULL),
    ('Mary', 'White', 'Employee', '2021-06-15', '2023-05-31');

-- Additional Employees (90 more)
INSERT INTO employees (first_name, last_name, role, hire_date, end_date) VALUES
    ('James', 'Miller', 'Employee', '2022-04-01', NULL),
    ('Patricia', 'Moore', 'Employee', '2021-07-15', NULL),
    ('Richard', 'Lee', 'Division Manager', '2020-09-01', NULL),
    ('Elizabeth', 'Garcia', 'Employee', '2022-02-15', NULL),
    ('Joseph', 'Rodriguez', 'Employee', '2021-11-01', NULL),
    ('Margaret', 'Martinez', 'Employee', '2022-05-15', NULL),
    ('Charles', 'Hernandez', 'Division Manager', '2020-12-01', NULL),
    ('Susan', 'Lopez', 'Employee', '2022-03-01', NULL),
    ('Thomas', 'Gonzalez', 'Employee', '2021-10-15', NULL),
    ('Jessica', 'Wilson', 'Employee', '2022-06-01', NULL),
    ('Christopher', 'Anderson', 'Division Manager', '2021-01-15', NULL),
    ('Sarah', 'Thomas', 'Employee', '2022-07-15', NULL),
    ('Daniel', 'Taylor', 'Employee', '2021-12-15', NULL),
    ('Karen', 'Moore', 'Employee', '2022-08-01', NULL),
    ('Paul', 'Jackson', 'Division Manager', '2021-02-15', NULL),
    ('Nancy', 'Martin', 'Employee', '2022-09-15', NULL),
    ('Mark', 'Lee', 'Employee', '2021-03-15', NULL),
    ('Lisa', 'Perez', 'Employee', '2022-10-01', NULL),
    ('Donald', 'Thompson', 'Division Manager', '2021-04-15', NULL),
    ('Betty', 'White', 'Employee', '2022-11-15', NULL),
    ('George', 'Harris', 'Employee', '2021-05-15', NULL),
    ('Helen', 'Sanchez', 'Employee', '2022-12-01', NULL),
    ('Kenneth', 'Clark', 'Division Manager', '2021-06-15', NULL),
    ('Sandra', 'Ramirez', 'Employee', '2023-01-15', NULL),
    ('Edward', 'Lewis', 'Employee', '2021-07-15', NULL),
    ('Donna', 'Robinson', 'Employee', '2023-02-01', NULL),
    ('Brian', 'Walker', 'Division Manager', '2021-08-15', NULL),
    ('Carol', 'Young', 'Employee', '2023-03-15', NULL),
    ('Ronald', 'Allen', 'Employee', '2021-09-15', NULL),
    ('Ruth', 'King', 'Employee', '2023-04-01', NULL),
    ('Anthony', 'Wright', 'Division Manager', '2021-10-15', NULL),
    ('Sharon', 'Scott', 'Employee', '2023-05-15', NULL),
    ('Kevin', 'Torres', 'Employee', '2021-11-15', NULL),
    ('Michelle', 'Nguyen', 'Employee', '2023-06-01', NULL),
    ('Jason', 'Hill', 'Division Manager', '2021-12-15', NULL),
    ('Laura', 'Flores', 'Employee', '2023-07-15', NULL),
    ('Matthew', 'Green', 'Employee', '2022-01-15', NULL),
    ('Amanda', 'Adams', 'Employee', '2023-08-01', NULL),
    ('Gary', 'Nelson', 'Division Manager', '2022-02-15', NULL),
    ('Melissa', 'Baker', 'Employee', '2023-09-15', NULL),
    ('Timothy', 'Hall', 'Employee', '2022-03-15', NULL),
    ('Deborah', 'Rivera', 'Employee', '2023-10-01', NULL),
    ('Jose', 'Campbell', 'Division Manager', '2022-04-15', NULL),
    ('Stephanie', 'Mitchell', 'Employee', '2023-11-15', NULL),
    ('Larry', 'Carter', 'Employee', '2022-05-15', NULL),
    ('Rebecca', 'Roberts', 'Employee', '2023-12-01', NULL),
    ('Jeffrey', 'Gomez', 'Division Manager', '2022-06-15', NULL),
    ('Laura', 'Phillips', 'Employee', '2024-01-15', NULL),
    ('Frank', 'Evans', 'Employee', '2022-07-15', NULL),
    ('Sharon', 'Turner', 'Employee', '2024-02-01', NULL),
    ('Scott', 'Diaz', 'Division Manager', '2022-08-15', NULL),
    ('Cynthia', 'Parker', 'Employee', '2024-03-15', NULL),
    ('Eric', 'Cruz', 'Employee', '2022-09-15', NULL),
    ('Kathleen', 'Edwards', 'Employee', '2024-04-01', NULL),
    ('Stephen', 'Collins', 'Division Manager', '2022-10-15', NULL),
    ('Amy', 'Stewart', 'Employee', '2024-05-15', NULL),
    ('Andrew', 'Morris', 'Employee', '2022-11-15', NULL),
    ('Angela', 'Morales', 'Employee', '2024-06-01', NULL),
    ('Raymond', 'Murphy', 'Division Manager', '2022-12-15', NULL),
    ('Kimberly', 'Cook', 'Employee', '2024-07-15', NULL),
    ('Gregory', 'Rogers', 'Employee', '2023-01-15', NULL),
    ('Emily', 'Reed', 'Employee', '2024-08-01', NULL),
    ('Joshua', 'Morgan', 'Division Manager', '2023-02-15', NULL),
    ('Michelle', 'Peterson', 'Employee', '2024-09-15', NULL),
    ('Jerry', 'Cooper', 'Employee', '2023-03-15', NULL),
    ('Carolyn', 'Bailey', 'Employee', '2024-10-01', NULL),
    ('Dennis', 'Howard', 'Division Manager', '2023-04-15', NULL),
    ('Christine', 'Richardson', 'Employee', '2024-11-15', NULL),
    ('Walter', 'Cox', 'Employee', '2023-05-15', NULL),
    ('Marie', 'Ward', 'Employee', '2024-12-01', NULL),
    ('Peter', 'Torres', 'Division Manager', '2023-06-15', NULL),
    ('Janet', 'Peterson', 'Employee', '2025-01-15', NULL),
    ('Harold', 'Gray', 'Employee', '2023-07-15', NULL),
    ('Catherine', 'Ramirez', 'Employee', '2025-02-01', NULL),
    ('Douglas', 'James', 'Division Manager', '2023-08-15', NULL),
    ('Frances', 'Watson', 'Employee', '2025-03-15', NULL),
    ('Henry', 'Brooks', 'Employee', '2023-09-15', NULL),
    ('Ann', 'Kelly', 'Employee', '2025-04-01', NULL),
    ('Carl', 'Sanders', 'Division Manager', '2023-10-15', NULL),
    ('Joyce', 'Price', 'Employee', '2025-05-15', NULL),
    ('Arthur', 'Bennett', 'Employee', '2023-11-15', NULL),
    ('Diane', 'Wood', 'Employee', '2025-06-01', NULL),
    ('Ryan', 'Barnes', 'Division Manager', '2023-12-15', NULL),
    ('Alice', 'Ross', 'Employee', '2025-07-15', NULL),
    ('Ralph', 'Henderson', 'Employee', '2024-01-15', NULL),
    ('Julia', 'Coleman', 'Employee', '2025-08-01', NULL),
    ('Roy', 'Jenkins', 'Division Manager', '2024-02-15', NULL),
    ('Heather', 'Perry', 'Employee', '2025-09-15', NULL),
    ('Bryan', 'Powell', 'Employee', '2024-03-15', NULL),
    ('Teresa', 'Long', 'Employee', '2025-10-01', NULL),
    ('Eugene', 'Patterson', 'Division Manager', '2024-04-15', NULL),
    ('Doris', 'Hughes', 'Employee', '2025-11-15', NULL),
    ('Louis', 'Foster', 'Employee', '2024-05-15', NULL),
    ('Gloria', 'Butler', 'Employee', '2025-12-01', NULL),
    ('Wayne', 'Simmons', 'Division Manager', '2024-06-15', NULL),
    ('Evelyn', 'Bryant', 'Employee', '2026-01-15', NULL),
    ('Alan', 'Russell', 'Employee', '2024-07-15', NULL),
    ('Jean', 'Griffin', 'Employee', '2026-02-01', NULL),
    ('Johnny', 'Diaz', 'Division Manager', '2024-08-15', NULL),
    ('Cheryl', 'Hayes', 'Employee', '2026-03-15', NULL);

-- Sample data: Project Assignments (first 5 assignments shown)
INSERT INTO project_assignments (employee_id, project_id, assigned_on) VALUES
    (1, 1, '2023-01-01'),
    (2, 1, '2023-01-15'),
    (3, 2, '2023-03-01'),
    (4, 3, '2023-02-15'),
    (5, 1, '2023-01-20');

-- Additional Project Assignments (2-3 per employee)
INSERT INTO project_assignments (employee_id, project_id, assigned_on) VALUES
    (1, 2, '2023-03-01'),
    (1, 3, '2023-02-15'),
    (2, 3, '2023-02-15'),
    (2, 4, '2023-01-15'),
    (3, 3, '2023-02-15'),
    (4, 4, '2023-01-15'),
    (4, 5, '2023-04-01'),
    (5, 2, '2023-03-01'),
    (5, 3, '2023-02-15'),
    (6, 4, '2023-01-15'),
    (6, 5, '2023-04-01'),
    (7, 5, '2023-04-01'),
    (7, 6, '2023-05-01'),
    (8, 6, '2023-05-01'),
    (8, 7, '2023-06-01'),
    (9, 7, '2023-06-01'),
    (9, 8, '2023-03-15'),
    (10, 8, '2023-03-15'),
    (10, 9, '2023-07-01'),
    (11, 9, '2023-07-01'),
    (11, 10, '2023-02-01'),
    (12, 1, '2023-01-01'),
    (12, 2, '2023-03-01'),
    (13, 2, '2023-03-01'),
    (13, 3, '2023-02-15'),
    (14, 3, '2023-02-15'),
    (14, 4, '2023-01-15'),
    (15, 4, '2023-01-15'),
    (15, 5, '2023-04-01'),
    (16, 5, '2023-04-01'),
    (16, 6, '2023-05-01'),
    (17, 6, '2023-05-01'),
    (17, 7, '2023-06-01'),
    (18, 7, '2023-06-01'),
    (18, 8, '2023-03-15'),
    (19, 8, '2023-03-15'),
    (19, 9, '2023-07-01'),
    (20, 9, '2023-07-01'),
    (20, 10, '2023-02-01');

-- Sample data: Project Technologies (first 5 associations shown)
INSERT INTO project_technologies (project_id, technology_id) VALUES
    (1, 1), -- E-commerce Platform uses React
    (1, 8), -- E-commerce Platform uses Node.js
    (1, 14), -- E-commerce Platform uses PostgreSQL
    (2, 2), -- Mobile Banking App uses Angular
    (2, 9); -- Mobile Banking App uses Python

-- Additional Project Technologies (2-4 per project)
INSERT INTO project_technologies (project_id, technology_id) VALUES
    (1, 5), -- E-commerce Platform uses JavaScript
    (1, 6), -- E-commerce Platform uses HTML5
    (1, 7), -- E-commerce Platform uses CSS3
    (2, 3), -- Mobile Banking App uses Vue.js
    (2, 4), -- Mobile Banking App uses TypeScript
    (2, 14), -- Mobile Banking App uses PostgreSQL
    (3, 9), -- AI-Powered Analytics uses Python
    (3, 15), -- AI-Powered Analytics uses MySQL
    (3, 29), -- AI-Powered Analytics uses Elasticsearch
    (4, 18), -- Cloud Migration uses Docker
    (4, 19), -- Cloud Migration uses Kubernetes
    (4, 20), -- Cloud Migration uses AWS
    (5, 23), -- Security Enhancement uses Terraform
    (5, 24), -- Security Enhancement uses Jenkins
    (6, 1), -- Customer Portal uses React
    (6, 4), -- Customer Portal uses TypeScript
    (6, 26), -- Customer Portal uses GraphQL
    (7, 8), -- Payment Gateway uses Node.js
    (7, 14), -- Payment Gateway uses PostgreSQL
    (7, 27), -- Payment Gateway uses REST
    (8, 15), -- Data Warehouse uses MySQL
    (8, 29), -- Data Warehouse uses Elasticsearch
    (8, 30), -- Data Warehouse uses Kafka
    (9, 8), -- API Gateway uses Node.js
    (9, 26), -- API Gateway uses GraphQL
    (9, 27), -- API Gateway uses REST
    (10, 18), -- DevOps Pipeline uses Docker
    (10, 19), -- DevOps Pipeline uses Kubernetes
    (10, 23), -- DevOps Pipeline uses Terraform
    (10, 24); -- DevOps Pipeline uses Jenkins

-- Sample data: Employee Technologies (first 5 skills shown)
INSERT INTO employee_technologies (employee_id, technology_id, proficiency_level, known_since) VALUES
    (1, 1, 'Expert', '2018-01-01'),
    (1, 8, 'Expert', '2017-06-01'),
    (2, 1, 'Intermediate', '2020-03-01'),
    (2, 5, 'Expert', '2019-01-01'),
    (3, 2, 'Expert', '2018-09-01');

-- Additional Employee Technologies (3-5 per employee)
INSERT INTO employee_technologies (employee_id, technology_id, proficiency_level, known_since) VALUES
    (1, 5, 'Expert', '2017-01-01'),
    (1, 14, 'Expert', '2016-06-01'),
    (2, 8, 'Intermediate', '2020-01-01'),
    (2, 14, 'Beginner', '2021-03-01'),
    (3, 9, 'Expert', '2018-03-01'),
    (3, 15, 'Intermediate', '2019-06-01'),
    (4, 18, 'Expert', '2017-09-01'),
    (4, 19, 'Expert', '2018-01-01'),
    (4, 20, 'Intermediate', '2019-03-01'),
    (5, 1, 'Expert', '2018-06-01'),
    (5, 4, 'Expert', '2019-01-01'),
    (5, 5, 'Expert', '2017-03-01'),
    (6, 8, 'Intermediate', '2020-06-01'),
    (6, 14, 'Beginner', '2021-09-01'),
    (6, 27, 'Intermediate', '2020-12-01'),
    (7, 18, 'Expert', '2017-12-01'),
    (7, 19, 'Expert', '2018-03-01'),
    (7, 23, 'Expert', '2018-06-01'),
    (8, 1, 'Expert', '2018-09-01'),
    (8, 4, 'Expert', '2019-03-01'),
    (8, 26, 'Intermediate', '2020-06-01'),
    (9, 9, 'Expert', '2017-06-01'),
    (9, 15, 'Expert', '2018-01-01'),
    (9, 29, 'Intermediate', '2019-06-01'),
    (10, 8, 'Expert', '2018-03-01'),
    (10, 14, 'Expert', '2018-09-01'),
    (10, 27, 'Expert', '2019-03-01'),
    (10, 30, 'Intermediate', '2020-06-01');

COMMIT; 