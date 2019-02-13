package com.robinmayo.hellobye;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.util.Log;


public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    private Button sayButton;
    private TextView textView;
    private int cpt;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = findViewById(R.id.textView);
        sayButton = findViewById(R.id.Say);
        sayButton.setOnClickListener(this);
        cpt = 0;
    }

    @Override
    public void onClick(View v) {
        if (cpt == 0) {
            sayButton.setText(R.string.SayBye);
            textView.setText(R.string.Hello);
        } else {
            if (cpt % 2 == 1) {
                sayButton.setText(R.string.SayHello);
                textView.setText(R.string.Bye);
            } else {
                sayButton.setText(R.string.SayBye);
                textView.setText(R.string.Hello);
            }
        }
        cpt += 1;
    }
}
