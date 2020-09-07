package com.example.datepicker;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.DatePicker;
import android.widget.Toast;

import java.util.Calendar;

public class MainActivity extends AppCompatActivity {
DatePicker simpleDatePicker;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate (savedInstanceState);
        setContentView (R.layout.activity_main);
        simpleDatePicker=(DatePicker)findViewById (R.id.SimpleDatePicker);
        Calendar cal=Calendar.getInstance ();
        simpleDatePicker.init (cal.get (Calendar.YEAR), cal.get (Calendar.MONTH), cal.get (Calendar.DAY_OF_MONTH), new DatePicker.OnDateChangedListener ( ) {
            @Override
            public void onDateChanged(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                Toast.makeText (MainActivity.this,"Date:-"+simpleDatePicker.getYear (),Toast.LENGTH_SHORT).show ();
            }
        });
    }
}