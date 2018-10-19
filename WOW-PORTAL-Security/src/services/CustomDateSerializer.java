package services;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import java.io.IOException;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.sql.Date;

public class CustomDateSerializer
extends JsonSerializer<Date> {
    public void serialize(Date value, JsonGenerator gen, SerializerProvider arg2) throws IOException, JsonProcessingException {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        String formattedDate = formatter.format(value);
        System.out.println("$$$$$$$$$$$$ DATEEEEEEEEE   " + formattedDate);
        gen.writeString(formattedDate);
    }
}