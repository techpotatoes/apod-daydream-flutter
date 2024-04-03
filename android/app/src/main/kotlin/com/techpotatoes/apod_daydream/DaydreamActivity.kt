package com.techpotatoes.apod_daydream

import android.app.Activity
import android.content.Context
import android.view.View
import android.widget.TextView

class DaydreamActivity : Activity() {

    override fun setContentView(view: View?) {
        view?.let {
            super.setContentView(getFlutterView(view.context))
        }
    }

    private fun getFlutterView(context: Context): View {
        val text = TextView(context)
        text.text = "Testing daydream"
        text.textSize = 34f
        text.setTextColor(resources.getColor(android.R.color.black))

        return text
    }
}