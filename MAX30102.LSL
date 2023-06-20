integer minRange = 55;
integer maxRange = 80;

default
{
    touch_start(integer total_number)
    {
        integer randomNumber = llFloor(llFrand(maxRange - minRange + 1) + minRange);
        string sensorValue = (string)randomNumber;

        string url = "http://45.71.181.109:3001/api/sensors/update?id_team=20&id_sensor=22&value_data=" + sensorValue;
        llHTTPRequest(url, [], "");
    }

    http_response(key request_id, integer status, list metadata, string body)
    {
        if (status == 200)
        {
            string jsonData = llJsonGetValue(body, ["data"]);
            if (jsonData != "")
            {
                string dataValue =  llJsonGetValue(jsonData, ["value_data"]);
                if (dataValue != "")
                {
                    llSetText("Valor del sensor: " + dataValue, <1.0, 1.0, 1.0>, 1.0);  
                    llOwnerSay("Valor del sensor: " + dataValue);
                }
                else
                {
                    llOwnerSay("No se encontró el atributo 'data_value' en la respuesta.");
                }
            }else
            {
              llSetText("NOT_FOUND_DATA_IN_RESPONSE", <1.0, 1.0, 1.0>, 1.0);
            }
        }
        else
        {
            llSetText("ERROR_UPDATE_VALUE " + (string)status, <1.0, 1.0, 1.0>, 1.0);
            llOwnerSay("Error al realizar la solicitud de actualizar valor " + (string)status);
        }
    }
}
