# askdb
Oracle of Technology - AI bot for Project Database Analysis

Technologies:
Solution: LangFlow, Docker
AI Engine: Google Gemini 2.0 flash
Test DB: PostgreSQL

Local testing:
sudo docker-compose up --build

---> http://localhost:7860

Example flow components:

Google generative AI
- Model: Google gemini-2.0-flash
- Max output tokens: 1000000
- Google API key
- System message: You are only allowed to generate read-only SQL queries (e.g., SELECT). Never generate INSERT, UPDATE, DELETE, DROP, or other modifying statements.

SQL Agent
- Database URI: postgresql://postgres:mysecretpassword@testdb:5432/postgres

Chat input

Chat output


Example requests:
- What tables are available?
- What tech was used, when and where?