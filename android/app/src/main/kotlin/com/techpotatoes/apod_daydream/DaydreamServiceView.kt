package com.techpotatoes.apod_daydream

import android.content.Context
import android.service.dreams.DreamService
import android.view.KeyEvent
import android.view.View
import android.widget.TextView

class DaydreamServiceView : DreamService() {

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
    }

    override fun onDreamingStarted() {
        super.onDreamingStarted()
    }

    override fun dispatchKeyEvent(event: KeyEvent?): Boolean {
        return super.dispatchKeyEvent(event)
    }

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