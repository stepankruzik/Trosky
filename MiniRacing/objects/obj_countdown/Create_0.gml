// Create Event
countdown = 4 * room_speed; // Zvýšíme o 1 sekundu pro "START!"
start_display = false;      // Nová proměnná pro kontrolu zobrazení START
audio_play_sound(snd_countdown2, 1, false);
audio_sound_pitch(snd_countdown2, 0.75);
audio_sound_gain(snd_music, 0.25, 0);