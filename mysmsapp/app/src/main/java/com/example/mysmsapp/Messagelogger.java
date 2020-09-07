package com.example.mysmsapp;

import android.content.Context;
import android.content.SharedPreferences;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * A simple logger that uses shared preferences to log messages, their reads
 * and replies. Don't use this in a real world application. This logger is only
 * used for displaying the messages in the text view.
 */
class MessageLogger {

    private static final String PREF_MESSAGE = "MESSAGE_LOGGER";
    private static final DateFormat DATE_FORMAT = SimpleDateFormat.getDateTimeInstance();
    private static final String LINE_BREAKS = "\n\n";

    public static final String LOG_KEY = "message_data";

    public static void logMessage(Context context, String message) {
        SharedPreferences prefs = getPrefs(context);
        message = DATE_FORMAT.format(new Date(System.currentTimeMillis())) + ": " + message;
        prefs.edit()
                .putString(LOG_KEY, prefs.getString(LOG_KEY, "") + LINE_BREAKS + message)
                .apply();
    }

    public static SharedPreferences getPrefs(Context context) {
        return context.getSharedPreferences(PREF_MESSAGE, Context.MODE_PRIVATE);
    }

    public static String getAllMessages(Context context) {
        return getPrefs(context).getString(LOG_KEY, "");
    }

    public static void clear(Context context) {
        getPrefs(context).edit().remove(LOG_KEY).apply();
    }
}

