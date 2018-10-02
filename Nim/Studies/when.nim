when system.hostOS == "windows":
    echo "running on Wondows!"
elif system.hostOS == "linux":
    echo "running on Linux!"
elif system.hostOS == "macosx":
    echo "running on Mac OS X!"
else:
    echo "unknown operationg system"
