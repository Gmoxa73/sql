import psycopg2

def search(con, name, surname, email):
    with con.cursor() as cur:
        cur.execute('''
                SELECT work_id 
                FROM worker
                WHERE name = %s AND surname = %s AND email = %s
            ''', (name, surname, email,))
        work_id = cur.fetchone()
    con.commit()
    if work_id:
        return work_id
    return None

def make(con):
    with con.cursor() as cur:
        cur.execute('DROP TABLE IF EXISTS telephone CASCADE;')
        cur.execute('DROP TABLE IF EXISTS worker CASCADE;')
        cur.execute('''
                    CREATE TABLE worker (
                        work_id SERIAL PRIMARY KEY,
                        name VARCHAR(40),
                        surname VARCHAR(40),
                        email VARCHAR(40)
                        );
                    ''')
        cur.execute('''
                    CREATE TABLE telephone (
                        tel_id SERIAL PRIMARY KEY, 
                        number VARCHAR(40), 
                        work_id INT NOT NULL,  
                        FOREIGN KEY (work_id) REFERENCES  worker (work_id)
                    );
                    ''')
        con.commit()

def add(con, name, surname, email, tel = None):
    with con.cursor() as cur:
        work_id = search(con, name, surname, email)
        if work_id:
            cur.execute('''
                INSERT INTO telephone (number, work_id)
                VALUES (%s, %s);
            ''', (tel, work_id,))
        else:
            cur.execute('''
                INSERT INTO worker (name, surname, email)
                VALUES (%s, %s, %s)
                RETURNING work_id;
            ''', (name, surname, email,))
            work_id = cur.fetchone()[0]

            if tel:
                cur.execute('''
                    INSERT INTO telephone (number, work_id)
                    VALUES (%s, %s);
                ''', (tel, work_id,))
        con.commit()

def change(con, name, surname, email, new_name=None, new_surname=None, new_email=None, tel=None):
    with con.cursor() as cur:
        work_id = search(con, name, surname, email)
        if work_id:
            if new_name:
                cur.execute('''
                    UPDATE work
                    name = %s
                    WHERE work_id = %s    
                ''', (new_name, work_id,))
            if new_surname:
                cur.execute('''
                    UPDATE work
                    surname = %s
                    WHERE work_id = %s    
                ''', (new_surname, work_id,))
            if new_email:
                cur.execute('''
                    UPDATE work
                    email = %s
                    WHERE work_id = %s    
                ''', (new_email, work_id,))
            if tel:
                cur.execute('''
                    INSERT INTO telephone (number, work_id)
                    VALUES (%s, %s);
                ''', (tel, work_id,))

        con.commit()

def del_tel(con, name, surname, email, tel):
    with con.cursor() as cur:
        work_id = search(con, name, surname, email)
        if work_id:
            cur.execute('''
                DELETE FROM telephone
                WHERE work_id = %s  AND number = %s;   
            ''', (work_id, tel))

        con.commit()

def del_worker(con, name, surname, email):
    with con.cursor() as cur:
        work_id = search(con, name, surname, email)
        if work_id:
            cur.execute('''
                DELETE FROM telephone
                WHERE work_id = %s;   
            ''', (work_id))
            cur.execute('''
                 DELETE FROM worker
                 WHERE work_id = %s;   
            ''', (work_id,))

def search_worker_tel(con, tel):
    with con.cursor() as cur:
        cur.execute('''
                SELECT work_id 
                FROM telephone
                WHERE number = %s
            ''', (tel,))
        work_id = cur.fetchone()
        cur.execute('''
                SELECT * 
                FROM worker
                WHERE work_id= %s
            ''', (work_id,))
        worker = cur.fetchone()
    con.commit()
    if worker:
        return worker
    return None

# Создаем подключение
conn = psycopg2.connect(database = "postgres", user = 'postgres', password = '000')
# Создаем таблицы
make(conn)
# Добавляем сотрудника
add(conn, 'QQQ', 'Wsx', 'asd@mail.ru')
add(conn, 'QQQ', 'Wsx', 'asd@mail.ru', '333-333-33-33')
add(conn, 'Qaz', 'Wsx', 'asd@mail.ru', '999-333-45-73')
add(conn, 'Qaz', 'Wsx', 'asd@mail.ru', '999-222-45-11')
print(search_worker_tel(conn, '999-333-45-73'))
del_tel(conn, 'Qaz', 'Wsx', 'asd@mail.ru', '999-222-45-11')
del_worker(conn, 'Qaz', 'Wsx', 'asd@mail.ru')
# Проверка: извлечем и выведем всех сотрудников и телефоны
with conn.cursor() as cur:
    cur.execute('SELECT w.work_id, w.name, w.surname, w.email, t.number FROM worker w LEFT JOIN telephone t ON w.work_id = t.work_id;')
    for row in cur.fetchall():
        print(row)


conn.close()
