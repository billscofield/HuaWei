一般的用法:

    youtube-dl -f best --write-sub --sub-lang en --write-auto-sub --yes-playlist  URL


1. General Options:
    
    -U, --update                Update this program to latest version. Make sure
                                that you have sufficient permissions (run with
                                sudo if needed)

    -c, --continue              Force resume of partially downloaded files. By
                                default, youtube-dl will resume downloads if possible.
    
    -w, --no-overwrites         Do not overwrite files

    -i, --ignore-errors         Continue on download errors, for example to
                                skip unavailable videos in a playlist

    -o, --output TEMPLATE       Output filename template, see the "OUTPUT
                                TEMPLATE" for all the info

    --skip-download             Do not download the video

    -a, --batch-file FILE       File containing URLs to download ('-' for
                                stdin), one URL per line. Lines starting with
                                '#', ';' or ']' are considered as comments and
                                ignored.

2. Video Format Options:

    -f, --format FORMAT         Video format code, see the "FORMAT SELECTION" for all the inf

    -F, --list-formats          List all available formats of requested video

3. Video Selection:

    --playlist-start NUMBER     Playlist video to start at (default is 1)

    --playlist-end NUMBER       Playlist video to end at (default is last)

    --playlist-items ITEM_SPEC  Playlist video items to download. Specify
                                indices of the videos in the playlist separated
                                by commas like: "--playlist-items 1,2,5,8" if
                                you want to download videos indexed 1, 2, 5, 8
                                in the playlist. You can specify range:
                                "--playlist-items 1-3,7,10-13", it will
                                download the videos at index 1, 2, 3, 7, 10, 11,
                                12 and 13.

    --no-playlist               Download only the video, if the URL refers to a
                                video and a playlist.

    --yes-playlist              Download the playlist, if the URL refers to a
                                video and a playlist.



4. Subtitle Options:

    --write-sub                 Write subtitle file

    --write-auto-sub            Write automatically generated subtitle file (YouTube only)

    --all-subs                  Download all the available subtitles of the video

    --list-subs                 List all available subtitles for the video

    --sub-format FORMAT         Subtitle format, accepts formats preference, for
                                example: "srt" or "ass/srt/best"

    --sub-lang LANGS            Languages of the subtitles to download (optional)
                                separated by commas, use --list-subs for
                                available language tags

5. Post-processing Options:

    -x, --extract-audio         Convert video files to audio-only files
                                (requires ffmpeg/avconv and ffprobe/avprobe)

    --audio-format FORMAT       Specify audio format: "best", "aac", "flac",
                                "mp3", "m4a", "opus", "vorbis", or "wav";
                                "best" by default; No effect without -x

    --recode-video FORMAT       Encode the video to another format if necessary
                                (currently supported: mp4|flv|ogg|webm|mkv|avi)

    --postprocessor-args ARGS   Give these arguments to the postprocessor

    -k, --keep-video            Keep the video file on disk after the
                                post-processing; the video is erased by default

    --embed-subs                Embed subtitles in the video (only for mp4,
                                webm and mkv videos)


6. Network Options: 

    --proxy URL                 Use the specified HTTP/HTTPS/SOCKS proxy. To
                                enable SOCKS proxy, specify a proper scheme.
                                For example socks5: //127.0.0.1:1080/. Pass in
                                an empty string (--proxy "") for direct
                                connection


## OUTPUT TEMPLATE

id (string): Video identifier

title (string): Video title

url (string): Video URL

ext (string): Video filename extension

alt_title (string): A secondary title of the video





