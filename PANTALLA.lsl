default
{
    touch_start(integer total_number)
    {
        string url = "http://45.71.181.109:3001/api/sensors?id_team=20&id_sensor=22";
        list headers = [];
        llHTTPRequest(url, headers, "");
    }

    http_response(key request_id, integer status, list metadata, string body)
    {
        if (status == 200)
        {
            string getPropertyMsg = llJsonGetValue(body, ["msg"]);
            list tranformData = llJson2List(getPropertyMsg);

            string data = llList2String(tranformData, 0);
            string value_data = llJsonGetValue(data, ["value_data"]);
            llOwnerSay("Valor del sensor: " +  value_data);
            llSetText("Valor del sensor: " + value_data, <1.0, 1.0, 1.0>, 1.0);
        }
        else
        {
            llOwnerSay("Error GET : " + (string)status);
            llSetText("Error GET : " + status, <1.0, 1.0, 1.0>, 1.0);
        }
    }
}
