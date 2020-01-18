import functools

from flask import (
    Blueprint, g, request, session, url_for,make_response
)

from flaskApp.db import get_db

bp = Blueprint('storeData', __name__, url_prefix='/storeData')


@bp.route('/marks', methods=['POST'])
def store_marks_file():
    file = request.files['marks']
    insert_data_query = """INSERT INTO marks (id, roll_no,marks) VALUES (%s,%s,%s)"""
    data_list = file.read().splitlines()
    insert_data_query_list = []

    for row in data_list:
        r = str(row.decode("utf-8")).split(",")
        insert_data_query_list.append(tuple(r))

    db = get_db();
    db.cursor.executemany(insert_data_query,insert_data_query_list)
    db.commit()

    return make_response({"message": "data stored successfully"},200)
