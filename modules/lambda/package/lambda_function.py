import psycopg2
import os

def lambda_handler(event, context):
    try:
        conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )
        cur = conn.cursor()
        cur.execute("SELECT version();")
        db_version = cur.fetchone()
        cur.close()
        conn.close()
        return {
            'statusCode': 200,
            'body': f"Connected to DB: {db_version}"
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': str(e)
        }
