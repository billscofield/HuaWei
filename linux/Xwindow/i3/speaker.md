
speaker-test

    speaker-test - command-line speaker test tone generator for ALSA

    -c --channels NUM
        
        NUM channels in stream


    ```
    /root/.asoundrc
    
    pcm.!default {
        type hw
        card 2
    }
    
    ctl.!default {
        type hw
        card 0
    }
    
    ```
