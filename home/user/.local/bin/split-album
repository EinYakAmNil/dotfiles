import subprocess
import argparse

def audio_split(audio, description):
    with open(description, 'r') as f:
        des = f.readlines()

    ts = [i.split()[0] for i in des]
    t_end = subprocess.run(
        ["ffmpeg", "-i", audio],
        capture_output=True,
        encoding='utf-8'
    ).stderr.split('\n')
    t_end = [i.split()[1][:-1] for i in t_end if "Duration" in i][0]
    ts.append(t_end)
    names = [" ".join(i.split()[1:]) for i in des]

    for i in range(len(names)):
        subprocess.run([
            "ffmpeg", "-i", audio,
            "-c", "copy",
            "-ss", ts[i],
            "-to", ts[i+1],
            names[i]
        ])

ap = argparse.ArgumentParser()
ap.add_argument(
    "-i", "--input",
    action='store',
    nargs=1,
    type=str
)
ap.add_argument(
    "-d", "--description",
    action='store',
    nargs=1,
    type=str
)
args = ap.parse_args()
audio_split(args.input[0], args.description[0])
