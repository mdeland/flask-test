from flask import Flask
import psycopg2
import os


app = Flask(__name__)

db_user = os.environ.get('DB_USER')
db_name = os.environ.get('DB_NAME')
db_host = os.environ.get('DB_HOST')
conn_string = "host='%s' dbname='%s' user='%s'" % (db_host, db_name, db_user)

conn = psycopg2.connect(conn_string)
cur = conn.cursor()

cur.execute("drop table if exists counts")
cur.execute("create table counts (route text, ct int)")
cur.execute("insert into counts values ('/', 0)")
conn.commit()


@app.route('/')
def hello():
    cur.execute("update counts set ct = ct + 1 where route = '/'")
    conn.commit()
    cur.execute("select ct from counts where route = '/'")
    results = cur.fetchall()
    import pdb; pdb.set_trace()  # XXX BREAKPOINT
    return 'Hello World! I have been seen %s times.' % results[0]

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
